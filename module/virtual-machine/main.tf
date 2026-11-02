data "azurerm_subnet" "subnet-data" {
    for_each = var.vms
    name                 = each.value.subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "ip-data" {
    for_each = var.vms
    name                = each.value.public_ip_name
    resource_group_name = each.value.resource_group_name
}



resource "azurerm_network_interface" "nic" {
    for_each = var.vms
    name                = each.value.nic_name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
        name                          = each.value.ip_configuration.configuration_name
        subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
        private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
        public_ip_address_id          = data.azurerm_public_ip.ip-data[each.key].id
    }
}


resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vms
    name                = each.value.vm_name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    size                = each.value.size
    admin_username      = each.value.user
    admin_password      = each.value.password
    disable_password_authentication = each.value.disable_password_authentication
    network_interface_ids = [
        azurerm_network_interface.nic[each.key].id,
    ]

    os_disk {
        caching              = each.value.os_disk.caching
        storage_account_type = each.value.os_disk.storage_account_type
    }

    source_image_reference {
        publisher = each.value.source_image_reference.publisher
        offer     = each.value.source_image_reference.offer
        sku       = each.value.source_image_reference.sku
        version   = each.value.source_image_reference.version
    }

}
