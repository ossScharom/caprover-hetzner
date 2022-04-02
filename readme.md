# CapRover Hetzner

This repository contains the infrastructure configuration for a [CapRover](https://github.com/caprover/caprover) instance on the [hetzner cloud](https://github.com/hetznercloud). The infrastructure is configured with [Terraform](https://github.com/hashicorp/terraform) and provisioned by [cloud init](https://github.com/canonical/cloud-init).

The infrastructure is deployed using GitHub actions and Terrafrom cloud. The project uses a [VSCode devcontainer](https://code.visualstudio.com/docs/remote/containers) containing all dependencies needed to run [pre-commit](https://github.com/pre-commit/pre-commit) hooks to enforce best practices.
