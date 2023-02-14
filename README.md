# Pipeline-ECR-AWS-FlaskContainer
Pipeline: 
A. Trigger from commits.
B. Creates docker image from dockerfile that in the repository.
C. Pushes docker image to AWS ECR (elastic container repository).
D. Connect to another instane with ssh.
E. Pull from AWS ECR the image.
F. Run on the instance the docker image and create a flask container that run on port 5000:5000.

