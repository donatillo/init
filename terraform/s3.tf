data "aws_caller_identity" "current" {}

data "template_file" "policy" {
	template 	= "${file("policy.json")}"
	vars {
		user    = "${data.aws_caller_identity.current.arn}"
        basename = "${var.basename}"
	}
}

resource "aws_s3_bucket" "backend" {
    bucket      = "${var.basename}-terraform"
	acl         = "private"
    policy      = "${data.template_file.policy.rendered}"
	versioning {
		enabled = true
	}
    tags {
        Creator = "init"
        Description = "Terraform backend file repository"
    }
}

# vim:ts=4:sw=4:sts=4:expandtab:syntax=conf
