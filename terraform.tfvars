# iam-users
aws_iam_users = ["Clavelle", "Howard-Thibbs-III","Theodore-Pendergrass","Grandmaster-Caz","Charlie-Brown","Busta-Rhymes"]

# iam-groups
aws_iam_group_members = {
    "Funky-Finger-Productions" = ["Clavelle", "Howard-Thibbs-III"]
    "The-Blue-Notes" = ["Theodore-Pendergrass"]
    "Cold-Crush-Brothers" = ["Grandmaster-Caz"]
    "Leaders-Of-The-New-School" = ["Charlie-Brown", "Busta-Rhymes"]
}

# JSON polices for each iam group
json_policices = {    

# iam group 1 permissions
# has admin privileges
    "Funky-Finger-Productions" = {
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Action"   = "*"
        "Effect"   = "Allow"
        "Resource" = "*"
      },
    ]
  },

# iam group 2 policy permissions
# allows ec2 actions
# to start, run, stop, and terminate an instance
    "The-Blue-Notes" = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "ec2:StopInstances",
          "ec2:StartInstances"
        ],
        "Resource" : "*"
      }
    ]
    },

# iam group 3 policy permissions
# allows access to modify attributes
# of an ec2 instance snapshot    
    "Cold-Crush-Brothers" = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "ec2:ModifySnapshotAttribute",
        "Resource" : "arn:aws:ec2:us-east-1::snapshot/*",
        "Condition" : {
          "StringEquals" : {
            "aws:ResourceTag/user-name" : "&{aws:username}"
          }
        }
      }
    ]
    },

# iam group 4 policy permissions
# blocks ec2 access in the eu-central-l (Frankfurt) region    
    "Leaders-Of-The-New-School" = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Action" : "ec2:*",
        "Resource" : "*",
        "Condition" : {
          "StringNotEquals" : {
            "ec2:Region" : "eu-central-1"
          }
        }
      }
    ]
  }

  }