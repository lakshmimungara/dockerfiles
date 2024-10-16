# -> It is used to set the current working directory inside docker image

# FROM almalinux:9 
# RUN mkdir /tmp/docker 
# RUN cd /tmp/docker 
# RUN pwd    # 
# RUN echo "Hello" > hello.txt 
# CMD ["sleep", "100"]

# docker build -t workdir:v1 .
# docker run -d workdir:v1 
# docker exec -it <container-id> bash 

# find / -iname "hello.txt"  -> It shows the where the file is located 
# cd / 
# ls -l 
# cat hello.txt 

# -> cd command doesn't work when we are going to move different directory. so, we are using workdir

FROM almalinux:9 
RUN mkdir /tmp/docker 
WORKDIR /tmp/docker 
RUN pwd 
RUN echo "Hello" > hello.txt 
CMD ["sleep", "100"]

# docker build -t workdir:v1 .
# docker run -d workdir:v1 
# docker exec -it <container-id> bash