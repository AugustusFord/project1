#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Get the IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Background the curl requests
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
wait

macid=$(cat /tmp/macid)
local_ipv4=$(cat /tmp/local_ipv4)
az=$(cat /tmp/az)
vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

# Create HTML file
cat <<-HTML > /var/www/html/index.html
<!doctype html>
<html lang="en" class="h-100">
<head>
<title>Details for EC2 instance</title>
<style>
body {
    background-color: #0F6618; 
    color: white;
    font-family: Arial, sans-serif; 
}
div {
    padding: 20px;
    text-shadow: 2px 2px 4px #000000; 
}
</style>
</head>
<body>
<div>
<h1>Passport Bro's</h1>
<h1>Brasileira Beleza</h1>
<iframe width="560" height="315" src="https://www.youtube.com/embed/ocjaskWvcTM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<p><b>Instance Name:</b> $(hostname -f) </p>
<p><b>Instance Private Ip Address: </b> $local_ipv4</p>
<p><b>Availability Zone: </b> $az</p>
<p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
</div>
</body>
</html>
HTML

# Clean up the temp files
rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
