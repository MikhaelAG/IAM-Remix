# General syntax for creating an Output
#   outputs similar to using print() function in Python

#   output "whatever_you_like" {
#    value = <Resource_type>.<Reference_name>.<whatever>
#    where .<whatever> = .id / .name / .arn / .json / etc.
#   }

#   display output value for the iam users
#   output by iam user arn 
output "aws_iam_user_arns" {
    description = "This ouputs the arns associated for each iam user"
    value = {
        for key, value in aws_iam_user.users: key => value.arn
    }  
}

# display output value for the iam groups
# output by the iam group arn
output "aws_iam_group_arns" {
    description = "This ouputs the arns associated for each iam group"
    value = {
        for key, value in aws_iam_group.aws_iam_groups: key => value.arn
    }
}

# display output value for the name of each iam group policy
output "aws_iam_group_policies" {
    description = "This ouputs the names associated for each iam groupo"
    value = {
        for key, value in aws_iam_group_policy.group_permissions: key => value.name
    }  
}
