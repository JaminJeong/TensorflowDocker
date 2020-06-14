## Docker
1. bash build_docker.sh
2. bash start_docker.sh 

if you want other tensorflow version, modify build_docker.sh file.

build_docker.sh
```bash
sudo nvidia-docker build --build-arg VERSION=1.13.1-gpu-py3(yourversiontag) -t tfclassification:1.0 ./ 
```

## Folder Structure
```bash
├── Classification
│   ├── Dockerfile
│   ├── build_docker.sh
│   └── start_docker.sh
├── Detection
│   ├── Dockerfile
│   ├── build_docker.sh
│   └── start_docker.sh
├── Dev
│   ├── Dockerfile
│   ├── README.md
│   ├── build_docker.sh
│   └── start_docker.sh
├── Hub
│   ├── Dockerfile
│   ├── build_docker.sh
│   └── start_docker.sh
├── Jupyter
│   ├── Dockerfile
│   ├── build_docker.sh
│   └── start_docker.sh
└── README.md


```

## reference
  - http://hub.docker.com/r/tensorflow/tensorflow/
