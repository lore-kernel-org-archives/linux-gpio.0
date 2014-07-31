From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] gpiolib: Don't allow drivers to specify a base with DT
Date: Thu, 31 Jul 2014 13:07:48 +0100
Message-ID: <1406808468-12559-1-git-send-email-broonie@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37429 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbaGaMIA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Jul 2014 08:08:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

DT based systems should have no reason to use fixed GPIO numbers but some
drivers that work on both DT and non-DT platforms specify them anyway. In
order to improve robustness in cases where drivers use gpio_is_valid() to
check for a valid GPIO on data initialized to zero as a default and avoid
bugs due to assuptions about fixed numbers creeping in ignore any specified
base when DT is in use.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 768f0831db18..11d3cf1cbca7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -234,7 +234,7 @@ int gpiochip_add(struct gpio_chip *chip)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	if (base < 0) {
+	if (base < 0 || of_have_populated_dt()) {
 		base = gpiochip_find_base(chip->ngpio);
 		if (base < 0) {
 			status = base;
-- 
2.0.1

