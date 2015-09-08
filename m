From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: samsung: s3c24xx: fix syntax error
Date: Tue,  8 Sep 2015 16:55:20 +0200
Message-ID: <1441724120-24870-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36370 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754966AbbIHOzZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 10:55:25 -0400
Received: by lbcao8 with SMTP id ao8so54734295lbc.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 07:55:23 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

?SYNTAX ERROR

irq_desc_get_irq_chip() does not exist. It should
be irq_desc_get_chip(). Tested by compiling
s3c2410_defconfig.

Cc: Thomas Gleixner <tglx@linutronix.de>
Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 019844d479bb..d168b39dd7fd 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -361,7 +361,7 @@ static inline void s3c24xx_demux_eint(struct irq_desc *desc,
 				      u32 offset, u32 range)
 {
 	struct s3c24xx_eint_data *data = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_irq_chip(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct samsung_pinctrl_drv_data *d = data->drvdata;
 	unsigned int pend, mask;
 
-- 
2.4.3

