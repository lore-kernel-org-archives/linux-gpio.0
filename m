From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] gpiolib: Downgrade set_debounce() missing operation warning
Date: Fri,  6 Sep 2013 13:38:46 +0100
Message-ID: <1378471128-3330-1-git-send-email-broonie@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36572 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab3IFMjS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2013 08:39:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

It is reasonable for a driver using a GPIO to call set_debounce() on GPIOs
that don't provide this support in hardware since the driver can fall back
on a software debounce implementation or otherwise not depend on success
so downgrade the log message for this to a debug one.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b762718..374cf9e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1779,8 +1779,8 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 
 	chip = desc->chip;
 	if (!chip->set || !chip->set_debounce) {
-		pr_warn("%s: missing set() or set_debounce() operations\n",
-			__func__);
+		pr_debug("%s: missing set() or set_debounce() operations\n",
+			 __func__);
 		return -EIO;
 	}
 
-- 
1.8.4.rc3

