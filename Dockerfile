# Dockerfile

# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.10.6-alpine3.16

# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt

# setup environment variable  
ENV DockerHOME=/home/app/webapp
# set work directory  
RUN mkdir -p $DockerHOME  
# where your code lives  
WORKDIR $DockerHOME  
# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# copy whole project to your docker home directory. 
COPY . $DockerHOME  
# run this command to install all dependencies  
RUN pip install -r requirements.txt  
# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD python manage.py runserver  

# install dependencies 
#RUN pip install --no-cache-dir -r requirements.txt

# Mounts the application code to the image
#COPY . code
#WORKDIR /code

#EXPOSE 8000

# runs the production server
#ENTRYPOINT ["python", "mysite/manage.py"]
#CMD ["runserver", "0.0.0.0:8000"]