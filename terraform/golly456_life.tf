# ===========================================================================
# golly456.life DNS records
# Migrated from NameCheap BIND export.
#
# Notes:
#   - NS and SOA records are created automatically by Route 53; omitted here.
#   - NameCheap ALIAS at the zone apex (golly456.life → ch4zm.github.io) is
#     converted to A records using GitHub Pages IPs, since Route 53 does not
#     support CNAME at the zone apex.
#   - CloudFront ALIAS records (NameCheap type ALIAS, TTL 300) become Route 53
#     A ALIAS records. CloudFront's fixed Route 53 zone ID is Z2FDTNDATAQYW2.
#   - NameCheap export had a duplicate CNAME label for
#     _91472b33c137f3f7bb74a79de23705cf.cloud.vi.golly456.life with two
#     different values. Route 53 requires a single CNAME value; the value
#     consistent with the star.vi cert validation is used here.
# ===========================================================================

locals {
  golly456_life_zone_id = aws_route53_zone.golly456_life.zone_id
}

# ---------------------------------------------------------------------------
# Root records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly456_life_root_mx" {
  zone_id = local.golly456_life_zone_id
  name    = "golly456.life"
  type    = "MX"
  ttl     = 1800
  records = [
    "10 eforward1.registrar-servers.com.",
    "10 eforward2.registrar-servers.com.",
    "10 eforward3.registrar-servers.com.",
    "15 eforward4.registrar-servers.com.",
    "20 eforward5.registrar-servers.com.",
  ]
}

resource "aws_route53_record" "golly456_life_root_txt" {
  zone_id = local.golly456_life_zone_id
  name    = "golly456.life"
  type    = "TXT"
  ttl     = 1800
  records = ["v=spf1 include:spf.efwd.registrar-servers.com ~all"]
}

# NameCheap had: golly456.life ALIAS → ch4zm.github.io
# Route 53 cannot have CNAME at zone apex; using GitHub Pages A record IPs instead.
resource "aws_route53_record" "golly456_life_root_a" {
  zone_id = local.golly456_life_zone_id
  name    = "golly456.life"
  type    = "A"
  ttl     = 1799
  records = local.github_pages_ips
}

# ---------------------------------------------------------------------------
# Site subdomains — CNAME to ch4zm.github.io (GitHub Pages)
# golly456.life uses *.integration.golly456.life for the frontend sites.
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly456_life_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_dragon_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "dragon.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_hellmouth_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "hellmouth.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_ii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "ii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_iii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "iii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_iv_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "iv.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_klein_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "klein.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_pseudo_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "pseudo.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_rainbow_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "rainbow.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_ii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.ii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_iii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.iii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_iv_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.iv.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_v_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.v.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_vi_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.vi.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_vii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.vii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_star_viii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "star.viii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_toroidal_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "toroidal.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_v_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "v.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_vi_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "vi.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_vii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "vii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly456_life_viii_integration" {
  zone_id = local.golly456_life_zone_id
  name    = "viii.integration.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

# ---------------------------------------------------------------------------
# cloud.*.golly456.life — CloudFront ALIAS records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly456_life_cloud_dragon" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.dragon.golly456.life"
  type    = "A"
  alias {
    name                   = "d2ygyyhv1puoht.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_hellmouth" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.hellmouth.golly456.life"
  type    = "A"
  alias {
    name                   = "d22b23mmul91v7.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_ii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.ii.golly456.life"
  type    = "A"
  alias {
    name                   = "d1gl13gsn8b1qb.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_iii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.iii.golly456.life"
  type    = "A"
  alias {
    name                   = "ddmuxaz46somo.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_iv" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.iv.golly456.life"
  type    = "A"
  alias {
    name                   = "dcqmdgnk3y4hg.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_klein" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.klein.golly456.life"
  type    = "A"
  alias {
    name                   = "d3rotaskz5pyy3.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_pseudo" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.pseudo.golly456.life"
  type    = "A"
  alias {
    name                   = "d3se9esfzp49a5.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_rainbow" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.rainbow.golly456.life"
  type    = "A"
  alias {
    name                   = "dqbxcjif0yr91.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_star" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.golly456.life"
  type    = "A"
  alias {
    name                   = "d352218pbgfg85.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_star_ii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.ii.golly456.life"
  type    = "A"
  alias {
    name                   = "d24wdaxojle28u.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_star_iii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.iii.golly456.life"
  type    = "A"
  alias {
    name                   = "d1qkqvemwa3eyx.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_star_iv" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.iv.golly456.life"
  type    = "A"
  alias {
    name                   = "d2vsc7gt2zuqfs.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_star_v" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.v.golly456.life"
  type    = "A"
  alias {
    name                   = "d1x5s3mw4kajxy.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_star_vi" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.vi.golly456.life"
  type    = "A"
  alias {
    name                   = "drna6ojlwfgfc.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_toroidal" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.toroidal.golly456.life"
  type    = "A"
  alias {
    name                   = "dpq149kl5v4nf.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_v" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.v.golly456.life"
  type    = "A"
  alias {
    name                   = "d3a3u23vpmir3s.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_cloud_vi" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.vi.golly456.life"
  type    = "A"
  alias {
    name                   = "d3rarpd17dadtb.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly456_life_maps" {
  zone_id = local.golly456_life_zone_id
  name    = "maps.golly456.life"
  type    = "A"
  alias {
    name                   = "d1fk8r4luzpxdd.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

# ---------------------------------------------------------------------------
# CAA records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly456_life_caa_cloud" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_dragon" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.dragon.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_hellmouth" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.hellmouth.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_ii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.ii.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_iii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.iii.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_iv" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.iv.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_klein" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.klein.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_pseudo" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.pseudo.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_rainbow" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.rainbow.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_star" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_star_ii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.ii.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_star_iii" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.iii.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_star_iv" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.iv.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_star_v" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.v.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_star_vi" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.star.vi.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_toroidal" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.toroidal.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_v" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.v.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_cloud_vi" {
  zone_id = local.golly456_life_zone_id
  name    = "cloud.vi.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly456_life_caa_maps" {
  zone_id = local.golly456_life_zone_id
  name    = "maps.golly456.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

# ---------------------------------------------------------------------------
# ACM DNS validation CNAME records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly456_life_acm_cloud_star" {
  zone_id = local.golly456_life_zone_id
  name    = "_1bc5f5c2044f86020f61df026039a055.cloud.star.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_4129a7e38ea8b557899df290eef52fb3.fpkndhgbpx.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_star_iii" {
  zone_id = local.golly456_life_zone_id
  name    = "_33b686ded518fe6cd412825e096bf859.cloud.star.iii.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_bdfac70266503d58fe8023d9c9efd180.mhbtsbpdnt.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_star_vi" {
  zone_id = local.golly456_life_zone_id
  name    = "_4795cb90a406e4a1bb704fa2b0bef91e.cloud.star.vi.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_fd17707e66a5211687bffd8cb5fce0f6.xlfgrmvvlj.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_star_ii" {
  zone_id = local.golly456_life_zone_id
  name    = "_48b2d2581c36c68cdbd8481624e2e9fc.cloud.star.ii.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_b4b4230640aa350b5812640858414f73.lwsvfpkkct.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_maps" {
  zone_id = local.golly456_life_zone_id
  name    = "_50b898f01a258cfdab90585ec09b6c5d.maps.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_7bbc043097643898b2f0de6395be8ee0.zjfbrrwmzc.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_iii" {
  zone_id = local.golly456_life_zone_id
  name    = "_50bc9fc86515465cd58bcf524cbf0ffe.cloud.iii.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_bb2426b485771d70354bc86116610da6.mhbtsbpdnt.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud" {
  zone_id = local.golly456_life_zone_id
  name    = "_597381a38a0bef7cac1e3a926d4ab17d.cloud.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_b4281a64471ad1666c26c1136f31ea92.nfyddsqlcy.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_v" {
  zone_id = local.golly456_life_zone_id
  name    = "_7910eab03a8bd0478127ea2808c1148f.cloud.v.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_b4ceec82eac783074b809b5a11e6d4b8.zfyfvmchrl.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_klein" {
  zone_id = local.golly456_life_zone_id
  name    = "_86bf91fd1260645e7c49d2ec5633abde.cloud.klein.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_d427f42bbc114da4784032bcde110312.gskhnxswdw.acm-validations.aws."]
}

# NOTE: NameCheap export had two CNAME values for this label (duplicate):
#   _58bf6f9737a0df2337292403f3c70946.xlfgrmvvlj.acm-validations.aws.
#   _fd17707e66a5211687bffd8cb5fce0f6.xlfgrmvvlj.acm-validations.aws.
# Route 53 requires exactly one CNAME value. Using the second value, which is
# consistent with the star.vi cert validation record above.
resource "aws_route53_record" "golly456_life_acm_cloud_vi" {
  zone_id = local.golly456_life_zone_id
  name    = "_91472b33c137f3f7bb74a79de23705cf.cloud.vi.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_fd17707e66a5211687bffd8cb5fce0f6.xlfgrmvvlj.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_toroidal" {
  zone_id = local.golly456_life_zone_id
  name    = "_9733751139b5844d0be7ec27a1fe1a01.cloud.toroidal.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_6a1f33fc4a586dbea7b93b9241af6d97.bbfvkzsszw.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_dragon" {
  zone_id = local.golly456_life_zone_id
  name    = "_99d9a53de0f879de74bdb16203add265.cloud.dragon.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_c303a1b04a93e698fdac6005d7f18594.mvtxpqxpkb.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_iv" {
  zone_id = local.golly456_life_zone_id
  name    = "_9bb9ecf345007bce5e53913f8a692c48.cloud.iv.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_98aedde57f10b21d9c0455eb6005bfb5.sdgjtdhdhz.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_hellmouth" {
  zone_id = local.golly456_life_zone_id
  name    = "_aa4cda5765c17e3822e9d76d3fdbe2a9.cloud.hellmouth.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_2830ebbd2165488a113e518af3739adb.bbfvkzsszw.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_star_iv" {
  zone_id = local.golly456_life_zone_id
  name    = "_be0f54c6c7a4f805db43e3870448024b.cloud.star.iv.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_747a94da3046d1f42f1b611f776cf459.sdgjtdhdhz.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_ii" {
  zone_id = local.golly456_life_zone_id
  name    = "_e13c8ee531b10fa5596fb4b13892527b.cloud.ii.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_e4834351d162775b727d1a7f1b3db29b.ycvykntjsl.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_rainbow" {
  zone_id = local.golly456_life_zone_id
  name    = "_e641f5be63ff1b8143aa76157333c2d3.cloud.rainbow.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_8e7bdf46d84f4150f43c4c2e62d0644b.gxwgcdsjsl.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_star_v" {
  zone_id = local.golly456_life_zone_id
  name    = "_ec6b9259c2d24cfe2f68c02c5e2f79a4.cloud.star.v.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_97311ea4716cba059109fa0ba133e788.zfyfvmchrl.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_pseudo" {
  zone_id = local.golly456_life_zone_id
  name    = "_f404658f3871b06ba3fe6497fcf35acc.cloud.pseudo.golly456.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_b115f5fbfbdeb2f5159b1d5246009e3c.bbfvkzsszw.acm-validations.aws."]
}

resource "aws_route53_record" "golly456_life_acm_cloud_vii" {
  zone_id         = local.golly456_life_zone_id
  name            = "_188c99a2383c6cfb5df9eb5cfd7294eb.cloud.vii.golly456.life"
  type            = "CNAME"
  ttl             = 1799
  records         = ["_02661c6a65a9659c66d7f1b08fbb45ef.jkddzztszm.acm-validations.aws"]
  allow_overwrite = true
}
