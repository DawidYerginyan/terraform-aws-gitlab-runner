variable "name" {
  type        = string
  description = "Name of a Gitlab runner. All autogenerated names contain this name as prefix."
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to be added to all resources which support tags."
}

variable "config_bucket" {
  type        = string
  default     = ""
  description = "If you already have existing S3 Bucket for storing configuration files, pass it's name here. Otherwise, leave this field empty and a new, private S3 bucket will be created by this module."
}

variable "config_key" {
  type        = string
  default     = ""
  description = "Path to Gitlab runner configuration on configuration S3 bucket. If left empty, defaults to `config.toml`."
}

variable "config_content" {
  type        = string
  description = "Contents of config file."
}

variable "post_reload_script" {
  type        = string
  description = "Custom script to be executed after config.toml file is reloaded. If you use `userdata_post_install` to further modify config.toml, you may need to do the same modifications here, to ensure that configuration is always modified in the same way."
}

variable "cloudtrail_bucket" {
  type        = string
  default     = ""
  description = "If you already have exisiting S3 Bucket for CloudTrail, pass it's name here. Otherwise, leave this field empty and a new CloudTrail S3 bucket will be created by this module."
}

variable "cloudtrail_prefix" {
  type        = string
  default     = ""
  description = "Prefix on S3 bucket for storing CloudTrail logs. If left empty, defaults to `gitlab-runner-config`."
}

variable "runner_autoscaling_group_name" {
  type        = string
  description = "Configuration update script is ran on instances running in this autoscaling group."
}

variable "gitlab_token_ssm_key" {
  type        = string
  description = "Key of Gitlab token stored as SSM Parameter."
}

variable "extra_files_prefix" {
  type        = string
  default     = "/extra-files/"
  description = "S3 Prefix used before keys of extra files on S3 bucket."
}

variable "extra_files" {
  type        = map(string)
  default     = {}
  description = "Map of additional files to push to Gitlab Runner in { \"/path/from/root\": \"file contents\" } format. Files can be later found at /extra-files path and used in user-data script or in config reload script."
}