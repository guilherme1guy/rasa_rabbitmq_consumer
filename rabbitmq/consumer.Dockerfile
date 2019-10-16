FROM python:3.6-slim

RUN python -m pip install --upgrade pip

COPY . /app
WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt
RUN python -c "import nltk; nltk.download('stopwords');"
RUN find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

ENTRYPOINT [ "python" ]
