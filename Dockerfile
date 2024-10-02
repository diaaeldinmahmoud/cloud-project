# Use Python 3.9 slim as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

COPY  . .




# Install necessary dependencies for your application, including libgl1-mesa-glx, libglib2.0-0, and xauth
RUN apt-get update && apt-get install -y  libx11-6 libxext-dev libxrender-dev libxinerama-dev libxi-dev libxrandr-dev  libxcursor-dev libxtst-dev  libgl1-mesa-glx libglib2.0-0  zlib1g-dev  libjpeg62-turbo-dev tk-dev   && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application files to the container
COPY Hand_written_GUI.py emnist-letters-mapping.txt RF.sav DT.sav /app/


# Command to run the application
CMD ["python", "Hand_written_GUI.py"]