FROM 97ms/unbuntu-demo
RUN apt update
RUN apt install -y build-essential
RUN apt install -y python3

COPY . /app
WORKDIR /app

CMD ["python3" , "code/hello.py"]