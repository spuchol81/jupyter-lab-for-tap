FROM jupyter/minimal-notebook:python-3.10.4
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--ip='0.0.0.0'", "--port=8080", "-e NB_USER='jovyan'", "-e GRANT_SUDO=yes", "--NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$DqjatBH754uQj3X6LA7OGA$+4nLjcpW9scNTgWK+TU9C2zCJaQv02WPlofmh/9NBqc'"]
