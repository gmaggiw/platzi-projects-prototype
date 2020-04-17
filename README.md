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
 
 ## Notes

 In the process of developing this project, the major issue I had was to understand how the AWS CI/CD works. I had to watch some videos and read the AWS Documentation to understand it. Once I understood how it works, I tried to build a custom terraform module, but I noticed that it would be a lot of work so I had to look for a terraform module. I found one module but it had hardcoded the bucket region so I decided to clone it and fix it.

 I created two environemnts: prod and dev. Creating more environments is very straightforward with this folder stucture, you just have to create another folder with the variables.tf file and create a symbolic link of the main.tf from the base folder.

![Architecture](https://github.com/ispec-inc/terraform-aws-ecs-deploy-pipeline/blob/master/.github/images/architecture.png?raw=true)
###### Image from https://registry.terraform.io/modules/ispec-inc/ecs-deploy-pipeline/aws/0.4.3

So, in this way, we are creating one pipeline by environment with all the resources needed.

Each environment has their corresponding branch in the git repository. When a commit is made in one branch this trigger the corresponding pipeline and deploy the change to the correct environment.

The infrastructure variables for each environment is been managed in the variables.tf, defining a default value for each variable. Right now the application has only demo data, but for a real scenario the application will need environment variables. This variables could be managed in a .env file for each environment, and pass those values ​​to a docker compose file. If there are variables with sensitive data, the best alternative is to use some service like AWS parameter manager or secret manager.

The production environment, in a real situation, should have an RDS database, instead of the sqlite db, so in this way, the application could scale.

In the future, an improvement opportunity could be to decouple the application in backend and frontend, with an API in the backend based on microservices over a serverless infrastructure using AWS lambda and API Gateway, and a frontend maybe with a framework like React. So in this way, the application could have more than one interface, and each microservice could be scaled independently.

