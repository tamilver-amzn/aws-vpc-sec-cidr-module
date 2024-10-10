################################################################################
# VPC
################################################################################

variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
}

variable "secondary_cidr_block" {
  description = "Secondary CIDR block to add to the VPC"
  type        = string
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "division"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Publiс Subnets
################################################################################

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  type        = bool
  default     = false
}

variable "public_subnet_enable_dns64" {
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  type        = bool
  default     = true
}

variable "public_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  type        = bool
  default     = true
}

variable "public_subnet_enable_resource_name_dns_a_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  type        = bool
  default     = false
}

variable "create_multiple_public_route_tables" {
  description = "Indicates whether to create a separate route table for each public subnet. Default: `false`"
  type        = bool
  default     = false
}

variable "public_subnet_ipv6_native" {
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}

variable "public_subnet_private_dns_hostname_type_on_launch" {
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  type        = string
  default     = null
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route tables"
  type        = map(string)
  default     = {}
}

################################################################################
# Public Network ACLs
################################################################################

variable "public_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for public subnets"
  type        = bool
  default     = false
}

variable "public_inbound_acl_rules" {
  description = "Public subnets inbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "public_outbound_acl_rules" {
  description = "Public subnets outbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "public_acl_tags" {
  description = "Additional tags for the public subnets network ACL"
  type        = map(string)
  default     = {}
}

################################################################################
# Private Subnets
################################################################################

variable "private_subnet_assign_ipv6_address_on_creation" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is `false`"
  type        = bool
  default     = false
}

variable "private_subnet_enable_dns64" {
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
  type        = bool
  default     = true
}

variable "private_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
  type        = bool
  default     = true
}

variable "private_subnet_enable_resource_name_dns_a_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
  type        = bool
  default     = false
}

variable "private_subnet_ipv6_native" {
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  type        = bool
  default     = false
}

variable "private_subnet_private_dns_hostname_type_on_launch" {
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`"
  type        = string
  default     = null
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables"
  type        = map(string)
  default     = {}
}

################################################################################
# Private Network ACLs
################################################################################

variable "private_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for private subnets"
  type        = bool
  default     = false
}

variable "private_inbound_acl_rules" {
  description = "Private subnets inbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "private_outbound_acl_rules" {
  description = "Private subnets outbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "private_acl_tags" {
  description = "Additional tags for the private subnets network ACL"
  type        = map(string)
  default     = {}
}

################################################################################
# Internet Gateway
################################################################################

# variable "create_igw" {
#   description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
#   type        = bool
#   default     = true
# }

# variable "create_egress_only_igw" {
#   description = "Controls if an Egress Only Internet Gateway is created and its related routes"
#   type        = bool
#   default     = true
# }

################################################################################
# NAT Gateway
################################################################################

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "nat_gateway_destination_cidr_block" {
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`"
  type        = bool
  default     = false
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  type        = bool
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "external_nat_ips" {
  description = "List of EIPs to be used for `nat_public_ips` output (used in combination with reuse_nat_ips and external_nat_ip_ids)"
  type        = list(string)
  default     = []
}

variable "nat_gateway_tags" {
  description = "Additional tags for the NAT gateways"
  type        = map(string)
  default     = {}
}

variable "nat_eip_tags" {
  description = "Additional tags for the NAT EIP"
  type        = map(string)
  default     = {}
}
