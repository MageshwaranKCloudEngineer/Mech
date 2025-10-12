

# 🚗 MechWiz — Cloud-Based Warranty & Service Management System

**MechWiz** is a scalable, cloud-native platform built to simplify warranty handling and vehicle service scheduling. Designed for service centers and vehicle owners alike, it offers real-time booking, automated warranty validation, and location-based service center discovery — all backed by AWS cloud infrastructure.

---

## 🌐 Overview

MechWiz is a fully cloud-based application that digitizes and streamlines warranty registration, service appointments, and customer communication. Built using modern serverless architecture, it integrates:

* **Python Flask** for backend logic
* **AWS DynamoDB** for high-performance NoSQL storage
* **AWS Lambda & API Gateway** for serverless scalability
* **AWS Elastic Beanstalk** for resilient deployment
* **GitHub Actions** for seamless CI/CD integration

---

## 🚀 Features

* **🔢 Warranty Calculator API** – Determines expiration based on purchase date & duration.
* **📍 Service Centre Locator API** – Finds nearby authorized service locations.
* **📆 Book Appointment API** – Lets users schedule repair visits.
* **➕ Add Service Centre API** – Admins can register new service locations.
* **💡 Responsive Frontend** – Built with Bootstrap 5 for intuitive UX.
* **⚙️ Serverless Backend** – Powered by AWS Lambda & API Gateway.
* **🗃️ NoSQL Database** – DynamoDB securely stores all key data.
* **🔄 CI/CD Pipeline** – GitHub Actions automate builds & deployment.
* **📨 Real-Time Notifications** – Booking confirmations via AWS SNS.

---

## 🛠️ Tech Stack

| Layer             | Technology                                     |
| ----------------- | ---------------------------------------------- |
| **Frontend**      | HTML, CSS, JavaScript, Bootstrap 5             |
| **Backend**       | Python Flask, AWS Lambda, AWS API Gateway      |
| **Database**      | AWS DynamoDB                                   |
| **Deployment**    | AWS Elastic Beanstalk, Amazon S3               |
| **CI/CD**         | GitHub Actions                                 |
| **Notifications** | AWS SNS                                        |
| **Other Tools**   | Boto3 (AWS SDK), Zappa (Serverless deployment) |

---

## 📁 Project Structure

```bash
MechWiz/
├── index.html                  # Main homepage
├── appointment_booking.html    # Booking interface
├── add_service_center.html     # Admin panel to add centers
├── warranty_check.html         # Warranty verification form
├── service_centers.html        # Service center locator
├── style.css                   # Styling for UI
├── app.js                      # Frontend JavaScript
└── backend/                    # Flask app & AWS Lambda handlers
```

---

## ⚙️ Setup Instructions

### ✅ Prerequisites

* Python 3.8+
* Node.js & npm
* AWS CLI with credentials configured
* GitHub account (for CI/CD)
* AWS account with access to: Lambda, API Gateway, DynamoDB, Elastic Beanstalk, S3, SNS

### 🧩 Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/MageshwaranKCloudEngineer/MechWiz.git
cd MechWiz
```

#### 2. Backend Setup

```bash
pip install -r requirements.txt
zappa deploy
```

#### 3. Frontend Setup

```bash
npm install
# Upload assets to S3 and link to Elastic Beanstalk
```

#### 4. Configure DynamoDB

* `ServicecentersTable` – Stores service centers
* `APPOINTMENT_TABLE` – Stores appointment bookings
* `Warranty_table` – Stores warranty details

Use Boto3 in the backend to connect.

#### 5. Setup CI/CD

* Add AWS credentials to GitHub Secrets
* Edit `.github/workflows/main.yml` for automated deployment

#### 6. Local Development (Optional)

```bash
python app.py
# Access via http://localhost:5000
```

---

## ☁️ Deployment

Deployed via **AWS Elastic Beanstalk**. CI/CD using **GitHub Actions** automates:

* Pulling from GitHub repo
* Creating and uploading build artifacts to S3
* Deploying to Elastic Beanstalk

Manual deployment:

```bash
eb deploy
```

---

## 📱 Usage

Launch the app via your Elastic Beanstalk URL.

### From the Homepage (`index.html`), users can:

* ✅ Check warranty (`warranty_check.html`)
* 🛠️ Find service centers (`service_centers.html`)
* 📅 Book appointments (`appointment_booking.html`)
* 🏢 Add new centers (`add_service_center.html`)

---

## 📈 Non-Functional Requirements

* **Performance**: Low-latency API responses
* **Security**: HTTPS + GDPR-compliant data handling
* **Reliability**: 99.9% uptime via managed AWS services
* **Scalability**: Auto-scaling for backend and database
* **Caching**: Optimized API calls

---

## 🔮 Future Enhancements

* 🔧 Predictive maintenance powered by AI
* 🌍 Multi-cloud analytics dashboard
* 🚀 Zero-downtime deployments (blue/green)
* ✅ Staging environments for advanced testing

---

## 📚 References

* [AWS Documentation](https://docs.aws.amazon.com/)
* [Flask Documentation](https://flask.palletsprojects.com/)
* [GitHub Actions Docs](https://docs.github.com/en/actions)

---

## 👨‍💻 Author

**Mageshwaran Kumaresan**
MSc Cloud Computing, National College of Ireland
📧 [X23216522@student.ncirl.ie](mailto:X23216522@student.ncirl.ie)

---

