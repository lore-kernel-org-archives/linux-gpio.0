From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 1/2] pinctrl: at91: Make at91_gpio_template const
Date: Fri, 29 Apr 2016 14:50:02 +0200
Message-ID: <1461934203-3206-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:56251 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752599AbcD2Mui (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Apr 2016 08:50:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexanders83@web.de>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

This template is only assigned, so make it const.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/pinctrl/pinctrl-at91.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 523b6b794d1f..29d57118e35c 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1660,7 +1660,7 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
 }
 
 /* This structure is replicated for each GPIO block allocated at probe time */
-static struct gpio_chip at91_gpio_template = {
+static const struct gpio_chip at91_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= at91_gpio_get_direction,
-- 
2.8.1

