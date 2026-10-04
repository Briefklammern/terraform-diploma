resource "local_file" "inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content = templatefile("${path.module}/template.tpl", {
    hosts = [
      {
        name = yandex_compute_instance.diploma.name
        ip   = yandex_compute_instance.diploma.network_interface[0].nat_ip_address
        user = "user"
      }
    ]
  })
}
