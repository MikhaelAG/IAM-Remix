variable "aws_iam_users" {
   description =   "This is for iam user names"
    type = list(string) #["USERS1", "USERS2",...,"USERS[K]"]
}

variable "aws_iam_group_members" {
   description =   "This is for each iam group-user memberships"
   type = map(list(string)) #"GROUP 1" = [""] "GROUP 2" = [""] "GROUP 3" = [""]
                              # key-value relationships for the for_each argument
}

variable "json_policices"{
   description = "These are the JSON policies"
   type = any
}