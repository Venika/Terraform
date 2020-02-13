# Configure the VMware vCloud Director Provider

provider "vcd" {
  user="${var.vcd_user}"
  password="${var.vcd_pass}"
  org="${var.vcd_org}"
  vdc="${var.vcd_vdc}"
  url="${var.vcd_url}"
}

/**************************************************************************************************************************/
//Below are the multiple ways you can create a VM using terraform.
//While trying to use one, comment the rest out so as to not get errors.
/**************************************************************************************************************************/

//1.
//creates a vapp and then a vm. More customizable with configuration but takes 3x longer.
//Can be used to create multiple VMs under 1 vapp
resource "vcd_vapp" "terramachine2" {
  name = "terramachine2"
  power_on = "true"
  network_name = "Your Network"
  ip = "allocated"
}

resource "vcd_vapp_vm" "terravm1" {
  vapp_name = "terramachine2"
  name = "terravm1"
  catalog_name = "Your_Catalog_Name"
  template_name = "Your_Template_Name"
  memory = 2048
  cpus = 4
  cpu_cores = 2

  depends_on = ["vcd_vapp.terramachine2"]
}

resource "vcd_vapp_vm" "terravm2" {
  vapp_name = "terramachine2"
  name = "terravm2"
  catalog_name = "Your_Catalog_Name"
  template_name = "Your_Template_Name"
  memory = 2048
  cpus = 4
  cpu_cores = 2

  depends_on = ["vcd_vapp.terramachine2"]
}


//2.
//works and takes less time but can't define no. of sockets
resource "vcd_vapp" "terramachine" {
  name = "terramachine"
  power_on = "false"
  network_name = "Your Network"
  ip = "allocated"
  catalog_name = "Your_Catalog_Name"
  template_name = "Your_Template_Name"
  memory = 2048
  cpus = 3

}

resource "vcd_network_direct" "net" {
  name             = "net"
  external_network = "Your Network"
}

resource "vcd_vapp" "terramachine" {
  name = "terramachine"
  power_on = "false"
  network_name = "Your Network"
  ip = "allocated"
  catalog_name = "Your_Catalog_Name"
  template_name = "Your_Template_Name"
  memory = 2048
  cpus = 1

}


//3.
# Create a new network in organization and VDC defined above
//This partially worked
resource "vcd_network_isolated" "net" {
  name="Your Network2"
  gateway="xxx.xxx.xx.xxx"
  netmask="xxx.xxx.xxx.x"
  dns1="xxx.xxx.xx.xxx"
}

resource "vcd_network_routed" "net" {
  name="Your Network"
  edge_gateway="xxx.xxx.xx.x"
  gateway="xxx.xxx.xx.xxx"
  netmask="xxx.xxx.xxx.x"
  dns1="xxx.xxx.xx.xxx"
  dns_suffix=""

  dhcp_pool{
    start_address="xxx.xxx.xx.x"
    end_address="xxx.xxx.xxx.x"
  }
}
