From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 2/3] pinctrl: lantiq: set the OD bit when the pin it an output
Date: Mon,  4 Jan 2016 22:27:58 +0100
Message-ID: <1451942879-43265-2-git-send-email-blogic@openwrt.org>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:42093 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751913AbcADV2W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 Jan 2016 16:28:22 -0500
In-Reply-To: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/pinctrl/pinctrl-xway.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index cac1fde..434567b 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -676,6 +676,10 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->dev);
 
+	if (PORT(pin) == PORT3)
+		gpio_setbit(info->membase[0], GPIO3_OD, PORT_PIN(pin));
+	else
+		gpio_setbit(info->membase[0], GPIO_OD(pin), PORT_PIN(pin));
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
 	xway_gpio_set(chip, pin, val);
 
-- 
1.7.10.4
