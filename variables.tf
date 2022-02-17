variable "cluster_name" {
  description = "value"
  type        = string
}

variable "cluster_location" {
  description = ""
  type        = string
}

variable "network" {
  description = "value"
  type        = string
  default     = null
}

variable "initial_node_count" {
  description = "When variable node_pools is defined it will set an initial_node_count of 1."
  type        = number
  default     = 1
}

variable "node_pools" {
  description = "value"
  type = list(object({
    name         = string
    location     = string
    node_count   = number
    machine_type = string
  }))
  default = []
}

variable "tags" {
  description = ""
  type        = list(string)
  default     = []
}