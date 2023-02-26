
/*=============VPC=============*/
resource "google_compute_network" "vpc" {
  name                            = var.network_name #R- 
  auto_create_subnetworks         = false              #O- to create Our custom subnets
  #routing_mode                    = "GLOBAL"          #O- this network's cloud routers will advertise routes with all subnetworks of this network, across regions.
  #delete_default_routes_on_create = true              #O- default routes - IGW (0.0.0.0/0) - will be deleted immediately after network creation. Defaults to false
}
/*=============Subnets=============*/
resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name     #R-
  ip_cidr_range            = var.subnet-cider                  #R- Ranges must be unique and non-overlapping within a network. Only IPv4 is supported.
  region                   = var.region                      #O- the GCP region for this subnetwork.
  network                  = google_compute_network.vpc.name #R- The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks.
  private_ip_google_access = true       ##Not needed for Public subnet        #O-  When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access.
}



resource "google_compute_firewall" "ssh" {
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
  name          = "allowing-ssh"#format("%s-bastion-ssh", var.bastion_name)   #R-  Name of the resource. Provided by the client when the resource is created.Last character cannot be a dash.
  network       = var.network_name                             #R-  The name or self_link of the network to attach this firewall to.
  direction     = "INGRESS"
  project       = var.project_id
  source_ranges = ["35.235.240.0/20"] 
  target_tags = ["vm"]
  allow {
    #O- The list of ALLOW rules specified by this firewall. 
    #Each rule specifies a protocol and port-range tuple that describes a permitted connection.
    protocol = "tcp"   #R- The protocol type is required when creating a firewall rule.(tcp, udp, icmp, esp, ah, sctp, ipip, all), or the IP protocol number
    ports    = ["22"]  #O- List of ports  [integer or a range] to which this rule applies. This field is only applicable for UDP or TCP protocol.
    ##Note if ports not specified, this rule applies to connections through any port.
  } 

}

# /*=============Router=============*/

# resource "google_compute_router" "router" {
#   name    = "${google_compute_network.vpc.name}-router"
#   region  = google_compute_subnetwork.subnet.region
#   network = google_compute_network.vpc.name
# }

# resource "google_compute_router_nat" "nat_router" {
#   name                               = "${google_compute_subnetwork.subnet.name}-nat-router"
#   router                             = google_compute_router.router.name #NAT can not be created without dedicated router
#   region                             = google_compute_router.router.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

#   subnetwork {
#     name                    = google_compute_subnetwork.subnet.name
#     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
#   }

# }
