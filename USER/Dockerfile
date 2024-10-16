# -> for security you should not run containers using root user, it must be on normal user. Atleast last instruction should be USER <some-username> 

# -> containers doesn't have any root access 
# -> container is a part of the host so it doesn't have seperate storage 

# FROM almalinux:9
# RUN dnf install nginx -y 
# CMD ["nginx", "-g", "daemon off;"]

# docker build -t useR:v1 . 
# docker run -d -p 80:80 user:v1 
# docker exec -it <container-id> bash 

# -> Container doesn't have any seperate storage 
# -> If we given root access to container it can access host and can get some secuirty issues 
# -> USER instruction can be useful in this case 

# FROM almalinux:9 
# CMD ["sleep", "100"]

# docker build -t useR:v1 . 
# docker run -d user:v1 
# docker exec -it <container-id> bash 

# -> this is not a best practice to take root acces 

FROM almalinux:9 
RUN useradd expense 
USER expense 
CMD ["sleep", "100"]

# docker build -t user:v1 . 
# docker run -d user:v1 
# docker exec -it <container-id> bash

# -> Now it is a normal user, we don't have any security issues 

# FROM almalinux:9 
# RUN useradd expense 
# USER expense 
# RUN useradd expense1
# CMD ["sleep", "100"]

# -> Here, 4th line doesn't work becoz, one user doesn't have permissions or access to add another user