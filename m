From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH 3/6] gpio: ich: Add blink capability option
Date: Fri,  7 Feb 2014 14:21:04 +0100
Message-ID: <1391779267-27084-3-git-send-email-vdonnefort@lacie.com>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:49653 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932142AbaBGNVg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2014 08:21:36 -0500
Received: by mail-we0-f172.google.com with SMTP id p61so2328191wes.17
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2014 05:21:35 -0800 (PST)
In-Reply-To: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sameo@linux.intel.com, Vincent Donnefort <vdonnefort@gmail.com>

From: Vincent Donnefort <vdonnefort@gmail.com>

This patch allows gpio_ich driver to be aware of non blink capable chipsets.

Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index f5bf3c3..82887c5 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -62,6 +62,9 @@ struct ichx_desc {
 	/* Max GPIO pins the chipset can have */
 	uint ngpio;
 
+	/* GPO_BLINK is available on this chipset */
+	bool have_blink;
+
 	/* Whether the chipset has GPIO in GPE0_STS in the PM IO region */
 	bool uses_gpe0;
 
@@ -151,7 +154,7 @@ static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 					int val)
 {
 	/* Disable blink hardware which is available for GPIOs from 0 to 31. */
-	if (nr < 32)
+	if (nr < 32 && ichx_priv.desc->have_blink)
 		ichx_write_bit(GPO_BLINK, nr, 0, 0);
 
 	/* Set GPIO output value. */
@@ -266,6 +269,7 @@ static struct ichx_desc ich6_desc = {
 	.uses_gpe0 = true,
 
 	.ngpio = 50,
+	.have_blink = true,
 };
 
 /* Intel 3100 */
@@ -290,19 +294,23 @@ static struct ichx_desc i3100_desc = {
 /* ICH7 and ICH8-based */
 static struct ichx_desc ich7_desc = {
 	.ngpio = 50,
+	.have_blink = true,
 };
 
 /* ICH9-based */
 static struct ichx_desc ich9_desc = {
 	.ngpio = 61,
+	.have_blink = true,
 };
 
 /* ICH10-based - Consumer/corporate versions have different amount of GPIO */
 static struct ichx_desc ich10_cons_desc = {
 	.ngpio = 61,
+	.have_blink = true,
 };
 static struct ichx_desc ich10_corp_desc = {
 	.ngpio = 72,
+	.have_blink = true,
 };
 
 /* Intel 5 series, 6 series, 3400 series, and C200 series */
-- 
1.8.3.2

