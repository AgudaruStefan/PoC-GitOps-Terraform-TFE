locals {
  project = {
    "fem-eci-project" = {
      description = "Example description of project"
    }
  }

  workspace = {
    "fem-eci-tfe" = {
      description    = "Example description of workspace"
      execution_mode = "remote"
      project_id     = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/PoC-GitOps-Terraform-TFE"
    }

    "fem-eci-github" = {
      description    = "Example description of workspace"
      execution_mode = "remote"
      project_id     = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/PoC-GitOps-Terraform-Github"
    }

    "fem-eci-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/PoC-GitOps-Terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["eu-central-1", "eu-north-1"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci"
        },
      ]
    }

    "fem-eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/PoC-GitOps-Terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "morse.beer"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci-beardedsam"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "fem-eci"
        },
      ]
    }
  }
}