# Remote Docker Script For Running Terraform Apply

Inspired by Rafael Zimmermann's post: https://medium.com/codex/run-your-docker-containers-for-free-in-the-cloud-and-for-unlimited-time-361515cb0876

This is a batchfile bot designed to run the "terraform apply" command once
per minute, in order to create and setup a VM with Docker already installed,
which can use to run multiple sizable container applications. It creates it in
Oracle's Cloud Infrastructure. Their highest free offering is 24 GB of RAM which
can support most small-site needs.

To run it, first you need to configure the clicking script. It's required to run oci session
authenticate (no, the session refresh command doesn't prevent you from loggging
out sadly) periodically. Otherwise it will only work for about 1 hour before you
have to log into Oracle Cloud again. You will need to configure the clicking
position values yourself, because your screen positions will be different from
mine. Tutorial coming soon.

Before using this, be sure to read about how to set up Terraform, and make
an account with Oracle, in this link: https://medium.com/codex/run-your-docker-containers-for-free-in-the-cloud-and-for-unlimited-time-361515cb0876



