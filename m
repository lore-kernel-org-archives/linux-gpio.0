Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C0C3515E1
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796547; cv=none; b=uMYw50x3z0UF2P5/dMqmIr7dIS7Z+KhIafGLOLVIWNXZa4qUNWmlMgxUJaaZn/X+PmTsUPS8F+/f8P6sIy6RNjyvjFy9ftOm/dcBaiCtA7a5XQ3jzWR6y9z0bkLsQCzxX2CI8p7nZjxAcsKFWt/zPiH+dzgxpVOyLVrLz2zgInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796547; c=relaxed/simple;
	bh=/s8yVFA6o9FF+yXVWgHza8ewiGV48nsE9lOWYYv/G74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cgz6nT4TsaIpIsaSBhI668ewfm48J6jyXY205juOJfY8jq8QEdhMsn4P+NSV0IA4OqDMCqrvKjZEWpgrLqokfyypdNASgSCfQ1bE/oYAUnszdJwoM4PQuCDz9d/T5PVDCXlLVpW1btOWQtDb7BY293+SCAIgx4/cT/hW5wtHV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9UF2rbA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9UF2rbA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453427d3f4so4305060b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796545; x=1786401345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss+09hjpJaeSuKJ0JJOS5roXbCAiuY8R6iPoMwWLO6I=;
        b=D9UF2rbA307dNFXuGI4j1gkSg6eLxAt6080LcCs46DnsTTIEaUwmIxU03M4IDIJrJW
         jz+romNvG8VPUju5uvkU8cmOKxGesYPvh6MEBVB2SIOnOhwlafUV0/P33Tav/nJ+xZL3
         rv1Hfo3osz0nncOQht9pCY3msRpUXxhPaCCZOZZaL8yNQvUhfii9fSJTv/yVgNiibq+2
         azFlzmk0jT0xgU7Eauk7uv66G95Gn4CrRm6AFP/lunmWaLZN3LWyOUzqyLe2f+7yC0dD
         lwdb6nk/QZWL4lwgW/T7uDnpZV7wGlp1KurDU+20e0Zd15gxuDYrh9q3QNHlXV4aAwQo
         2baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796545; x=1786401345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ss+09hjpJaeSuKJ0JJOS5roXbCAiuY8R6iPoMwWLO6I=;
        b=nLw8bZYOcr1LeoVAGRLfoevOYykvgDWPPhnoR9mqlNzUJJI1ERhtltYz+EYdwjr46h
         kE6Lm5RgJCpVG43NqUt+woZZPQWTTCfMaNwkUQbzGbEOoNlfDysuhRbgmtEgDdh6c/6G
         DJ4M+rTVV7EgTot4Q5qbUN34XOUR0G67SmpCZjcrdALPthRzmSvUM51kBYXuxS9Yqsj+
         8XUCyszMt+Paz6Iw3FfYzgI3m2xNmhOjBcI11SJwRwKl+vz5+Gzpp5rZ6zikAxVtj2C6
         ah6GfREkWFNbM2/m/5/AcsZg0cK4elKOff1f5H52cfx6rQl9nmtdCrGqYxpsjyreiuWY
         1DOQ==
X-Gm-Message-State: AOJu0YxRNiTwZA4f9OnsGBqtBvPQlTuaHGg5M4m4DrRNGPUU7tyKzJSX
	RH3H5Jv5Gv7eNSPBapqciiscbl1qO7qM6JZCDeasjWI+KvC/yCM6nNCh76CTrg==
X-Gm-Gg: AR+sD12ig/Ci7QQW6nbuPo9xlfdpKeJcFAS6Vl7q65p8Gm+lLA/S+FExQTZTI24WasP
	2cd1YBZOQFgbpWZvMh8SszkcvijUULfFHMtXaOxRvLPVN16whjYPnMWrQthmllcx93A7axYMA/s
	iHmkCHfrE5RV3RVycB/NCO6TtlLfXg9NXl1Xs4Cc+7Xdzij3hcpKbhFSQGeplY46F0yN8WpoTVu
	SWSKBUjgxqp0ftN22YSz2+DCwERNO2Wy0QcXh9oYxdHNgDU+umK3REl0hhZKcVi57ipQWU3Btmd
	C6JAXdAamfzjxBMd4ksFXO8YEAiWjsttbl7T/c7akr8oFVkoalz/CjA6ww8gEjlmmDO3B4OWEQU
	9nMQsT+vq/tn000jSlX+qiDc9iz6RQSE55s8IUQmYDeaEdNRfmGcRcyd3/jIMKIYQ+6P6jme9pq
	1bP2QOXeiAHHCIFm8R9EWoh6DnHtgZ2o3svx7MC7onWxlM3F3Qu6F11DCmAchFwkJejRe2J7dpf
	I9RQ3W3+F57XdaUua32yNBPi/xBKS0tRaMhl/wuEvga0BsbU4+FDAPWqcrCORt9P7/L99QzzsQm
	xMmNfyD61AQDRi2PGKRM5j20GmA/O82uiiYijQ==
X-Received: by 2002:a05:6a00:3e2a:b0:848:42c4:d8c7 with SMTP id d2e1a72fcca58-84ee4969580mr10402690b3a.66.1785796545052;
        Mon, 03 Aug 2026 15:35:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/8] gpio: ppc44x: update all 4xx to 44x
Date: Mon,  3 Aug 2026 15:35:33 -0700
Message-ID: <20260803223539.86303-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel lost support for 4xx platforms and now only supports 44x.
Since this driver is being moved to drivers/gpio/ , take the opportunity
to modernize the name.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 68 +++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 4413a94cf7a6..9b874ff8b124 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * PPC4xx gpio driver
+ * PPC44x gpio driver
  *
  * Copyright (c) 2008 Harris Corporation
  * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
@@ -23,7 +23,7 @@
 #define GPIO_MASK2(gpio)	(0xc0000000 >> ((gpio) * 2))
 
 /* Physical GPIO register layout */
-struct ppc4xx_gpio {
+struct ppc44x_gpio {
 	__be32 or;
 	__be32 tcr;
 	__be32 osrl;
@@ -44,7 +44,7 @@ struct ppc4xx_gpio {
 	__be32 isr3h;
 };
 
-struct ppc4xx_gpio_chip {
+struct ppc44x_gpio_chip {
 	struct gpio_chip gc;
 	void __iomem *regs;
 	spinlock_t lock;
@@ -56,19 +56,19 @@ struct ppc4xx_gpio_chip {
  * There are a maximum of 32 gpios in each gpio controller.
  */
 
-static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+static int ppc44x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 
 	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
 }
 
 static inline void
-__ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+__ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 
 	if (val)
 		setbits32(&regs->or, GPIO_MASK(gpio));
@@ -76,14 +76,14 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->or, GPIO_MASK(gpio));
 }
 
-static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
 
-	__ppc4xx_gpio_set(gc, gpio, val);
+	__ppc44x_gpio_set(gc, gpio, val);
 
 	spin_unlock_irqrestore(&chip->lock, flags);
 
@@ -92,10 +92,10 @@ static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
+static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -121,16 +121,16 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 }
 
 static int
-ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
+ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = chip->regs;
+	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc44x_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
 
 	/* First set initial value */
-	__ppc4xx_gpio_set(gc, gpio, val);
+	__ppc44x_gpio_set(gc, gpio, val);
 
 	/* Disable open-drain function */
 	clrbits32(&regs->odr, GPIO_MASK(gpio));
@@ -154,11 +154,11 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int ppc4xx_gpio_probe(struct platform_device *ofdev)
+static int ppc44x_gpio_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
-	struct ppc4xx_gpio_chip *chip;
+	struct ppc44x_gpio_chip *chip;
 	struct gpio_chip *gc;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -172,10 +172,10 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	gc->parent = dev;
 	gc->base = -1;
 	gc->ngpio = 32;
-	gc->direction_input = ppc4xx_gpio_dir_in;
-	gc->direction_output = ppc4xx_gpio_dir_out;
-	gc->get = ppc4xx_gpio_get;
-	gc->set = ppc4xx_gpio_set;
+	gc->direction_input = ppc44x_gpio_dir_in;
+	gc->direction_output = ppc44x_gpio_dir_out;
+	gc->get = ppc44x_gpio_get;
+	gc->set = ppc44x_gpio_set;
 
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
 	if (!gc->label)
@@ -188,24 +188,24 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
-static const struct of_device_id ppc4xx_gpio_match[] = {
+static const struct of_device_id ppc44x_gpio_match[] = {
 	{
 		.compatible = "ibm,ppc4xx-gpio",
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(of, ppc4xx_gpio_match);
+MODULE_DEVICE_TABLE(of, ppc44x_gpio_match);
 
-static struct platform_driver ppc4xx_gpio_driver = {
-	.probe		= ppc4xx_gpio_probe,
+static struct platform_driver ppc44x_gpio_driver = {
+	.probe		= ppc44x_gpio_probe,
 	.driver		= {
-		.name	= "ppc4xx-gpio",
-		.of_match_table	= ppc4xx_gpio_match,
+		.name	= "ppc44x-gpio",
+		.of_match_table	= ppc44x_gpio_match,
 	},
 };
 
-static int __init ppc4xx_gpio_init(void)
+static int __init ppc44x_gpio_init(void)
 {
-	return platform_driver_register(&ppc4xx_gpio_driver);
+	return platform_driver_register(&ppc44x_gpio_driver);
 }
-arch_initcall(ppc4xx_gpio_init);
+arch_initcall(ppc44x_gpio_init);
-- 
2.55.0

