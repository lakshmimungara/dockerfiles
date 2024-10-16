# -> It is used to set the variables at build time only, not inside the container  

FROM almalinux:9 
ARG course="Devops with AWS" \
	duration="2hrs"
RUN echo "course: $course, duration: $duration"
CMD ["sleep", "100"]

# docker build -t arg:v1 .
# docker run -d arg:v1 
# docker exec -it <container-id> bash 

# -> ARG runs at the time of build 

# FROM almalinux:9 
# ENV course="Devops with AWS" \
# 	duration="2hrs"
# RUN echo "course: $course, duration: $duration"
# CMD ["sleep", "100"]


# ARG vs ENV --> most interview question 
# ---------------------------------
# 1. ENV variables can be accessed in image build time and conatienr bash 
# 2. ARG is only accessed at the time of image creation 
# 3. You can use ARG instruction before FROM in one special case i.e to supply version to the bash image 
# 4. ARG instruction before FROM is only valid until FROM, it can't be accessed after FROM 

# How can I access ARG values inside container?
# --------------------------------------------
# A) You can set arg value to env variable 

# ENV var-name=$var-name


# FROM almalinux:9 
# ARG course="Devops" \
# 	duration="2hrs"
# RUN echo "course: $course, duration: $duration"
# CMD ["sleep", "100"]

# -> we can override the values from outside 
# -> docker build -t arg:v1 --build-arg course=docker .


# ARG version
# FROM almalinux:${version} 
# ARG course="Devops" \
# 	duration="2hrs"
# RUN echo "course: $course, duration: $duration"
# CMD ["sleep", "100"]

# -> docker build -t arg:v1 --build-arg course=docker --build-arg version=8 .

# ARG version
# FROM almalinux:${version:-9} 
# ARG course="Devops" \
# 	duration="2hrs"
# RUN echo "course: $course, duration: $duration"
# CMD ["sleep", "100"]

# -> default version
# -> docker build -t arg:v1 --build-arg course=docker .

# ARG version
# FROM almalinux:${version:-9} 
# ARG course="Devops" \
# 	duration="2hrs"
# RUN echo "course: $course, duration: $duration , version: $version"
# CMD ["sleep", "100"]

# -> docker build -t arg:v1 --build-arg course=docker .

# ARG version
# FROM almalinux:${version:-9} 
# ARG course="Devops" \
# 	duration="2hrs"
# ENV duration=$duration
# RUN echo "course: $course, duration: $duration"
# CMD ["sleep", "100"]

# -> docker build -t arg:v1 --build-arg course=docker .
# -> docker run -d arg:v1 
# -> docker exec -it <container-id> bash 

# Type env 


# -> You can create ENV variable and set ARG to the variable 
