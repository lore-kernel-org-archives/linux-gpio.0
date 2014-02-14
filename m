From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [RESEND 6/6] gpio: ich: Add support for Intel Avoton
Date: Fri, 14 Feb 2014 15:01:58 +0100
Message-ID: <1392386518-11025-7-git-send-email-vdonnefort@gmail.com>
References: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:48961 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbaBNOCI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 09:02:08 -0500
Received: by mail-wg0-f47.google.com with SMTP id k14so411293wgh.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2014 06:02:07 -0800 (PST)
In-Reply-To: <1392386518-11025-1-git-send-email-vdonnefort@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, asierra@xes-inc.com, lee.jones@linaro.org, Vincent Donnefort <vdonnefort@gmail.com>

This patch adds support for Atom C2000 series (Avoton and Rangeley). And has
the following options:
  - New addresses register.
  - Caching output levels (see Intel external design spec, table 48-29)
  - No hardware blink.

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>
---
 drivers/gpio/gpio-ich.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index bfef20f..e73c675 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -1,5 +1,5 @@
 /*
- * Intel ICH6-10, Series 5 and 6 GPIO driver
+ * Intel ICH6-10, Series 5 and 6, Atom C2000 (Avoton/Rangeley) GPIO driver
  *
  * Copyright (C) 2010 Extreme Engineering Solutions.
  *
@@ -55,6 +55,16 @@ static const u8 ichx_reglen[3] = {
 	0x30, 0x10, 0x10,
 };
 
+static const u8 avoton_regs[4][3] = {
+	{0x00, 0x80, 0x00},
+	{0x04, 0x84, 0x00},
+	{0x08, 0x88, 0x00},
+};
+
+static const u8 avoton_reglen[3] = {
+	0x10, 0x10, 0x00,
+};
+
 #define ICHX_WRITE(val, reg, base_res)	outl(val, (reg) + (base_res)->start)
 #define ICHX_READ(reg, base_res)	inl((reg) + (base_res)->start)
 
@@ -353,6 +363,17 @@ static struct ichx_desc intel5_desc = {
 	.reglen = ichx_reglen,
 };
 
+/* Avoton */
+static struct ichx_desc avoton_desc = {
+	/* Avoton has only 59 GPIOs, but we assume the first set of register
+	 * (Core) has 32 instead of 31 to keep gpio-ich compliance
+	 */
+	.ngpio = 60,
+	.regs = avoton_regs,
+	.reglen = avoton_reglen,
+	.use_outlvl_cache = true,
+};
+
 static int ichx_gpio_request_regions(struct resource *res_base,
 						const char *name, u8 use_gpio)
 {
@@ -427,6 +448,9 @@ static int ichx_gpio_probe(struct platform_device *pdev)
 	case ICH_V10CONS_GPIO:
 		ichx_priv.desc = &ich10_cons_desc;
 		break;
+	case AVOTON_GPIO:
+		ichx_priv.desc = &avoton_desc;
+		break;
 	default:
 		return -ENODEV;
 	}
-- 
1.8.3.2

