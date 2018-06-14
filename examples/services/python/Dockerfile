FROM python:3.6.3
RUN mkdir /app
WORKDIR /app
ADD requirements.txt .
RUN pip install -r requirements.txt
ADD *.py ./
CMD python client.py
