From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 2/2] pinctrl: lpc18xx: add support for usb1 pinconf
Date: Wed, 15 Jul 2015 00:25:27 +0200
Message-ID: <1436912727-11559-3-git-send-email-manabian@gmail.com>
References: <1436912727-11559-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f67.google.com ([209.85.215.67]:33588 "EHLO
	mail-la0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751563AbbGNWZn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 18:25:43 -0400
Received: by lahh5 with SMTP id h5so1017852lah.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 15:25:42 -0700 (PDT)
In-Reply-To: <1436912727-11559-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

The dedicated USB1 pins can be configured with pull-down and
for low power mode (suspend). Add support for this in the
pinctrl driver.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/pinctrl/pinctrl-lpc18xx.c | 54 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 347c763a6a78..f0bebbe0682b 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -37,6 +37,9 @@
 #define LPC18XX_SCU_PIN_EHD_MASK	0x300
 #define LPC18XX_SCU_PIN_EHD_POS		8
 
+#define LPC18XX_SCU_USB1_EPD		BIT(2)
+#define LPC18XX_SCU_USB1_EPWR		BIT(4)
+
 #define LPC18XX_SCU_I2C0_EFP		BIT(0)
 #define LPC18XX_SCU_I2C0_EHD		BIT(2)
 #define LPC18XX_SCU_I2C0_EZI		BIT(3)
@@ -617,8 +620,31 @@ static const struct pinctrl_pin_desc lpc18xx_pins[] = {
 
 static int lpc18xx_pconf_get_usb1(enum pin_config_param param, int *arg, u32 reg)
 {
-	/* TODO */
-	return -ENOTSUPP;
+	switch (param) {
+	case PIN_CONFIG_LOW_POWER_MODE:
+		if (reg & LPC18XX_SCU_USB1_EPWR)
+			*arg = 0;
+		else
+			*arg = 1;
+		break;
+
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (reg & LPC18XX_SCU_USB1_EPD)
+			return -EINVAL;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (reg & LPC18XX_SCU_USB1_EPD)
+			*arg = 1;
+		else
+			return -EINVAL;
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
 }
 
 static int lpc18xx_pconf_get_i2c0(enum pin_config_param param, int *arg, u32 reg,
@@ -782,8 +808,28 @@ static int lpc18xx_pconf_set_usb1(struct pinctrl_dev *pctldev,
 				  enum pin_config_param param,
 				  u16 param_val, u32 *reg)
 {
-	/* TODO */
-	return -ENOTSUPP;
+	switch (param) {
+	case PIN_CONFIG_LOW_POWER_MODE:
+		if (param_val)
+			*reg &= ~LPC18XX_SCU_USB1_EPWR;
+		else
+			*reg |= LPC18XX_SCU_USB1_EPWR;
+		break;
+
+	case PIN_CONFIG_BIAS_DISABLE:
+		*reg &= ~LPC18XX_SCU_USB1_EPD;
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		*reg |= LPC18XX_SCU_USB1_EPD;
+		break;
+
+	default:
+		dev_err(pctldev->dev, "Property not supported\n");
+		return -ENOTSUPP;
+	}
+
+	return 0;
 }
 
 static int lpc18xx_pconf_set_i2c0(struct pinctrl_dev *pctldev,
-- 
1.8.0

