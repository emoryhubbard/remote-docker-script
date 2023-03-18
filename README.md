# Remote Docker Script For Running Terraform Apply

Inspired by Rafael Zimmermann's post: https://medium.com/codex/run-your-docker-containers-for-free-in-the-cloud-and-for-unlimited-time-361515cb0876

The problem with the original guide is that since that post was made,
the availability of free compute instances with even 6 GB of RAM is
quite low. You simply get an "out of host capacity" error when
you try to run Terraform like in Zimmermann's instructions, or get
a limited availability error if you try to make one on Oracle's
website.

I've heard reports of scripts running for 2 weeks before an instance
becomes free again and can be obtained. Others have designed similar
workarounds: https://archive.ph/OjSqw

I wanted to be able to still use Terraform, so I created my own
script. This is a batchfile bot designed to run the "terraform apply" command once
per minute, in order to create a VM with Docker already installed and
running in Oracle's Cloud Infrastructure,
which can be used to run multiple sizable container applications.

This is thanks to Oracle's Cloud Infrastructure free tier. Their highest free
offering is 24 GB of RAM which can support most small-site needs.

To run it, first you need to configure the clicking script. It's required to run oci session
authenticate periodically (no, the session refresh command doesn't prevent you from loggging
out sadly). Otherwise it will only work for about 1 hour before you
have to log into Oracle Cloud again. You will need to configure the clicking
position values yourself, because your screen positions will be different from
mine. Tutorial coming soon.

Before using this, be sure to read about how to set up Terraform, and make
an account with Oracle, in this link: https://medium.com/codex/run-your-docker-containers-for-free-in-the-cloud-and-for-unlimited-time-361515cb0876



