FROM python:3.7
WORKDIR /code
COPY requirements.txt /code
RUN pip install -r requirements.txt --no-cache-dir
ENV ENVIRONMENT=DEV
ENV HOST=localhost
ENV PORT=8000
ENV EDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV REDIS_DB=0
COPY . /code
CMD python hello.py