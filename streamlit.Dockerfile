FROM python:3.8-slim as streamlit

COPY ./BackgroundRemoval-main/ /app/BackgroundRemoval
COPY ./data/u2net.onnx /root/.u2net/u2net.onnx

WORKDIR /app/BackgroundRemoval

RUN pip3 install -r requirements.txt

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "bg_remove.py", "--server.port=8501", "--server.address=0.0.0.0", "--server.enableCORS=false", "--server.enableXsrfProtection=false"]
