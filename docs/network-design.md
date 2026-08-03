# Network Design

## Objective

Create a highly available AWS network that separates public-facing resources from private application and database resources.

## Planned Architecture

The platform will use one Amazon VPC across two Availability Zones.

Each Availability Zone will contain:

- One public subnet
- One private application subnet
- One private database subnet

## Public Subnets

Public subnets will contain resources that need direct internet connectivity, such as:

- Application Load Balancers
- NAT Gateways

## Private Application Subnets

Private application subnets will contain:

- Amazon EKS worker nodes
- Kubernetes application workloads

These resources will not accept direct inbound traffic from the internet.

## Private Database Subnets

Private database subnets will contain:

- Amazon RDS database instances

The database will only accept traffic from authorized application resources.

## Network Components

- Amazon VPC
- Internet Gateway
- Public Route Tables
- Private Route Tables
- NAT Gateways
- Security Groups
- Network ACLs
- Route 53