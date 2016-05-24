From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nomadik: fix inversion of gpio direction
Date: Tue, 24 May 2016 14:41:10 +0200
Message-ID: <1464093670-29370-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36038 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752299AbcEXMlQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 08:41:16 -0400
Received: by mail-lf0-f43.google.com with SMTP id e130so5677572lfe.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 05:41:15 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

The input/output directions were inversed on the GPIO direction
read function. Loose a ! and it is correct.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index ccbfc325c778..38faceff2f08 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -854,7 +854,7 @@ static int nmk_gpio_get_dir(struct gpio_chip *chip, unsigned offset)
 
 	clk_enable(nmk_chip->clk);
 
-	dir = !!(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
+	dir = !(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
 
 	clk_disable(nmk_chip->clk);
 
-- 
2.4.11

