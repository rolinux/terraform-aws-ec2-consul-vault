/*
Return the IP address allocated my your ISP
Useful later on for Security Groups ingress
*/
data "external" "my_ip" {
  program = ["python3", "${path.module}/my_ip.py"]
  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    id = "abc123"
  }
}

