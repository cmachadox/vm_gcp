variable "project_id" {
  default              = "seu-project-id"
  type                 = string
  description          = "ID do projeto GCP"
}

variable "region" {
  default              = "us-west1"
  type                 = string
  description          = "Região do projeto"
}

#--------------------------------------------------------------------------------- 

##### Variaveis VM
variable "vm_tux" {
default                = {
    count              = "1"
    name               = "vm-tux-terraform"
    machine_type       = "e2-medium"
    zone               = "us-west1-a"
    image              = "centos-cloud/centos-8"
    size               = "20"
    type               = "pd-standard"
    network            = "tux-vpc"
    subnetwork         = "a-public"
    network_tier       = "STANDARD"
    tags               = "allow-trafic"
  }

  type = object(
    {
    count              = number
    name               = string
    machine_type       = string
    zone               = string
    image              = string
    size               = string
    type               = string
    network            = string
    subnetwork         = string
    network_tier       = string
    tags               = string
   }
      )
} 

variable "elastic_ip_tux" {
default                = {
    name               = "ip-tux-terraform"
    address_type       = "EXTERNAL"
    network_tier       = "STANDARD"
  }

  type = object(
    {
    name               = string
    address_type       = string
    network_tier       = string
   }
      )
} 

variable "allow_trafic" {
default                = {
    name               = "allow-trafic-rule-terraform"
    network            = "tux-vpc"
    target_tags        = "allow-trafic"
  }

  type = object(
    {
    name               = string
    network            = string
    target_tags        = string
   }
      )
} 
#-----------------------------------------------
