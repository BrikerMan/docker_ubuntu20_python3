default: py_3.7.5

all: py_3.6.10 py_3.6.10_cn \
  py_3.7.5 py_3.7.5_cn py_3.7.7 py_3.7.7_cn \
  py_3.8.2 py_3.8.2_cn

py_3.6.10:
  docker build -f Dockerfile --build-arg PYTHON_VERSION=3.6.10 \
    -t brikerman/ubuntu18.04_python3:3.6.10 \
    -t brikerman/ubuntu18.04_python3:3.6 \
    --compress .

py_3.6.10_cn:
  docker build -f CN.Dockerfile --build-arg PYTHON_VERSION=3.6.10 \
    -t brikerman/ubuntu18.04_python3:3.6.10-cn \
    -t brikerman/ubuntu18.04_python3:3.6-cn \
    --compress .

py_3.7.5:
  docker build -f Dockerfile --build-arg PYTHON_VERSION=3.7.5 \
    -t brikerman/ubuntu18.04_python3:3.7.5 \
    --compress .

py_3.7.5_cn:
  docker build -f CN.Dockerfile --build-arg PYTHON_VERSION=3.7.5 \
    -t brikerman/ubuntu18.04_python3:3.7.5-cn \
    --compress .

py_3.7.7:
  docker build -f Dockerfile --build-arg PYTHON_VERSION=3.7.7 \
    -t brikerman/ubuntu18.04_python3:3.7.7 \
    -t brikerman/ubuntu18.04_python3:3.7 \
    --compress .

py_3.7.7_cn:
  docker build -f CN.Dockerfile --build-arg PYTHON_VERSION=3.7.7 \
    -t brikerman/ubuntu18.04_python3:3.7.7-cn \
    -t brikerman/ubuntu18.04_python3:3.7-cn \
    --compress .

py_3.8.2:
  docker build -f Dockerfile --build-arg PYTHON_VERSION=3.8.2 \
    -t brikerman/ubuntu18.04_python3:3.8.2 \
    -t brikerman/ubuntu18.04_python3:3.8 \
    --compress .

py_3.8.2_cn:
  docker build -f Dockerfile --build-arg PYTHON_VERSION=3.8.2 \
    -t brikerman/ubuntu18.04_python3:3.8.2-cn \
    -t brikerman/ubuntu18.04_python3:3.8-cn \
    --compress .