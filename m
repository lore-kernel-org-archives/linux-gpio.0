From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/2] gpio: xgene: fix type of variable containing error codes
Date: Tue, 23 Feb 2016 07:45:34 +0100
Message-ID: <1456209934-13439-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24099 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757303AbcBWGq7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2016 01:46:59 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, open list <linux-kernel@vger.kernel.org>

ret variable can contain error values and is compared with zero.
Its type must be signed.

The problem has been detected using coccinelle script
scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpio/gpio-xgene-sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index b993b86..fd81ebc 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -240,7 +240,7 @@ static const struct irq_domain_ops xgene_gpio_sb_domain_ops = {
 static int xgene_gpio_sb_probe(struct platform_device *pdev)
 {
 	struct xgene_gpio_sb *priv;
-	u32 ret;
+	int ret;
 	struct resource *res;
 	void __iomem *regs;
 	struct irq_domain *parent_domain = NULL;
-- 
1.9.1

