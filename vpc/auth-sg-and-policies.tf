
resource "aws_iam_policy" "semver-bucket-rw-access" {
  name        = "semver-bucket-rw-access"
  path        = "/"
  description = "Grants read write access to semver buckets. Is elsewhere applied to the EKS nodes for concourse"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::nlc-concourse-semver"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::nlc-concourse-semver/*"
            ]
        }
    ]
}
EOF
}


## TODO - can we limit the s3:* here - although the drupal docs say use s3:* :(
## TODO - surely we can iterate here on buckets  ?

resource "aws_iam_policy" "connect-s3fs-staging-bucket-rw-access" {
  name        = "connect-s3fs-staging-bucket-rw-access"
  path        = "/"
  description = "Grants read write access to s3fs bucket nlc-static-staging"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::nlc-static-staging",
                "arn:aws:s3:::nlc-static-staging/*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_policy" "connect-s3fs-bucket-rw-access" {
  name        = "connect-s3fs-bucket-rw-access"
  path        = "/"
  description = "Grants read write access to s3fs bucket nlc-static-prod"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::nlc-static-prod",
                "arn:aws:s3:::nlc-static-prod/*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_policy" "es-domain-node-access-es-connect" {
  name        = "es-domain-node-access-es-connect"
  path        = "/"
  description = "Grants the k8s nodes access to es-connect domain"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "es:ESHttpDelete",
        "es:ESHttpGet",
        "es:ESHttpHead",
        "es:ESHttpPost",
        "es:ESHttpPut"
      ],
      "Resource": "arn:aws:es:us-west-1:422126600089:domain/es-connect/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "es:DescribeElasticsearchDomain",
        "es:DescribeElasticsearchDomainConfig",
        "es:DescribeElasticsearchDomains"
      ],
      "Resource": "arn:aws:es:us-west-1:422126600089:domain/es-connect"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ingressController-iam-policy" {
  name        = "ingressController-iam-policy"
  path        = "/"
  description = "For creating ALB ingress"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "acm:DescribeCertificate",
                "acm:ListCertificates",
                "acm:GetCertificate"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateSecurityGroup",
                "ec2:CreateTags",
                "ec2:DeleteTags",
                "ec2:DeleteSecurityGroup",
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeTags",
                "ec2:DescribeVpcs",
                "ec2:ModifyInstanceAttribute",
                "ec2:ModifyNetworkInterfaceAttribute",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "cognito-idp:DescribeUserPoolClient",
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:AddListenerCertificates",
                "elasticloadbalancing:CreateListener",
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:CreateRule",
                "elasticloadbalancing:CreateTargetGroup",
                "elasticloadbalancing:DeleteListener",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:DeleteRule",
                "elasticloadbalancing:DeleteTargetGroup",
                "elasticloadbalancing:DeregisterTargets",
                "elasticloadbalancing:DescribeListeners",
                "elasticloadbalancing:DescribeListenerCertificates",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeRules",
                "elasticloadbalancing:DescribeSSLPolicies",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:DescribeTargetGroups",
                "elasticloadbalancing:DescribeTargetGroupAttributes",
                "elasticloadbalancing:DescribeTargetHealth",
                "elasticloadbalancing:ModifyListener",
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:ModifyRule",
                "elasticloadbalancing:ModifyTargetGroup",
                "elasticloadbalancing:ModifyTargetGroupAttributes",
                "elasticloadbalancing:RegisterTargets",
                "elasticloadbalancing:RemoveTags",
                "elasticloadbalancing:SetIpAddressType",
                "elasticloadbalancing:SetSecurityGroups",
                "elasticloadbalancing:SetSubnets",
                "elasticloadbalancing:SetWebACL"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:GetServerCertificate",
                "iam:ListServerCertificates"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "waf-regional:GetWebACLForResource",
                "waf-regional:GetWebACL",
                "waf-regional:AssociateWebACL",
                "waf-regional:DisassociateWebACL"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "tag:GetResources",
                "tag:TagResources"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "waf:GetWebACL"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}



resource "aws_iam_policy" "vault-ha-dynamodb-table-read-write" {
  name        = "vault-ha-dynamodb-table-read-write"
  path        = "/"
  description = "For vault ha to read and write to dynamo db tables"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "dynamodb:DescribeLimits",
                "dynamodb:DescribeTimeToLive",
                "dynamodb:ListTagsOfResource",
                "dynamodb:DescribeReservedCapacityOfferings",
                "dynamodb:DescribeReservedCapacity",
                "dynamodb:ListTables",
                "dynamodb:BatchGetItem",
                "dynamodb:BatchWriteItem",
                "dynamodb:CreateTable",
                "dynamodb:DeleteItem",
                "dynamodb:GetItem",
                "dynamodb:GetRecords",
                "dynamodb:PutItem",
                "dynamodb:Query",
                "dynamodb:UpdateItem",
                "dynamodb:Scan",
                "dynamodb:DescribeTable"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:dynamodb:eu-west-2:422126600089:table/nlc-prod-vault-data"
            ]
        }
    ]
}
EOF

}

# NOTE - this will manually be used as part of the vault HA install in deployment - see tf outputs for value of key id 

resource "aws_kms_key" "vault-auto-unseal-key" {
  description = "Auto unseal key for the ha vault instance"
  tags = {
    terraform_managed = "true"
  }

}

resource "aws_iam_policy" "kms-key-vault-usage" {
  name        = "kms-key-vault-usage"
  path        = "/"
  description = "Allows the vault server to use the KMS key created above"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
             "Effect": "Allow",
             "Action": [
               "kms:Encrypt",
               "kms:Decrypt",
               "kms:DescribeKey"
              ],
             "Resource": "*"
        }
    ]
}
EOF
}

