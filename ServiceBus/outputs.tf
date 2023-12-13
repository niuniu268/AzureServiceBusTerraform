# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "namespace_connection_string" {
  value = "Endpoint=sb://mytfresourcegroup-sbnamespace.servicebus.windows.net/;SharedAccessKeyName=rootkeys;SharedAccessKey=z+5kaujfsjpZQSfnwJlutnx91iDYdDNK0+ASbIHQYIc=;EntityPath=mytfresourcegroup-sbtopic"
}

output "shared_access_policy_primarykey" {
  value = "z+5kaujfsjpZQSfnwJlutnx91iDYdDNK0+ASbIHQYIc="
}
