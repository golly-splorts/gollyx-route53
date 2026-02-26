# gollyx-route53

Terraform for the `golly.life` and `golly456.life` Route 53 hosted zones, migrated from NameCheap.

## Structure

```
terraform/
  main.tf              — provider (us-east-1) and local backend
  zones.tf             — hosted zone resources + name server outputs
  golly_life.tf        — all records for golly.life
  golly456_life.tf     — all records for golly456.life
```

## Migration steps

1. Apply Terraform to create the zones and all records:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

2. Note the name servers output for each zone:
   ```bash
   terraform output golly_life_name_servers
   terraform output golly456_life_name_servers
   ```

3. In NameCheap, update each domain's nameservers to the four Route 53 NS values.
   DNS will cut over once NameCheap propagates the NS delegation (TTL: up to 48h).

## Notes

- **Apex records**: NameCheap used their ALIAS feature for the zone apex CNAMEs
  (`golly.life` and `golly456.life` → `ch4zm.github.io`). Route 53 does not
  support CNAME at the zone apex, so these are converted to A records using
  GitHub Pages IPs (`185.199.108.{153,109,110,111}`).

- **Duplicate ACM validation record**: NameCheap's export contained two CNAME
  values for `_91472b33c137f3f7bb74a79de23705cf.cloud.vi.golly456.life`. Route 53
  requires a single value; see the comment in `golly456_life.tf`.

- **CloudFront ALIAS records**: NameCheap ALIAS records (TTL 300) become Route 53
  A ALIAS records pointing to the same CloudFront distributions. The CloudFront
  Route 53 zone ID (`Z2FDTNDATAQYW2`) is an AWS constant.
