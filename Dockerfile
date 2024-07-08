# Use an official manylinux image as a base
FROM quay.io/pypa/manylinux2014_x86_64

# Install system dependencies
RUN yum install -y gcc  # Use yum for CentOS/RHEL based distributions

# Set Python versions to build wheels for
ARG PYTHON_VERSIONS="3.7 3.8 3.9 3.10 3.11 3.12"

# Install Python and pip for each version specified
RUN for version in $PYTHON_VERSIONS; do \
        /opt/python/cp${version}-cp${version}*/bin/python -m pip install --upgrade pip; \
    done

# Set the working directory in the container
WORKDIR /app

# Copy requirements and source code
COPY requirements.txt .
COPY . .

# Install Python package dependencies for each version
RUN for version in $PYTHON_VERSIONS; do \
        /opt/python/cp${version}-cp${version}*/bin/python -m pip install -r requirements.txt; \
    done

# Build wheels for each Python version
RUN for version in $PYTHON_VERSIONS; do \
        /opt/python/cp${version}-cp${version}*/bin/python setup.py bdist_wheel --plat manylinux2014; \
    done
