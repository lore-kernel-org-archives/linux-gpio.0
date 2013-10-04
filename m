From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/2] gpiolib: safer implementation of desc_to_gpio()
Date: Fri, 4 Oct 2013 10:59:57 -0700
Message-ID: <1380909598-6382-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16640 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983Ab3JDSAN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2013 14:00:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

The current implementation of desc_to_gpio() relies on the chip pointer
to be set to a valid value in order to compute the GPIO number. This
was done in the hope that we can get rid of the gpio_desc global array,
but this is not happening anytime soon.

This patch reimplements desc_to_gpio() in a fashion similar to that of
gpio_to_desc(). As a result, desc_to_gpio(gpio_to_desc(gpio)) == gpio is
now always true. This allows to call desc_to_gpio() on non-initialized
descriptors as some error-handling code currently does.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reported-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86ef346..f330631 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -136,7 +136,7 @@ static struct gpio_desc *gpio_to_desc(unsigned gpio)
  */
 static int desc_to_gpio(const struct gpio_desc *desc)
 {
-	return desc->chip->base + gpio_chip_hwgpio(desc);
+	return desc - &gpio_desc[0];
 }
 
 
-- 
1.8.4

