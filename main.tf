resource "yandex_vpc_network" "diploma" {
  name        = var.vpc_name
  description = "VPC network for diploma"
}

resource "yandex_vpc_subnet" "diploma" {
  name           = "diploma-subnet"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.diploma.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "diploma" {
  name = "diploma-vm"
  boot_disk {
    initialize_params {
      name       = "disk-ubuntu-24-04-lts-1790857066089"
      type       = "network-hdd"
      size       = 10
      block_size = 4096
      image_id   = "fd8k6or569jh7bsajilr"
    }
    auto_delete = true
  }
  resources {
    cores  = 4
    memory = 4
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  folder_id = var.folder_id
  hostname = "diploma-vm"
  platform_id = "standard-v3"
  network_interface {
    subnet_id = yandex_vpc_subnet.diploma.id
    nat       = true
  }

metadata = {
    serial-port-enable = 1
    ssh-keys = "user:${file("~/.ssh/id_ed25519.pub")}"
  }
}
