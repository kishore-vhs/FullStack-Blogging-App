```
gcloud compute instances create jenkins --project=perfect-crawler-423915-p3 --zone=us-east1-b --machine-type=e2-standard-2 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=subnet-1 --metadata=startup-script=\#\!/bin/bash$'\n'sudo\ apt\ update \
--maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=831197845130-compute@developer.gserviceaccount.com \
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/trace.append \
--tags=http-server,https-server,lb-health-check \
--create-disk=auto-delete=yes,boot=yes,device-name=jenkins,image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240830,mode=rw,size=20,type=pd-balanced \
--no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

gcloud compute instances create nexus --project=perfect-crawler-423915-p3 --zone=us-east1-b --machine-type=e2-standard-2 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=subnet-1 --metadata=startup-script=\#\!/bin/bash$'\n'sudo\ apt\ update \
--maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=831197845130-compute@developer.gserviceaccount.com \
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/trace.append \
--tags=http-server,https-server,lb-health-check \
--create-disk=auto-delete=yes,boot=yes,device-name=jenkins,image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240830,mode=rw,size=20,type=pd-balanced \
--no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

gcloud compute instances create sonar --project=perfect-crawler-423915-p3 --zone=us-east1-b --machine-type=e2-standard-2 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=subnet-1 --metadata=startup-script=\#\!/bin/bash$'\n'sudo\ apt\ update \
--maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=831197845130-compute@developer.gserviceaccount.com \
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/trace.append \
--tags=http-server,https-server,lb-health-check \
--create-disk=auto-delete=yes,boot=yes,device-name=jenkins,image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240830,mode=rw,size=20,type=pd-balanced \
--no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any
```
