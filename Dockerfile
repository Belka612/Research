FROM sagemath/sagemath:latest

# Install Jupyter Notebook and necessary extensions
RUN sage -pip install --upgrade pip && \
    sage -pip install notebook jupyterlab ipywidgets && \
    sage -sh -c "pip install --upgrade pip" && \
    sage -sh -c "jupyter nbextension enable --py widgetsnbextension --sys-prefix"

# Expose Jupyter Notebook's default port
EXPOSE 8888

# Create a directory for notebooks
WORKDIR /home/sage/notebooks

# Set permissions for the SageMath user
RUN mkdir -p /home/sage/notebooks && \
    chown -R sage:sage /home/sage/notebooks

# Switch to the SageMath user
USER sage

# Start Jupyter Notebook
CMD ["sage", "-sh", "-c", "jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/home/sage/notebooks"]
