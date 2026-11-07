variable "name" {
  description = "Suffixe de nommage (ex: lab-dev)"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Groupe de ressources cible"
  type        = string
}

variable "address_space" {
  description = "Plage d'adresses du réseau virtuel"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Plage d'adresses du sous-réseau"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "tags" {
  description = "Tags appliqués aux ressources"
  type        = map(string)
  default     = {}
}