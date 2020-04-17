# Platzi Projects

Platzi Projects is a proposal for the generation of a space in the Platzi community, which promotes and facilitates the development of collaborative projects among members of the community, in order to give students the opportunity to demonstrate their knowledge to third parties, and in turn generate an ecosystem of generation of value for the community and for the company.

This repository contains a functional prototype to help visualize what the dynamics of this new space would be like.

Any recommendation or suggestion feel free to contribute.

## Running with Docker locally

 1. Clone the project
    ```bash
    git clone https://github.com/gmaggiw/platzi-projects-prototype
    ```
 2. Change directory to the project folder
    ```bash
    cd platzi-projects-prototype
    ```
 3. Build the image
    ```bash
    docker build -t gmaggi/projects .
    ```
 4. Run a container with the image
    ```bash
    docker run -d -p 8000:8000 gmaggi/projects:latest
    ```
 5. Open the URL in a browser
    ```bash
    http://localhost:8000
    ```
 