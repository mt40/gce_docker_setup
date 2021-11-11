gce ssh to instance
```shell
gcloud beta compute ssh --zone "us-central1-a" "instance-1"  --tunnel-through-iap --project "plankton-f68bb"
```