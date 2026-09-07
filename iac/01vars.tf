variable "env_id" {
  type    = string
  description = "Environment ID"  
  default = "dev"
}


# subscription_id is the Azure subscription ID where resources will be created
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  default     = "d34b7f0b-cdd0-400e-a019-57d8be48b7ef" # hardcoded from azure CLI or from azure portal
}




variable "source_key" {
  type        = string
  description = "Source using which the resource create e.g terraform, azure portal, etc."
  default     = "terraform"
}

variable "sql_username" {
  type = string
  description = "The SQL Server username"
  default = "saadmin"
}



variable "sql_pass" {
  type = string
  description = "The SQL Server password"
  default = "Vsat1s23nl" 
}
