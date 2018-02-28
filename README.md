# Setup jenkins instance
```docker-machine create --driver amazonec2 --amazonec2-tags alexandr,kosenko --amazonec2-open-port 8080 --amazonec2-region eu-west-1 --amazonec2-userdata cloud-init kosenko-aws-jenkins```
