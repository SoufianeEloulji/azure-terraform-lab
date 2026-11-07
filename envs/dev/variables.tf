variable "project" {
  description = "Nom du projet"
  type        = string
  default     = "lab"
}

variable "environment" {
  description = "Environnement cible"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment doit valoir dev, staging ou prod."
  }
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "francecentral"
}

variable "vm_size" {
  description = "Taille de la VM"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_public_key" {
  description = "Clé SSH publique pour la VM"
  type        = string
}