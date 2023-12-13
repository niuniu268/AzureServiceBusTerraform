# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


provider "azurerm" {
  features {}
  client_id       = "2c846921-f19f-4394-adc0-8f9761ade1b1"
  client_secret   = "aJZ8Q~zDflMFbu1LWi40OBOP8-wqE~2ENkQtKbL4"
  tenant_id       = "8008c85d-baa3-47ff-a30f-63d8142742a9"
  subscription_id = "9365ab69-ca62-4339-9f92-cbda19d0c9c5"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_servicebus_namespace" "namespace" {
  name                = "${var.prefix}-sbnamespace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_namespace_authorization_rule" "rule" {
  name         = "${var.prefix}-sbnauth"
  namespace_id = azurerm_servicebus_namespace.namespace.id
  send         = true
  listen       = true
  manage       = true
}

resource "azurerm_servicebus_topic" "topic_id_1" {
  name                = "${var.prefix}-sbtopic"
  namespace_id        = azurerm_servicebus_namespace.namespace.id
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "subscription_id_1" {
  name               = "${var.prefix}-sbsubscription"
  topic_id           = azurerm_servicebus_topic.topic_id_1.id
  max_delivery_count = 1
  default_message_ttl = "PT10S"
  dead_lettering_on_message_expiration = true
}

resource "azurerm_servicebus_queue" "queue_1" {
  name                = "${var.prefix}-sbqueue"
  namespace_id        = azurerm_servicebus_namespace.namespace.id
  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "queue_auth_rule" {
  name     = "${var.prefix}-sbqueue-auth-rule"
  queue_id = azurerm_servicebus_queue.queue_1.id
  send     = true
  listen   = true
  manage   = true
}
