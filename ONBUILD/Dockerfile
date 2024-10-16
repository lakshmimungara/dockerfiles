# -> ONBUILD develops image adds to the image a trigger instruction to be excuted at a later time  
# -> It is used to trigger few instructions at build when a user is using our image 
# -> It doesn't trigger when the image author uses 

FROM almalinux:9
RUN dnf install nginx -y 
RUN rm -rf /usr/share/nginx/html/index.html 
# This onbuild instruction runs only, when any user uses the image 
ONBUILD COPY index.html /usr/share/nginx/html/index.html 
CMD ["nginx", "-g", "daemon off;"]

# docker build -t onbuild:v1 . 
# docker images 

# create another folder in vs code -> test and add the Dockerfile 

# FROM onbuild:v1 
# # we can take base image what we have created 

# cd test/ 
# docker build -t onbuild:v1 . 

# -> we can use that image but have some conditions that we should keep index.html in our working directory 

# create index.html file and add content --> <h1>This image is created by onbuild base</h1>

# docker build -t onbuild-test:v1 .
# docker run -d -p 8080:80 onbuild-test:v1 