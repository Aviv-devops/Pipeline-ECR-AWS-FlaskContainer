FROM python:3
WORKDIR /app
COPY . .
ENV FLASK_APP=app.py
EXPOSE 5000:5000
RUN pip install flask
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
