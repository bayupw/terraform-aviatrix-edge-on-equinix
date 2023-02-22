terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = ">= 2.24.1"
    }
    equinix = {
      source  = "equinix/equinix"
      version = "~> 1.12.0"
    }
  }
}