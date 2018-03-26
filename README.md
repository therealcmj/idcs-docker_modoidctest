1. build the docker image

> ./build.sh


2. create an OIDC app in IDCS

If you don't have the CLI you'll need to manually do that

If you DO have the CLI you can use the createapp.sh script
  note: you should check settings.sh first!


3. update settings.sh with
* the URL to your IDCS tenancy
* the client ID and secret of the app you created


4. run the container

>  ./run.sh

the run script *SHOULD* launch the container and open your browser
to the index.html in the container
