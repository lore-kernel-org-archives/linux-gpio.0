From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCHv2 3/6] pinctrl: sh-pfc: r8a7795: Simplify get bias logic
Date: Fri, 11 Nov 2016 21:30:18 +0100
Message-ID: <20161111203021.3384-4-niklas.soderlund@ragnatech.se>
References: <20161111203021.3384-1-niklas.soderlund@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:58538 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934975AbcKKUb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2016 15:31:26 -0500
In-Reply-To: <20161111203021.3384-1-niklas.soderlund@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The last else statement is missing braces and there indentation level
can be reduced.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 2e8cc2a..6c58563 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -5367,13 +5367,12 @@ static unsigned int r8a7795_pinmux_get_bias(struct sh_pfc *pfc,
 	reg = pullups[pin].reg;
 	bit = BIT(pullups[pin].bit);
 
-	if (sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit) {
-		if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
-			return PIN_CONFIG_BIAS_PULL_UP;
-		else
-			return PIN_CONFIG_BIAS_PULL_DOWN;
-	} else
+	if (!(sh_pfc_read_reg(pfc, PUEN + reg, 32) & bit))
 		return PIN_CONFIG_BIAS_DISABLE;
+	else if (sh_pfc_read_reg(pfc, PUD + reg, 32) & bit)
+		return PIN_CONFIG_BIAS_PULL_UP;
+	else
+		return PIN_CONFIG_BIAS_PULL_DOWN;
 }
 
 static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-- 
2.10.2

