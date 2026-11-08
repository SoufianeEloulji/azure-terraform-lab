# Provider simulé : aucune connexion à Azure
mock_provider "azurerm" {
  mock_resource "azurerm_subnet" {
    defaults = {
      id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Network/virtualNetworks/vnet-test/subnets/snet-test"
    }
  }
}

# Valeurs communes à tous les tests
variables {
  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMJrrrItONuZ/N5Qg7MKGyPKQQoGoRL+dxTlciXQa3ZK elouljisoufianeytber@gmail.com"
}

run "nommage_et_tags" {
  command = plan

  assert {
    condition     = azurerm_resource_group.this.name == "rg-lab-dev"
    error_message = "Le groupe de ressources doit s'appeler rg-lab-dev."
  }

  assert {
    condition     = azurerm_resource_group.this.tags["managed_by"] == "terraform"
    error_message = "Le tag managed_by=terraform est obligatoire."
  }
}

run "mdp_desactive" {
    command = plan

    assert {
        condition = module.vm.disable_password_authentication == true
        error_message = "La VM doit désactiver l'authentification par mot de passe."
    }
}

run "refuse_un_environnement_inconnu" {
  command = plan

  variables {
    environment = "banana"
  }

  expect_failures = [var.environment]
}