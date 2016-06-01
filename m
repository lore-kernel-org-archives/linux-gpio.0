From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] pinctrl: imx: Do not treat a PIN without MUX register as an error
Date: Wed,  1 Jun 2016 22:21:53 +0300
Message-ID: <1464808913-7796-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback7.mail.ru ([94.100.181.128]:48017 "EHLO
	fallback7.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249AbcFATfj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 15:35:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Adrian Alonso <aalonso@freescale.com>, Philipp Zabel <p.zabel@pengutronix.de>, Alexander Shiyan <shc_work@mail.ru>

Some PINs do not have a MUX register, it is not an error.
It is necessary to allow the continuation of the PINs configuration,
otherwise the whole PIN-group will be configured incorrectly.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 47ccfcc..eccb474 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -209,9 +209,9 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 		pin_reg = &info->pin_regs[pin_id];
 
 		if (pin_reg->mux_reg == -1) {
-			dev_err(ipctl->dev, "Pin(%s) does not support mux function\n",
+			dev_dbg(ipctl->dev, "Pin(%s) does not support mux function\n",
 				info->pins[pin_id].name);
-			return -EINVAL;
+			continue;
 		}
 
 		if (info->flags & SHARE_MUX_CONF_REG) {
-- 
2.4.9

