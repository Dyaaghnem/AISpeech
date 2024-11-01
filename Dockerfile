
FROM python:3.11


WORKDIR /app


RUN apt-get update && apt-get install -y \
    libcairo2-dev \
    libgirepository1.0-dev \
    pkg-config \
    python3-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*


COPY . /app


RUN python -m venv /opt/venv && . /opt/venv/bin/activate && pip install -r requirements.txt


EXPOSE 8000


ENV NAME World


CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:myapp"]
