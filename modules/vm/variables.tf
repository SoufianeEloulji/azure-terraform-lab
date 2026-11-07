variable "name" {
  description = "Suffixe de nommage"
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

variable "subnet_id" {
  description = "Sous-réseau où brancher la VM"
  type        = string
}

variable "vm_size" {
  description = "Taille de la VM"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Nom de l'administrateur"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "Clé SSH publique (contenu d'un fichier .pub)"
  type        = string
}

variable "tags" {
  description = "Tags appliqués aux ressources"
  type        = map(string)
  default     = {}
}