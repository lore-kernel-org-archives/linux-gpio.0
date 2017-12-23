From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: at91: Delete an error message for a failed memory
 allocation in at91_pinctrl_mux_mask()
Date: Sat, 23 Dec 2017 20:55:15 +0100
Message-ID: <b5da388b-7fa2-ad77-7b64-26eadd55b41c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:58664 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750802AbdLWTzt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 Dec 2017 14:55:49 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2017 20:44:27 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-at91.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 03492e3c09fa..297f1d161211 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1050,10 +1050,8 @@ static int at91_pinctrl_mux_mask(struct at91_pinctrl *info,
 	info->nmux = size / gpio_banks;
 
 	info->mux_mask = devm_kzalloc(info->dev, sizeof(u32) * size, GFP_KERNEL);
-	if (!info->mux_mask) {
-		dev_err(info->dev, "could not alloc mux_mask\n");
+	if (!info->mux_mask)
 		return -ENOMEM;
-	}
 
 	ret = of_property_read_u32_array(np, "atmel,mux-mask",
 					  info->mux_mask, size);
-- 
2.15.1

