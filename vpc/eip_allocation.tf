#
# Grab 3 EIP for NAT Gateways (3 AZs, 3 NAT GW's) 
# 
resource "aws_eip" "nat" {
  count = 3
  vpc   = true
}
