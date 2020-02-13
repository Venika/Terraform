#These are declared in terraform.tfvars
#Username and password needs to be entered before running it!

provider "vra7" {
  username = "${var.VRA7_USERNAME}"
  password = "${var.password}"
  tenant   = "${var.tenant}"
  host     = "${var.VRA7_HOST}"
}

#Creates 1 deplyment and 4 client machines under that deployment
resource "vra7_deployment" "machine" {
  count             = 1
  catalog_item_name = "*Enter the name of your machine catalog*"
  description = "This is the deployement of 4 client machines with 8 cpu cores and 16000GB memory each"


  deployment_configuration = {
    _leaseDays = "90"
  }

//Edit the congiguration of your machine to be different from what's listed in catalog
  resource_configuration = {
    "Your_Machine_Name._cluster"="4"
    "Your_Machine_Name.cpu" = "8"
    "Your_Machine_Name.memory" = "16000"
  }
}
