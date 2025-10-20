import pytest
import json
from unittest.mock import patch, MagicMock
from app import app  # Replace with your actual flask app module name

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_page(client):
    """Test the home page returns 200 and expected content"""
    rv = client.get('/')
    assert rv.status_code == 200
    assert b"<!DOCTYPE html>" in rv.data  # Assuming your templates render normal HTML

def test_add_service_center_page(client):
    rv = client.get('/add-service-center-page')
    assert rv.status_code == 200
    assert b"<!DOCTYPE html>" in rv.data

def test_check_warranty_page(client):
    rv = client.get('/check-warranty')
    assert rv.status_code == 200
    assert b"<!DOCTYPE html>" in rv.data

def test_service_centers_page(client):
    rv = client.get('/service-centers-page')
    assert rv.status_code == 200
    assert b"<!DOCTYPE html>" in rv.data

def test_book_appointment_page(client):
    rv = client.get('/book-appointment')
    assert rv.status_code == 200
    assert b"<!DOCTYPE html>" in rv.data

@patch('app.service_centers_table')
def test_get_service_center_by_id_found(mock_table, client):
    # Mock DynamoDB get_item response
    mock_table.get_item.return_value = {
        "Item": {
            "id": "123",
            "name": "Test Center",
            "address": "123 Street",
            "location": "City",
            "type": "TypeA"
        }
    }
    rv = client.get('/service-center/123')
    assert rv.status_code == 200
    data = rv.get_json()
    assert data["id"] == "123"
    assert data["name"] == "Test Center"

@patch('app.service_centers_table')
def test_get_service_center_by_id_not_found(mock_table, client):
    mock_table.get_item.return_value = {}
    rv = client.get('/service-center/999')
    assert rv.status_code == 404
    data = rv.get_json()
    assert "error" in data

@patch('app.service_centers_table')
def test_add_service_center_success(mock_table, client):
    mock_table.put_item.return_value = {}
    new_center = {
        "name": "New Center",
        "address": "456 Lane",
        "location": "Town",
        "type": "TypeB"
    }
    rv = client.post('/api/add-service-center', json=new_center)
    assert rv.status_code == 200
    data = rv.get_json()
    assert data["status"] == "Service center added successfully!"
    # Verify put_item called with expected keys
    args, kwargs = mock_table.put_item.call_args
    item = kwargs.get("Item")
    assert item is not None
    assert item["name"] == "New Center"

@patch('app.service_centers_table')
def test_add_service_center_failure(mock_table, client):
    mock_table.put_item.side_effect = Exception("DynamoDB error")
    new_center = {
        "name": "Fail Center",
        "address": "789 Road",
        "location": "Village",
        "type": "TypeC"
    }
    rv = client.post('/api/add-service-center', json=new_center)
    assert rv.status_code == 500
    data = rv.get_json()
    assert "error" in data
