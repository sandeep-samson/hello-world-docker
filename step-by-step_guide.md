Here's an example of how you can create a simple "Hello World" Python program, create a Docker image from it, and then run that image as a container.

**Step 1: Create the "Hello World" Python Program**

Create a new file named `app.py` with the following content:
```python
def main():
    print("Hello World!!")


if __name__=='__main__':
    main()
```
This is a very basic Python script that just prints out "Hello, World!" to the console.

**Step 2: Create a Dockerfile**

Create a new file named `Dockerfile` in the same directory as your `app.py` file. Add the following content:
```dockerfile
# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```
This Dockerfile tells Docker how to build your image. Here's a brief explanation of each line:

* `FROM python:3`: This line says that we want our new image to be based on the official Python 3 image.
* `WORKDIR /app`: This line sets the working directory inside the container to `/app`.
* `COPY . /app`: This line copies the contents of the current directory into the container at `/app`. This means that when you run your container, it will have access to all the files in your project directory.
* `EXPOSE 80`: This line tells Docker that our application is listening on port 80. This isn't actually necessary for a simple "Hello World" program like this one, but it's good practice to include it just in case you need to expose other ports later.
* `ENV NAME World`: This line sets an environment variable named `NAME` to the string `"World"`. You can access this variable inside your Python script using `os.environ["NAME"]`.
* `CMD ["python", "app.py"]`: This line tells Docker what command to run when it starts up a new container from our image. In this case, we just want to run the `app.py` file.

**Step 3: Build the Docker Image**

Open your terminal and navigate to the directory where you created your `Dockerfile`. Run the following command:
```bash
docker build -t my-python-app .
```
This will create a new Docker image with the name `my-python-app`.

**Step 4: Run the Container**

Once the image has been built, run it using the following command:
```bash
docker run -it my-python-app
```
The `-it` flag tells Docker to allocate a pseudo-TTY to the container and keep stdin open. This means that you'll be able to see any output from your Python script as it runs.

You should now see "Hello, World!" printed out in your terminal!

Here's an example of what this might look like:
```bash
$ docker build -t my-python-app .
Sending build context to Docker daemon 3.072kB
Step 1/7 : FROM python:3
...
Step 7/7 : CMD ["python", "app.py"]
 ---> Running in 6c4f8eb2a89e
Removing intermediate container 6c4f8eb2a89e
 ---> f3b9d0b5b2b1
Successfully built f3b9d0b5b2b1
Successfully tagged my-python-app:latest

$ docker run -it my-python-app
Hello, World!
```
That's it! You've now successfully created a Docker container from your Python program.
