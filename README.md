## Tanzu Application Platform Accelerator: JupyterLab
Welcome to the GitHub repository for our Tanzu Application Platform (TAP) Accelerator. This particular accelerator enables the execution of JupyterLab on TAP, significantly boosting its capabilities.

### What is JupyterLab?
JupyterLab is a popular interactive development environment for working with notebooks, code, and data. Widely used within the data science community, JupyterLab supports several languages like Python, R, Julia, and many more. It offers a flexible, adaptable environment that enables you to handle data cleaning, statistical modeling, building and training machine learning models, visualizing data, and many other tasks in a seamless manner.

JupyterLab is not just a notebook, but an entire computational environment that facilitates reproducible research and robust exploratory data analysis. The combination of JupyterLab and TAP will empower your teams to collaborate, share, and produce work in an efficient and streamlined way.

### Objective
The objective of this accelerator is to enable the running of JupyterLab on Tanzu Application Platform. By incorporating JupyterLab into TAP, we aim to provide an enhanced and integrated experience for our users. Users can perform data analysis, run statistical models, and develop machine learning applications, all within the TAP environment. This can make workflows more efficient, encourage data exploration and hypothesis testing, and streamline the process of moving from development to production.

## Installation and Usage
Please see our Installation Guide for detailed instructions on how to set up and use this accelerator.

We look forward to seeing how you will use JupyterLab on Tanzu Application Platform!

### Add the Jupyter Nodebook Accelerator in the TAP accelerator list.
~~~
tanzu acc create jupyter-lab --git-repo https://github.com/fklein82/jupyter-lab-for-tap --git-branch main --interval 5s\n
~~~

### Deploy Jupyter Nodebook on TAP (with Kanico)

This Tanzu command will build your container with TAP/Kanico and deploy it through a supplychain. 

~~~
tanzu apps workload create jupyter \
  --git-repo https://github.com/fklein82/jupyter-lab-for-tap \
  --git-branch main \
  --param dockerfile=./Dockerfile \
  --label apps.tanzu.vmware.com/has-tests=true \
  --type web
~~~

### Deploy Jupyter as web service on tap (with an OCI Image ready)

This Tanzu command will deploy JupyterLAB with an existing OCI image through a supplychain. 

~~~
tanzu apps workload create jupyter-nodebook-v2 \
  --type web \
  --label app.kubernetes.io/part-of=jupyter-app \
  --annotation autoscaling.knative.dev/min-scale=1 \
  --image registry.fklein.me/mlops/jupyter:2023-07-05-16-26-29
~~~

### If you want to build the Jupyer image by yourself:
~~~
docker build . --file Dockerfile --tag jupyter-for-tap:1.0

docker tag jupyter-for-tap:1.0 registry.fklein.me/mlops/jupyter-for-tap:1.0

docker login registry.fklein.me

docker push registry.fklein.me/mlops/jupyter-for-tap:1.0
~~~
