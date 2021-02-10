# Terraform
Terraform is an open-source infrastructure as code software tool. We can use it to define and create multiple virtual machines with different configurations and deploy them at the same time. This repository includes the code for VCD and VRA7 automation. It creates a number of virtual machine (both windows and linux) with varied configuration by running a single command in the terminal.

# Installation
In order to use terraform, first download it from here- https://www.terraform.io/downloads.html
Then set the PATH environment variable to its location. Here is the installation guide to help you along- https://learn.hashicorp.com/terraform/getting-started/install.html

Alternatively, you can edit the location of terraform in the 'terra.bat' file in the svn folder and the simply run 'terra.bat' before starting to use terraform.
Go through 'instructions.txt' to understand how to run the given code.

# Helpful links

## VCD
- https://www.terraform.io/docs/providers/vcd/r/vapp.html

- https://www.terraform.io/docs/providers/vcd/index.html

## VRA7
- https://github.com/terraform-providers/terraform-provider-vra7/blob/master/website/docs/r/deployment.html.markdown

- https://github.com/terraform-providers/terraform-provider-vra7/blob/master/website/docs/r/BasicSingleMachine.yaml
