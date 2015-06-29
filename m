From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] gpiolib: Fix docs for gpiochip_add_pingroup_range
Date: Mon, 29 Jun 2015 16:56:46 +0200
Message-ID: <1435589806-31079-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34151 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753064AbbF2O6J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2015 10:58:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

gpiochip_add_pingroup_range() has a pctldev argument, not pinctrl.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bf4bd1d..b1b08b3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -671,7 +671,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
 /**
  * gpiochip_add_pingroup_range() - add a range for GPIO <-> pin mapping
  * @chip: the gpiochip to add the range for
- * @pinctrl: the dev_name() of the pin controller to map to
+ * @pctldev: the pin controller to map to
  * @gpio_offset: the start offset in the current gpio_chip number space
  * @pin_group: name of the pin group inside the pin controller
  */
-- 
2.4.1

