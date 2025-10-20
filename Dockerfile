FROM python:3.9-slim

WORKDIR /app

COPY . .

ENV PYTHONUNBUFFERED=1

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "--access-logfile", "-", "--error-logfile", "-", "-b", "0.0.0.0:5000", "app:app"]

