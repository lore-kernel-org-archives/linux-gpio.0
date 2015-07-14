From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 1/2] pinctrl: lpc18xx: fix schmitt trigger setup
Date: Wed, 15 Jul 2015 00:25:26 +0200
Message-ID: <1436912727-11559-2-git-send-email-manabian@gmail.com>
References: <1436912727-11559-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f193.google.com ([209.85.217.193]:33739 "EHLO
	mail-lb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746AbbGNWZn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 18:25:43 -0400
Received: by lbbnr7 with SMTP id nr7so1043647lbb.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 15:25:41 -0700 (PDT)
In-Reply-To: <1436912727-11559-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

The param_val variable is what determines if schmitt
trigger is enabled on a pin or not. A typo here mean
that schmitt trigger was always enabled for standard
and i2c pins.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/pinctrl/pinctrl-lpc18xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index ef0b697639a7..347c763a6a78 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -823,7 +823,7 @@ static int lpc18xx_pconf_set_i2c0(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		if (param)
+		if (param_val)
 			*reg &= ~(LPC18XX_SCU_I2C0_ZIF << shift);
 		else
 			*reg |= (LPC18XX_SCU_I2C0_ZIF << shift);
@@ -876,7 +876,7 @@ static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		if (param)
+		if (param_val)
 			*reg &= ~LPC18XX_SCU_PIN_ZIF;
 		else
 			*reg |= LPC18XX_SCU_PIN_ZIF;
-- 
1.8.0

