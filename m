Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1E388E6B
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275183; cv=none; b=KP9j5P6F5DNVFidoGtb/YueCWy8RJeAs4xSYNI3aQ5C1ygfzNc+rg/Z7th/kr4NqvPoMhi0+8kZjixv0/mD2XybF3z73jTGDlScHWfACH9WKyTF/U3YJNJY0OrMZ1eR5Z/ZwXoqUe25wIlH94x/ZHKmAIweHhoMt84gVe3cKW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275183; c=relaxed/simple;
	bh=tY5LtCog3bBSuxWmg/ghDO/sg4Hm8rhLygYbFqsWMNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/r1uNqH1hZFteqfLM4IQ2o7shT80gZgrGy4Kp3odVC0wWomk8gryXkZwkdzJERVX+t44cHsu3v7esPDSt8inrVA+Pw1f42uuxeqdpBYnIPak+eVsOG3B1hImvTsiFTgOJ1y+tx3V3xirj4ncu7ycPElj4j5HRex31Zqm3Mj4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ahdrone.com; spf=pass smtp.mailfrom=ahdrone.com; dkim=pass (2048-bit key) header.d=ahdrone.com header.i=@ahdrone.com header.b=Hv/WGoJf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ahdrone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ahdrone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ahdrone.com header.i=@ahdrone.com header.b="Hv/WGoJf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso5428755e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ahdrone.com; s=google; t=1784275179; x=1784879979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyWkM6zopcr2MMl5SvPrurm7WiNsCcjkD9OPElmEF7w=;
        b=Hv/WGoJfmq6RaFSqbBca3GnvwRAS4bkPSYQ2K2PcAzb+R2EwL8JXt+sDMD1Z8B+2qT
         3f3/21CJ+JaSSWPBPApiXQGQTzrAgD257jKNbLx5O9UWhD/gYC9qZVV7Hm7IMd5W9BLt
         8nctvq5u8uJ0oMnNl71PMCBceIhXTgmXs4mtKV6IeGFRbbeVQtTkByiWIu9YYDXIRE4R
         i+c2daRrIAsalIQp0eir1wcbKxXNlsJQ6nwPF1AWOVWix+Buirv5SG9OEZmoIqa6VCpC
         uVc/c44hnlWIlhPIn+ETud9/l9oB4C7hJsY3gm+BMgDgwM1RjnQwmEuDMozUjJudeTQu
         h25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275179; x=1784879979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyWkM6zopcr2MMl5SvPrurm7WiNsCcjkD9OPElmEF7w=;
        b=DTaPT0v+uCb+E4rj7/RctnUo+curinluogSp2NJVSn4LanicfqxWyOITRS0nosCKLt
         knl8gdIFS5sTJVNuTfyqzNJw2/Z9r/vn1oP0KhN3jWhyNNW22A5pedx3Rm9bLSXUhf5n
         9ZnkAX/+r8V8PXwsrh81Y8xN1o4k7EvJPPqzDPZNF5LzqtVeC/gw9faV60IeSZziSYO0
         j4bzW3CrKrVey8uwLheGl1BGOgR8N5jot28H7Y8jyQ6aVwtNpdl2U3QvXiEEHq3V6Qhi
         MQbQyRYQ3TVd/IrdX/1Y7oMqUlDQ7j/tKy3YXWH1vDsAOam4hsHxdpJdNwIA/RHcXACv
         G0Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rprk4abTep8DdSjuy4Y1PlgiCBAzTodZOjKCdGd1FbQzCPyg/LPtihoAPbVU3pB7nvZmrv4szq7iAL7@vger.kernel.org
X-Gm-Message-State: AOJu0YylkJwLuno7czGTNvPd16NuPRSWCs+ADGOacFZB0ZenYXN78Yfz
	l1nlyunb1nxhKUPGSEKiow1QHhjmhJyuMol7xipojDjeH2hXV1T8hU6NumWwaOKEWg==
X-Gm-Gg: AfdE7cn6WLPHFmTpaiBkduR0HgnNIptush12C6qny325AIFtyDDMTx6Nju8wHLJF8CO
	GhvvJnTSalN92OuUvwQ36r08IDzx/ViS8KbFrjsrEa1xiHWOymPEX8ldxOQQ7wV55edqRhLZHQ9
	x4xAZknJGGHYJ0kR4Dj5nHTJt+jEdF6P/AWc/gESfd02vwxOVqxDPGznotBsa2vDdnseJJxsXku
	vBpXWPjyYiOWMcZHbJfd50i93VUbiXL9D+29W2x9AtEzTkiGKd0ej4ADK0W1u1QEykTHG6KISTo
	V6q/gm7cAMTUJjwQyT+XBNorln8cu+4jELzb7SGNeqvJASDGriGVcdz3yJoAfAJdNtmf6mgg7eN
	Hgp6fS4714TH6ZwCMm0I69aY94KsBTjCN+pwSaaLYydxOCPRZNKexXegaOSyo/qJGLnsvUEu3r5
	OW7OOtWG8bVPgFIlu9OJz8GYwNoA==
X-Received: by 2002:a05:600c:705:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-4954a515217mr10032355e9.26.1784275179062;
        Fri, 17 Jul 2026 00:59:39 -0700 (PDT)
Received: from rikus ([2a01:e0a:edb:6330:cc2f:bd70:58a:fcfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm31709045e9.4.2026.07.17.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:59:38 -0700 (PDT)
From: Hugo VALTIER <hugo@ahdrone.com>
To: Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugo VALTIER <hugo@ahdrone.com>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/3] pinctrl: rockchip: extract iomux_recalced_routes_init()
Date: Fri, 17 Jul 2026 09:59:15 +0200
Message-ID: <20260717075918.1869879-3-hugo@ahdrone.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717075918.1869879-1-hugo@ahdrone.com>
References: <20260717075918.1869879-1-hugo@ahdrone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the per-bank recalced_mask and route_mask computation out of
rockchip_pinctrl_get_soc_data() into a separate function and call it
from rockchip_pinctrl_probe().
This allows SoC-specific init code to swap the mux tables before
the masks are computed.

No functional change intended.

Signed-off-by: Hugo VALTIER <hugo@ahdrone.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 849e72f1832c..549834501e7f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -4370,7 +4370,18 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 
 			bank_pins += 8;
 		}
+	}
+
+	return ctrl;
+}
+
+static void iomux_recalced_routes_init(struct rockchip_pinctrl *info)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct rockchip_pin_bank *bank = ctrl->pin_banks;
+	int i, j;
 
+	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		/* calculate the per-bank recalced_mask */
 		for (j = 0; j < ctrl->niomux_recalced; j++) {
 			int pin = 0;
@@ -4391,8 +4402,6 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 			}
 		}
 	}
-
-	return ctrl;
 }
 
 #define RK3288_GRF_GPIO6C_IOMUX		0x64
@@ -4505,6 +4514,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	iomux_recalced_routes_init(info);
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
-- 
2.55.0

