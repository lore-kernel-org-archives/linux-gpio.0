From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/3] gpio: brcmstb: Set endian flags for big-endian MIPS
Date: Wed,  6 Jan 2016 10:55:22 -0800
Message-ID: <1452106523-11556-3-git-send-email-f.fainelli@gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:34980 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863AbcAFS4N (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2016 13:56:13 -0500
Received: by mail-pf0-f173.google.com with SMTP id 78so246505767pfw.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2016 10:56:13 -0800 (PST)
In-Reply-To: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-mips@linux-mips.org, gregory.0xf0@gmail.com, jaedon.shin@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>

Broadcom MIPS-based STB chips endianness is configured by boot strap,
which also reverses all bus endianness (i.e., big-endian CPU + big
endian bus ==> native endian I/O).

Other architectures (e.g., ARM) either do not support big endian, or
else leave I/O in little endian mode.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 3618b9fd0cba..8e8ddc76a56f 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -409,6 +409,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 	int num_banks = 0;
 	int err;
 	static int gpio_base;
+	unsigned long flags = 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -438,6 +439,18 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 	if (brcmstb_gpio_sanity_check_banks(dev, np, res))
 		return -EINVAL;
 
+	/*
+	 * MIPS endianness is configured by boot strap, which also reverses all
+	 * bus endianness (i.e., big-endian CPU + big endian bus ==> native
+	 * endian I/O).
+	 *
+	 * Other architectures (e.g., ARM) either do not support big endian, or
+	 * else leave I/O in little endian mode.
+	 */
+#if defined(CONFIG_MIPS) && defined(__BIG_ENDIAN)
+	flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+#endif
+
 	of_property_for_each_u32(np, "brcm,gpio-bank-widths", prop, p,
 			bank_width) {
 		struct brcmstb_gpio_bank *bank;
@@ -466,7 +479,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		err = bgpio_init(gc, dev, 4,
 				reg_base + GIO_DATA(bank->id),
 				NULL, NULL, NULL,
-				reg_base + GIO_IODIR(bank->id), 0);
+				reg_base + GIO_IODIR(bank->id), flags);
 		if (err) {
 			dev_err(dev, "bgpio_init() failed\n");
 			goto fail;
-- 
2.1.0

