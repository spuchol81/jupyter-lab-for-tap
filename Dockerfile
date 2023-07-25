FROM jupyter/minimal-notebook:python-3.10.4
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--ip='0.0.0.0'", "--port=8080"]
