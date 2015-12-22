From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 08/54] gpio: lpc32xx: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:13:35 +0100
Message-ID: <1450793615-22239-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34019 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753609AbbLVONk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:13:40 -0500
Received: by mail-lb0-f174.google.com with SMTP id pv2so45811600lbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:13:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Roland Stigge <stigge@antcom.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Roland Stigge <stigge@antcom.de>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-lpc32xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 47e2dde63734..e888b5fcd236 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -288,21 +288,21 @@ static int lpc32xx_gpio_get_value_p012(struct gpio_chip *chip, unsigned pin)
 {
 	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
 
-	return __get_gpio_state_p012(group, pin);
+	return !!__get_gpio_state_p012(group, pin);
 }
 
 static int lpc32xx_gpio_get_value_p3(struct gpio_chip *chip, unsigned pin)
 {
 	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
 
-	return __get_gpio_state_p3(group, pin);
+	return !!__get_gpio_state_p3(group, pin);
 }
 
 static int lpc32xx_gpi_get_value(struct gpio_chip *chip, unsigned pin)
 {
 	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
 
-	return __get_gpi_state_p3(group, pin);
+	return !!__get_gpi_state_p3(group, pin);
 }
 
 static int lpc32xx_gpio_dir_output_p012(struct gpio_chip *chip, unsigned pin,
@@ -364,7 +364,7 @@ static int lpc32xx_gpo_get_value(struct gpio_chip *chip, unsigned pin)
 {
 	struct lpc32xx_gpio_chip *group = to_lpc32xx_gpio(chip);
 
-	return __get_gpo_state_p3(group, pin);
+	return !!__get_gpo_state_p3(group, pin);
 }
 
 static int lpc32xx_gpio_request(struct gpio_chip *chip, unsigned pin)
-- 
2.4.3

