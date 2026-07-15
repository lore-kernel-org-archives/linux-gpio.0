Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7374921BB
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134579; cv=none; b=hMu4AKud+eiXcm18Qcq0CYLbpnKUgu33SkeSPxY02s8Z+rE4xA48lY51Y07YBsb0EBA0Y+5h1lCY5gacppHkjLHHc+1/x9GtKDooxiS8brSd/OyTVFem70SwVzObdilSyQsoFjvy459pJUSjlCB7ruQLmdjFtkYjOYpiEDYssPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134579; c=relaxed/simple;
	bh=MT+WN3BueXD7E8vjnP0RYZS2dRpHMSwb9Tg95v2dLYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K37aNF0Q8d8hcT620jb7Ijp88CADXYIIHRSPtNtP0/CHm2dc7MPPiBuj73vc1wkmUAsvII7FdMVTS0lLylEq8cxf768KUVaDUtYGr+D5KEyVUAC4aDcAtE/Y3rn+sIP7touDYONnOzrQXwuZfeJQeb/D24D4iAn9XpavygyEz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=C8DBYZCi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="C8DBYZCi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-472326ca506so4683858f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134575; x=1784739375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JTEYNC1fa1XezRfD5mnBqmO5tNk9d1OUfN/oDnl/6w=;
        b=C8DBYZCi7l3GwCWdJncTwLyRirYVh5t1hA4YpL4dgGZWmsSJZjp+N8h3G7mxdShkR2
         /q2pin14y9gLjCUTZg0ypnF6Kxnp888uEQioSBGcqb874nQ55ayXI7gLftsAWSn2NqiJ
         /cswpTHuGfrM4Zd0NQyihDDwzl/uqfRMHpFAA06wAWgseokSDmIb6/AxVv0yoLuK73Oh
         vUIiYMAYiyL2xdD49Xz1atcN26uth/cHL7K/viotZB8Qwxw2FDEexjuZQD2NAdI1bf0y
         +Fi03XQduOgqbiYLPcbkk6bpnVjswEbBynmRqJN3f2hKG7mrIVvQTuHKgBjCqq+iKJx2
         esQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134575; x=1784739375;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JTEYNC1fa1XezRfD5mnBqmO5tNk9d1OUfN/oDnl/6w=;
        b=ba889OEzV7d8JJoG1crhis2dzUrtho3IZ6KJpLHcC119Rm6bLo7/rHwgzTYGTyYs0m
         XioJ23KwQGXBHCxKcZuAxja6o4R4QtyLtd7UTl21QHD48JrSIROiMm7Jk3iS/rJ/OMZB
         CeqJt5HZAaN04LDN7Cx74aRpMijM1u/tSF3fnI8JT/8sSHiCb44mNGRxBAyb/vhWcLOh
         7fROsZd456bLB3QW7wV1fDCRikkv3I+dCk+pJQp4cEZsoWaSG5zbTLDRSOCQUy8olpfF
         7Dh71AYXCYkg0Nimvli79bfNPAOEOy4m7eLE8zCUzpRb3UQwPcdYoLWWZvYSY+nnMuuz
         vqFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRiYxKPy1NeN/+0/hwwAQcbxOpiP0TdVcR5jQ/vzIeKJ8OTVGKCvNTZ6ukusP+wtcz73krEVLAivls@vger.kernel.org
X-Gm-Message-State: AOJu0YzMWJKjkSIiKL1MaA4Q5t8Pq61Ifcx9J9z/AiiaqPrZG7uwyUpx
	9KrzR7FEQ9+wZ5FQHVfqt8qJcF3xCD2ENfaOXBiXvnIGH13v4PTzk6rLxF4n77rYdHQ=
X-Gm-Gg: AfdE7cmy6uxQ//06pYNyUQAQHH9j4Um6vO0b8H+c9kV9JGWqG7MavL4gWnjThk/1f7b
	6ADbWs56lm3hWfjTqIHg0vzvaCRPQHszjPos6S/2VDfXRKOsXA2GxykBs6AG3lPWiuYkCT57//5
	dcWjK2vs7xb9Fe1LGSclDY1vCARtrDxhkYPQDBLUpgxG1AveX80omcQeezAIaOyNMR4SvXnb2gT
	aZSNNCHBeK+QCPm3zbS0J4OKC7h1wFOS241sAtmvrQKVFdWLx4FPbc1VhDbS/U33STm7nixT2do
	QnTtmS+s0qgoOJ/novEQaIFbLtYm5lQ0mc6+cqMSCCALOvnnlfQM/0uGmJuOxj659ekZVFPFr/g
	pS2TICtbVvciowWfpXh3emdBKJgB0jT44Z2QyaHvMoMuwlyUcSP9+Nya2OENvVQAMMCHfQL519e
	9/Lro1kKoMi2toAHB9NERLntRh1Otp561PwOXLZunyglwN80O1xfh8XAKGnqzjgxE5szsMHDPW/
	s37t1g1LqQyXA==
X-Received: by 2002:a05:600c:4f0d:b0:493:e4cd:def1 with SMTP id 5b1f17b1804b1-495158d11f7mr114527645e9.11.1784134574947;
        Wed, 15 Jul 2026 09:56:14 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495087384casm165038555e9.8.2026.07.15.09.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 09/21] gpio: Add missing OF module annotations
Date: Wed, 15 Jul 2026 18:55:14 +0200
Message-ID:  <21ef7b7e2247a1b67bc895f8846e8e5beee1d8f1.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8010; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=MT+WN3BueXD7E8vjnP0RYZS2dRpHMSwb9Tg95v2dLYs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7t/4Ou5/45Ec0egDT+7aKG3n5F8nh5R4/ebo Sd2QnctT+aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7fwAKCRCPgPtYfRL+ TlnnCACx/KQvEwp4BDf1qfCXkUSmhKdQcXMTzFlosLNzTOMeBpbVLu6NrSyMlnUbrQmBT1al4RA 8JGc4GBASetir+U1ms6/CIpMhOwQIZyuz4lzo7JszCRV2t5g3GToeULMojR+YrAjznBExb6CVtM YRQTg4s/wVueQYHvDEPMQGWdw3uGy3/UoP7zRhnaEYEPW2DfW8NRfmJ0JLHVq0X3IYcQZ+8E8Ng 9oTaT9MMTtdsVP4FoBIiEDg4tc39lJA3dfuCN773kprzU6KaK+szLwzBubZuTF+tXLkGP1EkZKK q5IXs4n6tGUeUtxL4xRJbS6OxSorTRgIVwJOR+dFzFtfvGsx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an of device id table is supposed
to declare that in the module's metadata. Add this information for
several drivers that failed to declare these.

Acked-by: Daniel Palmer <daniel@thingy.jp>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bcm-kona.c    | 1 +
 drivers/gpio/gpio-creg-snps.c   | 1 +
 drivers/gpio/gpio-ep93xx.c      | 1 +
 drivers/gpio/gpio-ftgpio010.c   | 1 +
 drivers/gpio/gpio-imx-scu.c     | 1 +
 drivers/gpio/gpio-ixp4xx.c      | 2 +-
 drivers/gpio/gpio-mpc5200.c     | 1 +
 drivers/gpio/gpio-mpc8xxx.c     | 1 +
 drivers/gpio/gpio-mpfs.c        | 1 +
 drivers/gpio/gpio-msc313.c      | 1 +
 drivers/gpio/gpio-mvebu.c       | 1 +
 drivers/gpio/gpio-nomadik.c     | 1 +
 drivers/gpio/gpio-pxa.c         | 1 +
 drivers/gpio/gpio-spear-spics.c | 1 +
 drivers/gpio/gpio-xgene.c       | 1 +
 drivers/gpio/gpio-zevio.c       | 1 +
 16 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b0beffe48b7d..9bcbee25f685 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -522,6 +522,7 @@ static struct of_device_id const bcm_kona_gpio_of_match[] = {
 	{ .compatible = "brcm,kona-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
 
 /*
  * This lock class tells lockdep that GPIO irqs are in a different
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 157ab90f5ba8..2e159ea41791 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -131,6 +131,7 @@ static const struct of_device_id creg_gpio_ids[] = {
 		.data = &hsdk_cs_ctl
 	}, { /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, creg_gpio_ids);
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8784e433e1ff..278b1093dd22 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -377,6 +377,7 @@ static const struct of_device_id ep93xx_gpio_match[] = {
 	{ .compatible = "cirrus,ep9301-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, ep93xx_gpio_match);
 
 static struct platform_driver ep93xx_gpio_driver = {
 	.driver		= {
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 11e6907c3b54..e29df8d5e571 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -323,6 +323,7 @@ static const struct of_device_id ftgpio_gpio_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, ftgpio_gpio_of_match);
 
 static struct platform_driver ftgpio_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 0a75afecf9f8..3ebd3d73ed58 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -114,6 +114,7 @@ static const struct of_device_id imx_scu_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-sc-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx_scu_gpio_dt_ids);
 
 static struct platform_driver imx_scu_gpio_driver = {
 	.driver	= {
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 669b139cd499..88d48cfc9017 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -341,7 +341,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
 	},
 	{},
 };
-
+MODULE_DEVICE_TABLE(of, ixp4xx_gpio_of_match);
 
 static struct platform_driver ixp4xx_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 00f209157fd0..2c828bc922ae 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
 	{ .compatible = "fsl,mpc5200-gpio-wkup", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
 
 static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6868f673831..ee35da06cbc7 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -318,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc8xxx_gpio_ids);
 
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 7f0751d7b1c4..1078b3018970 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -295,6 +295,7 @@ static const struct of_device_id mpfs_gpio_of_ids[] = {
 	},
 	{ /* end of list */ }
 };
+MODULE_DEVICE_TABLE(of, mpfs_gpio_of_ids);
 
 static struct platform_driver mpfs_gpio_driver = {
 	.probe = mpfs_gpio_probe,
diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..38932986dc36 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -688,6 +688,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
 #endif
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msc313_gpio_of_match);
 
 /*
  * The GPIO controller loses the state of the registers when the
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 8d3acadb0d68..4d1625be11ec 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -978,6 +978,7 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 		/* sentinel */
 	},
 };
+MODULE_DEVICE_TABLE(of, mvebu_gpio_of_match);
 
 static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 {
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 208fed631975..90293329b40b 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -719,6 +719,7 @@ static const struct of_device_id nmk_gpio_match[] = {
 	{ .compatible = "mobileye,eyeq5-gpio", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, nmk_gpio_match);
 
 static struct platform_driver nmk_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 5d61053e0596..317e3bc925eb 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -583,6 +583,7 @@ static const struct of_device_id pxa_gpio_dt_ids[] = {
 	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
 	{}
 };
+MODULE_DEVICE_TABLE(of, pxa_gpio_dt_ids);
 
 static int pxa_gpio_probe_dt(struct platform_device *pdev,
 			     struct pxa_gpio_chip *pchip)
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 96a0e1211500..3099deb2b290 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -157,6 +157,7 @@ static const struct of_device_id spics_gpio_of_match[] = {
 	{ .compatible = "st,spear-spics-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
 
 static struct platform_driver spics_gpio_driver = {
 	.probe = spics_gpio_probe,
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index ad0f1551c271..b34b0c58b67c 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -191,6 +191,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 	{ .compatible = "apm,xgene-gpio", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 288a86c8294a..f1c5c6a20673 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -213,6 +213,7 @@ static const struct of_device_id zevio_gpio_of_match[] = {
 	{ .compatible = "lsi,zevio-gpio", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
 
 static struct platform_driver zevio_gpio_driver = {
 	.driver		= {
-- 
2.55.0.11.g153666a7d9bb

