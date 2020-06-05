variable "project_id" {
  type        = string
  description = <<EOD
The existing project id that will have a Terraform service account added.
EOD
}

variable "tf_sa_name" {
  type        = string
  default     = "terraform"
  description = <<EOD
The name of the Terraform service account to add to the project. Default is
'terraform'.
EOD
}

variable "tf_sa_impersonate_groups" {
  type        = list(string)
  default     = []
  description = <<EOD
A list of groups that will be allowed to impersonate the Terraform service account.
If no groups are supplied, impersonation will not be setup by the script.
E.g.
tf_sa_impersonate_groups = [
  "devsecops@example.com",
  "admins@example.com",
]
EOD
}

variable "tf_bucket_name" {
  type        = string
  default     = ""
  description = <<EOD
The name of a GCS bucket to create for Terraform state storage. This name must be
unique in GCP. If blank, (the default), the name will be 'tf-PROJECT_ID', where
PROJECT_ID is the unique project identifier.
EOD
}

variable "tf_bucket_location" {
  type        = string
  default     = "US"
  description = <<EOD
The location where the bucket will be created; this could be a GCE region, or a
dual-region or multi-region specifier. Default is to create a multi-region bucket
in 'US'.
EOD
}

variable "apis" {
  type = list(string)
  default = [
    "compute.googleapis.com",
    "iap.googleapis.com",
    "oslogin.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "secretmanager.googleapis.com",
  ]
  description = <<EOD
An optional list of GCP APIs to enable in the project.
EOD
}

variable "tf_sa_roles" {
  type = list(string)
  default = [
    "roles/compute.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/storage.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.serviceAccountUser",
    "roles/secretmanager.admin",
  ]
  description = <<EOD
A list of IAM roles to assign to the Terraform service account. Defaults to a set
needed to manage Compute resources, GCS buckets, IAM, and Secret Manager assignments.
EOD
}

variable "oslogin_groups" {
  type        = list(string)
  default     = []
  description = <<EOD
A list of groups that will be allowed to use OS Login to VMs.
E.g.
oslogin_groups = [
  "devsecops@example.com",
  "admins@example.com",
]
EOD
}

variable "tf_sa_creds_secret_id" {
  type        = string
  default     = "terraform-creds"
  description = <<EOD
The unique identifier to use for Terraform credential store in Secret Manager.
Default is 'terraform-creds'.
EOD
}

variable "ansible_sa_name" {
  type        = string
  default     = "ansible"
  description = <<EOD
The name of the Ansible service account to add to the project. Default is
'ansible'.
EOD
}

variable "ansible_sa_impersonate_groups" {
  type        = list(string)
  default     = []
  description = <<EOD
A list of groups that will be allowed to impersonate the Ansible service account.
If no groups are supplied, impersonation will not be setup by the script.
E.g.
ansible_sa_impersonate_groups = [
  "devsecops@example.com",
  "admins@example.com",
]
EOD
}

variable "ansible_sa_roles" {
  type = list(string)
  default = [
    "roles/compute.viewer",
    "roles/compute.osLogin",
  ]
  description = <<EOD
A list of IAM roles to assign to the Terraform service account. Defaults to a set
needed to manage Compute resources, GCS buckets, and IAM assignments.
EOD
}

variable "ansible_sa_creds_secret_id" {
  type        = string
  default     = "ansible-creds"
  description = <<EOD
The unique identifier to use for Ansible credential store in Secret Manager.
Default is 'ansible-creds'.
EOD
}
