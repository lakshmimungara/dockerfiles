FROM almalinux:9
RUN dnf install nginx -y 
RUN rm -rf /usr/share/nginx/html/index.html 
ADD https://raw.githubusercontent.com/lakshmimungara/DevOps-notes/refs/heads/main/Terraform/Day-22%20session-22.txt /usr/share/nginx/html/index.html 
RUN chmod +x /usr/share/nginx/html/index.html 
CMD ["nginx", "-g", "daemon off;"]