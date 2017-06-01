From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] gpio: of: Spelling: s/retures/returns/
Date: Thu,  1 Jun 2017 12:30:01 +0200
Message-ID: <1496313001-27458-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:48574 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbdFAKaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2017 06:30:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <trivial@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e2abf0eabaf880b6..54ce8dc58ad009c7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -239,7 +239,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
  *
  * This is only used by of_gpiochip_add to request/set GPIO initial
  * configuration.
- * It retures error if it fails otherwise 0 on success.
+ * It returns error if it fails otherwise 0 on success.
  */
 static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 {
-- 
2.7.4

