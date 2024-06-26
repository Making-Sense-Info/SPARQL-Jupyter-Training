#!/bin/sh

REPO=SPARQL-Jupyter-Training
REPO_URL=https://github.com/Making-Sense-Info/${REPO}.git
cd /home/onyxia/work
git clone $REPO_URL

# Install dependencies
[ -f $HOME/work/SPARQL-Jupyter-Training/requirements.txt ] && pip install -r $HOME/work/SPARQL-Jupyter-Training/requirements.txt

# Clean
cd ./SPARQL-Jupyter-Training
rm LICENSE
rm init-notebook.sh
rm README.md
rm requirements.txt

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/SPARQL-Jupyter-Training/${IPYNB_PATH%.*}/${IPYNB_PATH}'" >> $HOME/.jupyter/jupyter_server_config.py
echo "c.IPKernelApp.capture_fd_output = False" >> $HOME/.jupyter/jupyter_server_config.py
echo "c.MultiKernelManager.default_kernel_name = 'ipykernel'" >> $HOME/.jupyter/jupyter_server_config.py