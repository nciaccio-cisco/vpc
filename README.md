# vpc

### Issues encountered and actions taken:

1. Variable private_subnet_cidr_blocks in module.sandbox_vpc has a type constraint of string, but default value is a list. Update type constraint to list
2. Module source location/path is incorrect, update source to the correct relative directory path
3. vpc_id attribute on resource aws_subnet.public_subnets is blank, update to ref id of vpc resource
4. count attribute on resource aws_subnet.public_subnets is blank, update to use length function to determine number of subnets based on length of public cidr list variable
5. gateway_id is blank on resource aws_route_table.public_rt, update to ref id of gateway resource
6. Incorrect syntax on route_table_id for resource aws_route_table_association.private_rta. Update to use element function to associate correct route table per iteration
7. Output "id" is missing value, add value with ref of vpc id
8. Update variable "vpc_ciddrr_block" to "vpc_cidr_block"
9. private_subnet_cidr_blocks is missing in vpc module declaration, add it
10. Implement aws_subnet.private_subnets resource
11. Attribute enable_classiclink is not valid for resource aws_vpc anymore, deprecated. Removed
12. Move the terraform version contraint into the required_providers block, Terraform 0.13 and earlier allowed provider version contraints in the provider configuration block but is now deprecated
13. "vpc" attribute on resource aws_eip.nat_eip is deprecated, replace with "domain" = vpc

### Other notes:

- Its generally safer to use for_each instead of count because with count resource instances are identified by their index instead of the string values in the list. An update to the positioning of items in the list could cause unintended remote changes. For the purposes of this exercise count is sufficiently functional
- Normally the VPC module should reside within its own github repository seperate from the module where its declared so that proper release management and git tag versioning can be done. Declared modules should always refer to a specific git revision or tag to ensure unwanted changes dont get deployed. For simplicity and the purpose of this exercise I've kept them together
- State should be stored remotely on something like s3, so that the statefile is not stored local and not easily lost. For this exercise I've kept it using local state

Successful Apply:

![Screenshot 2023-12-18 at 9 59 26 AM](https://github.com/nciaccio-cisco/vpc/assets/124817502/fc61b1a3-87e2-4d13-9153-6f0a069e39e0)

