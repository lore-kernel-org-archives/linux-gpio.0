From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 04/14] pinctrl-sx150x: Fix incorrect constant in sx150x_init_hw
Date: Tue,  1 Nov 2016 08:57:38 -0700
Message-ID: <1478015868-10309-5-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36357 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbcKAP6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 11:58:08 -0400
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>

According to the datasheet for SX1504/5/6, RegAdvanced's
"Autoclear NINT" bit that turns the feature when set and disables it
when cleared, so writing 0x04 to the register will have the opposite
from desirable effect.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index f4481fb..a38c8fc 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -932,7 +932,7 @@ static int sx150x_init_hw(struct sx150x_pinctrl *pctl)
 	else if (pctl->data->model == SX150X_456)
 		err = sx150x_i2c_write(pctl->client,
 				pctl->data->pri.x456.reg_advance,
-				0x04);
+				0x00);
 	else
 		err = sx150x_i2c_write(pctl->client,
 				pctl->data->pri.x123.reg_advance,
-- 
2.5.5

