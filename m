From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH] pinctrl: at91-pio4: fix pull-up/down logic
Date: Tue, 19 Apr 2016 16:03:45 +0200
Message-ID: <1461074628-20224-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:40866 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754040AbcDSODU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2016 10:03:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>

The default configuration of a pin is often with a value in the
pull-up/down field at chip reset. So, even if the internal logic of the
controller prevents writing a configuration with pull-up and pull-down at
the same time, we must ensure explicitly this condition before writing the
register.

This was leading to a pull-down condition not taken into account for
instance.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Fixes: 776180848b57 ("pinctrl: introduce driver for Atmel PIO4 controller")
Cc: stable@vger.kernel.org #v4.4 and later
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 629b6fe..75093d7 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -722,9 +722,11 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
 			conf |= ATMEL_PIO_PUEN_MASK;
+			conf &= (~ATMEL_PIO_PDEN_MASK);
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			conf |= ATMEL_PIO_PDEN_MASK;
+			conf &= (~ATMEL_PIO_PUEN_MASK);
 			break;
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 			if (arg == 0)
-- 
2.5.0

