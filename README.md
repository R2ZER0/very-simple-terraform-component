# Very Basic Terraform Component

## Install terraform

See: https://developer.hashicorp.com/terraform/downloads?product_intent=terraform


## Try it out!

This repo creates a default nginx container on your local docker. Make sure you've got docker working/running first!

```bash
terraform init      # First things first, download the providers you need 
                    # (as specified in versions.tf)
                    # Only need to run it when you change providers, so not
                    # very often. Don't worry, terraform will prompt you to run
                    # this if you forget.

terraform plan      # See what resources would be created/changed

terraform apply     # Apply the changes
                    # Think of it like `docker compose up`
                    # Go to http://localhost:8080/ to see it running!
                    #
                    # Notice that `terraform.tfstate` file has appeared,
                    # this is a JSON of terraform's memory of the world.
                    # It's VERY important, you can't delete your resources
                    # without the state file.
                    # In real-world setups, you don't usually keep these around
                    # as files, but directly access e.g. S3 objects w/ locking
                    # to prevent multiple devs changing the same resources at
                    # the same time.
                    # https://developer.hashicorp.com/terraform/language/settings/backends/configuration


terraform destroy   # Clean up your resources once you're done
                    # Think of it like `docker compose down`


```

## More fun things to do

```bash
terraform graph     # Genarate a GraphViz dependency graph of resources,
                    # visualise the output with e.g. https://dreampuf.github.io/GraphvizOnline/


terraform console   # Go into an interactive console to query your resource's
                    # state/outputs

> docker_container.demo.network_data
tolist([
  {
    "gateway" = "172.17.0.1"
    "global_ipv6_address" = ""
    "global_ipv6_prefix_length" = 0
    "ip_address" = "172.17.0.2"
    "ip_prefix_length" = 16
    "ipv6_gateway" = ""
    "mac_address" = "02:42:ac:11:00:02"
    "network_name" = "bridge"
  },
])
> exit

terraform state list    # List the IDs of known/managed resources
                        # (according to state, doesn't actually query remote APIs)

terraform state show docker_image.nginx # Get state info about an individual
                                        # resource or data source



terraform refresh       # Refresh the known state from "reality" (remote APIs)
                        # Note that this is only possible where the remote APIs
                        # make it possible, not everything can be refreshed.

terraform show      # Spit out the whole known state of resources
                    # Add the -json flag to get JSON output
```

