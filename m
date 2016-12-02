From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 3/3] pinctrl: sx150x: handle missing 'advanced' reg in sx1504 and sx1505
Date: Fri,  2 Dec 2016 11:51:16 +0100
Message-ID: <1480675876-19540-4-git-send-email-peda@axentia.se>
References: <1480675876-19540-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0105.outbound.protection.outlook.com ([104.47.2.105]:32288
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755637AbcLBMZN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Dec 2016 07:25:13 -0500
In-Reply-To: <1480675876-19540-1-git-send-email-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes a problem where sx150x_regmap_reg_width() returns 8 for the
data register (reg 0) for sx1504 where it should return 4, and return
a correct 8 for sx1505 but for the wrong reason (both chips lack the
'advanced' register). This is not a real problem, since nothing depends
on the function returning 4 or 8, and certainly not if it is returning
8 for the wrong reason. But fix this to avoid nasty surprises down the
line.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/pinctrl/pinctrl-sx150x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 37b8737e61a9..bdb7ea3d9911 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -967,6 +967,7 @@ static int sx150x_regmap_reg_width(struct sx150x_pinctrl *pctl,
 		    reg == data->pri.x123.reg_advanced)
 		   ||
 		   (data->model == SX150X_456 &&
+		    data->pri.x456.reg_advanced &&
 		    reg == data->pri.x456.reg_advanced)) {
 		return 8;
 	} else {
-- 
2.1.4

