resource "aws_resourcegroups_group" "r" {
    name = "init"
    description = "All backend resources."
    
    resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": ["AWS::AllSupported"],
  "TagFilters": [
    {
      "Key": "Creator",
      "Values": ["init"]
    }
  ]
}
JSON
  }
}

# vim:ts=4:sw=4:sts=4:expandtab:syntax=conf
