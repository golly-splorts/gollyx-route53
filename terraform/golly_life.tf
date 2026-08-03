# ===========================================================================
# golly.life DNS records
# Migrated from NameCheap BIND export.
#
# Notes:
#   - NS and SOA records are created automatically by Route 53; omitted here.
#   - NameCheap ALIAS at the zone apex (golly.life → ch4zm.github.io) is
#     converted to A records using GitHub Pages IPs, since Route 53 does not
#     support CNAME at the zone apex.
#   - CloudFront ALIAS records (NameCheap type ALIAS, TTL 300) become Route 53
#     A ALIAS records. CloudFront's fixed Route 53 zone ID is Z2FDTNDATAQYW2.
# ===========================================================================

locals {
  golly_life_zone_id = aws_route53_zone.golly_life.zone_id
  # GitHub Pages IPs — used for apex A records in place of NameCheap ALIAS to ch4zm.github.io
  github_pages_ips = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]
  # Route 53 zone ID for CloudFront distributions (AWS constant, never changes)
  cloudfront_zone_id = "Z2FDTNDATAQYW2"
}

# ---------------------------------------------------------------------------
# Root records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly_life_root_mx" {
  zone_id = local.golly_life_zone_id
  name    = "golly.life"
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

resource "aws_route53_record" "golly_life_root_txt" {
  zone_id = local.golly_life_zone_id
  name    = "golly.life"
  type    = "TXT"
  ttl     = 1800
  records = [
    "google-site-verification=cxJR11LRRszTfi32D0KTiaCP-VONZ7Eiyi_rq8Er8bM",
    "v=spf1 include:spf.efwd.registrar-servers.com ~all",
  ]
}

# NameCheap had: golly.life ALIAS → ch4zm.github.io
# Route 53 cannot have CNAME at zone apex; using GitHub Pages A record IPs instead.
resource "aws_route53_record" "golly_life_root_a" {
  zone_id = local.golly_life_zone_id
  name    = "golly.life"
  type    = "A"
  ttl     = 1799
  records = local.github_pages_ips
}

# ---------------------------------------------------------------------------
# Site subdomains — CNAME to ch4zm.github.io (GitHub Pages)
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly_life_dragon" {
  zone_id = local.golly_life_zone_id
  name    = "dragon.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_hellmouth" {
  zone_id = local.golly_life_zone_id
  name    = "hellmouth.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_ii" {
  zone_id = local.golly_life_zone_id
  name    = "ii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_iii" {
  zone_id = local.golly_life_zone_id
  name    = "iii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_iv" {
  zone_id = local.golly_life_zone_id
  name    = "iv.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_klein" {
  zone_id = local.golly_life_zone_id
  name    = "klein.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_pseudo" {
  zone_id = local.golly_life_zone_id
  name    = "pseudo.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_rainbow" {
  zone_id = local.golly_life_zone_id
  name    = "rainbow.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star" {
  zone_id = local.golly_life_zone_id
  name    = "star.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_ii" {
  zone_id = local.golly_life_zone_id
  name    = "star.ii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_iii" {
  zone_id = local.golly_life_zone_id
  name    = "star.iii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_iv" {
  zone_id = local.golly_life_zone_id
  name    = "star.iv.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_v" {
  zone_id = local.golly_life_zone_id
  name    = "star.v.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_vi" {
  zone_id = local.golly_life_zone_id
  name    = "star.vi.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_vii" {
  zone_id = local.golly_life_zone_id
  name    = "star.vii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_star_viii" {
  zone_id = local.golly_life_zone_id
  name    = "star.viii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_toroidal" {
  zone_id = local.golly_life_zone_id
  name    = "toroidal.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_v" {
  zone_id = local.golly_life_zone_id
  name    = "v.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_vi" {
  zone_id = local.golly_life_zone_id
  name    = "vi.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_vii" {
  zone_id = local.golly_life_zone_id
  name    = "vii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

resource "aws_route53_record" "golly_life_viii" {
  zone_id = local.golly_life_zone_id
  name    = "viii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["ch4zm.github.io."]
}

# ---------------------------------------------------------------------------
# cloud.*.golly.life — CloudFront ALIAS records (TTL 300 in NameCheap)
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly_life_cloud_dragon" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.dragon.golly.life"
  type    = "A"
  alias {
    name                   = "d7c7e142sg7b9.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_hellmouth" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.hellmouth.golly.life"
  type    = "A"
  alias {
    name                   = "d1u7kmw8g1h76z.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_ii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.ii.golly.life"
  type    = "A"
  alias {
    name                   = "dw9k8za0a4chu.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_iii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.iii.golly.life"
  type    = "A"
  alias {
    name                   = "d1f8uba621ok6h.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_iv" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.iv.golly.life"
  type    = "A"
  alias {
    name                   = "dyqqh3sgus9hb.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_klein" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.klein.golly.life"
  type    = "A"
  alias {
    name                   = "d2x4cugm8eprpz.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_pseudo" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.pseudo.golly.life"
  type    = "A"
  alias {
    name                   = "dary91xlapyh3.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_rainbow" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.rainbow.golly.life"
  type    = "A"
  alias {
    name                   = "d3llprhwlnyb86.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_star" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.golly.life"
  type    = "A"
  alias {
    name                   = "d2n88csx2jo4d1.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_star_ii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.ii.golly.life"
  type    = "A"
  alias {
    name                   = "d2z244rnqw2xt8.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_star_iii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.iii.golly.life"
  type    = "A"
  alias {
    name                   = "d1krjxwzpepp0f.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_star_iv" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.iv.golly.life"
  type    = "A"
  alias {
    name                   = "d2qgnnl5faf3lx.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_star_v" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.v.golly.life"
  type    = "A"
  alias {
    name                   = "dbju9nsicar0.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_star_vi" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.vi.golly.life"
  type    = "A"
  alias {
    name                   = "d1kkdrbgzxvw0m.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_toroidal" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.toroidal.golly.life"
  type    = "A"
  alias {
    name                   = "d1x048n0jds5do.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_v" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.v.golly.life"
  type    = "A"
  alias {
    name                   = "d2yaaovl1bivyb.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_cloud_vi" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.vi.golly.life"
  type    = "A"
  alias {
    name                   = "d2fdb28fxj1tw8.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_maps" {
  zone_id = local.golly_life_zone_id
  name    = "maps.golly.life"
  type    = "A"
  alias {
    name                   = "d30sdnoh8yuqw6.cloudfront.net"
    zone_id                = local.cloudfront_zone_id
    evaluate_target_health = false
  }
}

# ---------------------------------------------------------------------------
# CAA records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly_life_caa_cloud" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_dragon" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.dragon.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_hellmouth" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.hellmouth.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_ii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.ii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_iii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.iii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_iv" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.iv.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_klein" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.klein.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_pseudo" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.pseudo.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_rainbow" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.rainbow.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star_ii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.ii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star_iii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.iii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star_iv" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.iv.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star_v" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.v.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star_vi" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.vi.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_toroidal" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.toroidal.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_v" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.v.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_vi" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.vi.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_maps" {
  zone_id = local.golly_life_zone_id
  name    = "maps.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_vii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.vii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_caa_cloud_star_vii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.vii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

# ---------------------------------------------------------------------------
# ACM DNS validation CNAME records
# ---------------------------------------------------------------------------

resource "aws_route53_record" "golly_life_acm_cloud_star_ii" {
  zone_id = local.golly_life_zone_id
  name    = "_082b0197e9ec53f4559a9092c4b4be0d.cloud.star.ii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_e110496c022e89fc6a4c9a99833a8484.lwsvfpkkct.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_star_iii" {
  zone_id = local.golly_life_zone_id
  name    = "_0bd603ecd80c83fa0cbe8be52823ede5.cloud.star.iii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_a88db06a5fd9279c2b085b9dbb61dbf7.mhbtsbpdnt.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_star_iv" {
  zone_id = local.golly_life_zone_id
  name    = "_29b6262d4c4630b24b17d4ba6fd12052.cloud.star.iv.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_5326770a8433a822dcb6d64404232ad6.sdgjtdhdhz.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_star_v" {
  zone_id = local.golly_life_zone_id
  name    = "_3b909b76a76bd617810a073cc70b9211.cloud.star.v.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_866ddd578884cc08b843b86e500bc6f6.zfyfvmchrl.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_rainbow" {
  zone_id = local.golly_life_zone_id
  name    = "_457432930c7d8a4a7a10c9c9d2b5b5d0.cloud.rainbow.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_15e8f8844c66b1d785d6adbc80a6fbbf.gxwgcdsjsl.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_toroidal" {
  zone_id = local.golly_life_zone_id
  name    = "_5447bb62f61eb8aa66c768c4c1bbc835.cloud.toroidal.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_f60d15638ce5f0ba3a754bcf83aeb8d6.bbfvkzsszw.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_vi" {
  zone_id = local.golly_life_zone_id
  name    = "_6d223d0fa6fe40f378cca8838e33231d.cloud.vi.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_f69874b0bcfcaab3106f8cc5ff55759a.xlfgrmvvlj.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_v" {
  zone_id = local.golly_life_zone_id
  name    = "_7cc2697f34e446a0e82856a627a8089d.cloud.v.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_35d6193e866cafbfeb40d48061c97400.zfyfvmchrl.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_dragon" {
  zone_id = local.golly_life_zone_id
  name    = "_882d8900028bbb2f71d5e48b69cd322f.cloud.dragon.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_564c9bd254027814411c5b7835604561.mvtxpqxpkb.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_pseudo" {
  zone_id = local.golly_life_zone_id
  name    = "_b0f88b29c9772184e073ea830dbb97b7.cloud.pseudo.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_fe2890115bbe11d9cae660d1c8bb6ddc.zjfbrrwmzc.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_ii" {
  zone_id = local.golly_life_zone_id
  name    = "_bddbc1e2bcd8a90e2b5e0cee68cda1c1.cloud.ii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_77262461d52d4ec4c9e88b16af1f3c27.ycvykntjsl.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_klein" {
  zone_id = local.golly_life_zone_id
  name    = "_c84b8443c2972e47c5c96cb585e4481a.cloud.klein.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_a9d92e07e2e38f1fd8eedb08f38fb5f1.gskhnxswdw.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud" {
  zone_id = local.golly_life_zone_id
  name    = "_cbbc77ad7e2f35682af7edccd11f931c.cloud.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_b12039849458ec76e4969573deffa1dc.nfyddsqlcy.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_maps" {
  zone_id = local.golly_life_zone_id
  name    = "_cf16fb8a1b2a4d4e467fc12ad80fce30.maps.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_360a754bfaf281b1240447590441362a.zjfbrrwmzc.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_star" {
  zone_id = local.golly_life_zone_id
  name    = "_d0897daad9a5f0a288dbddbacb14ea86.cloud.star.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_63d679e93b32b0b4974cee9ef769399f.fpkndhgbpx.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_hellmouth" {
  zone_id = local.golly_life_zone_id
  name    = "_d9d37a7ff4a69c09b89a731c46fb2447.cloud.hellmouth.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_2f70e00d60435b9aa41c487231965350.bbfvkzsszw.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_iii" {
  zone_id = local.golly_life_zone_id
  name    = "_dd58f16dcbc356efc68a3f0aa8383ecf.cloud.iii.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_ac9d59cd3ec4118b705f0ce296d8244f.mhbtsbpdnt.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_iv" {
  zone_id = local.golly_life_zone_id
  name    = "_e8832598559cad0cc7a4052c44b2411a.cloud.iv.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_4d5935a53c3f97a3559256a88bb426ec.sdgjtdhdhz.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_star_vi" {
  zone_id = local.golly_life_zone_id
  name    = "_eac966b65c687f8687d3340677ee0ff6.cloud.star.vi.golly.life"
  type    = "CNAME"
  ttl     = 1799
  records = ["_78e942e2ceec95f7be0f91dbd7cf75cf.xlfgrmvvlj.acm-validations.aws."]
}

resource "aws_route53_record" "golly_life_acm_cloud_vii" {
  zone_id         = local.golly_life_zone_id
  name            = "_b88721bf541e253928f981ca2430b40c.cloud.vii.golly.life"
  type            = "CNAME"
  ttl             = 1799
  records         = ["_e316d8190be3a4f5c475bd89e5ae8163.jkddzztszm.acm-validations.aws"]
  allow_overwrite = true
}

resource "aws_route53_record" "golly_life_acm_cloud_star_vii" {
  zone_id         = local.golly_life_zone_id
  name            = "_5c857cdffb2c8de1e0b44c0c9bf92b43.cloud.star.vii.golly.life"
  type            = "CNAME"
  ttl             = 1799
  records         = ["_85d2de4761f4331f8835260e3f4017a9.jkddzztszm.acm-validations.aws"]
  allow_overwrite = true
}

resource "aws_api_gateway_domain_name" "golly_life_apigw_cloud_star_vii" {
  provider        = aws.api_region
  domain_name     = "cloud.star.vii.golly.life"
  certificate_arn = "arn:aws:acm:us-east-1:699103353083:certificate/c761e07f-a322-45ea-ab98-a594745aa7f6"
}

resource "aws_api_gateway_base_path_mapping" "golly_life_apigw_cloud_star_vii" {
  provider    = aws.api_region
  api_id      = "1z9fxxkbkd"
  stage_name  = "prod"
  domain_name = aws_api_gateway_domain_name.golly_life_apigw_cloud_star_vii.domain_name
}

resource "aws_route53_record" "golly_life_cloud_star_vii" {
  zone_id         = local.golly_life_zone_id
  name            = "cloud.star.vii.golly.life"
  type            = "A"
  allow_overwrite = true
  alias {
    name                   = "d1hp0vb38a1z63.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_api_gateway_domain_name" "golly_life_apigw_cloud_vii" {
  provider        = aws.api_region
  domain_name     = "cloud.vii.golly.life"
  certificate_arn = "arn:aws:acm:us-east-1:699103353083:certificate/35bd0369-57f7-4598-8e0b-a4e54cbfcd8e"
}

resource "aws_api_gateway_base_path_mapping" "golly_life_apigw_cloud_vii" {
  provider    = aws.api_region
  api_id      = "0hcl5hqbca"
  stage_name  = "prod"
  domain_name = aws_api_gateway_domain_name.golly_life_apigw_cloud_vii.domain_name
}

resource "aws_route53_record" "golly_life_cloud_vii" {
  zone_id         = local.golly_life_zone_id
  name            = "cloud.vii.golly.life"
  type            = "A"
  allow_overwrite = true
  alias {
    name                   = "d1asln4c82746m.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "golly_life_caa_cloud_star_viii" {
  zone_id = local.golly_life_zone_id
  name    = "cloud.star.viii.golly.life"
  type    = "CAA"
  ttl     = 1799
  records = ["0 issue \"amazon.com\""]
}

resource "aws_route53_record" "golly_life_acm_cloud_star_viii" {
  zone_id         = local.golly_life_zone_id
  name            = "_5011666a962a7b5f2a1c025ff012665e.cloud.star.viii.golly.life"
  type            = "CNAME"
  ttl             = 1799
  records         = ["_43948f82290c058b19bbeaa5d7a752fd.jkddzztszm.acm-validations.aws"]
  allow_overwrite = true
}
