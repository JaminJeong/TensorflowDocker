### How to Use
```bash
$ cat /etc/group | grep youraccount
youraccount:x:1001:
$ bash start_docker.sh
# in tf_2_0 docker
root@yourdocker# adduser youraccount
root@yourdocker# sed 's/youraccount\:x\:1000\:1000\:/youraccount\:\x\:1001\:1001\:/g' /etc/passwd > /etc/passwd 
root@yourdocker# sed 's/youraccount\:x\:1000\:1000\:/youraccount\:\x\:1001\:1001\:/g' /etc/passwd- > /etc/passwd-
root@yourdocker# sed 's/youraccount\:x\:1000\:/youraccount\:\x\:1001\:/g' /etc/group > /etc/group
root@yourdocker# exit
$ sudo nvidia-docker start tf_2_0
$ ssh -Y localhost -p 2220
```

### Reference
 - https://github.com/kmahyyg/tensorflow-v1-docker
