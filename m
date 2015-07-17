From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 3/9] gpio: Allow hogged gpios to be requested
Date: Fri, 17 Jul 2015 11:32:44 +0200
Message-ID: <1437125570-28623-4-git-send-email-mpa@pengutronix.de>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37008 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757379AbbGQJdl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 05:33:41 -0400
In-Reply-To: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

It can be useful to claim hogged gpios later, for example from
userspace. This allows to set defaults for GPIOs using the hogging
mechanism and override the setup later from userspace or a kernel driver.

This patch adds a check for hogged gpios to allow requesting them. If
the gpio is not hogged but marked as requested, it still fails with
-EBUSY.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d120c3..9f402b159cbe 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -798,7 +798,8 @@ static int __gpiod_request(struct gpio_desc *desc, const char *label)
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
 
-	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0) {
+	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0 ||
+	    test_and_clear_bit(FLAG_IS_HOGGED, &desc->flags) == 1) {
 		desc_set_label(desc, label ? : "?");
 		status = 0;
 	} else {
-- 
2.1.4

