docker build . -t covidpassapinet -t gcr.io/broadcast2patients/covidpassapinet
docker push gcr.io/broadcast2patients/covidpassapinet
gcloud config set project broadcast2patients
gcloud config set run/region us-east1
gcloud run services update-traffic covidpassapinet --to-latest
gcloud run deploy covidpassapinet --image gcr.io/broadcast2patients/covidpassapinet:latest --platform managed
docker image prune -f
