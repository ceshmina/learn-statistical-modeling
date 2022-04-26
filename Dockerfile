FROM python:3.9.12

COPY requirements.txt .
RUN pip3 install --upgrade pip \
    && pip3 install -r requirements.txt
