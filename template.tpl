[diploma]
%{ for host in hosts ~}
${host.name} ansible_host=${host.ip} ansible_user=${host.user}
%{ endfor ~}
