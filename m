From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 1/2] pinctrl: single: Constify irq_domain_ops
Date: Mon, 27 Apr 2015 21:54:06 +0900
Message-ID: <1430139247-4198-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:33013 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932498AbbD0Myt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 08:54:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The irq_domain_ops are not modified by the driver and the irqdomain core
code accepts pointer to a const data.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 13b45f297727..968e352c595f 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1726,7 +1726,7 @@ static int pcs_irqdomain_map(struct irq_domain *d, unsigned int irq,
 	return 0;
 }
 
-static struct irq_domain_ops pcs_irqdomain_ops = {
+static const struct irq_domain_ops pcs_irqdomain_ops = {
 	.map = pcs_irqdomain_map,
 	.xlate = irq_domain_xlate_onecell,
 };
-- 
2.1.0

