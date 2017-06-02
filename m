From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] pinctrl: sunxi: constify irq_domain_ops
Date: Fri,  2 Jun 2017 13:29:58 +0200
Message-ID: <20170602112958.3882-1-tklauser@distanz.ch>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.zhinst.com ([212.126.164.98]:48688 "EHLO mail.zhinst.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751126AbdFBLaE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jun 2017 07:30:04 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

struct irq_domain_ops is not modified, so it can be made const.

Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 58774acfc814..0dfd7fa66c48 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -979,7 +979,7 @@ static int sunxi_pinctrl_irq_of_xlate(struct irq_domain *d,
 	return 0;
 }
 
-static struct irq_domain_ops sunxi_pinctrl_irq_domain_ops = {
+static const struct irq_domain_ops sunxi_pinctrl_irq_domain_ops = {
 	.xlate		= sunxi_pinctrl_irq_of_xlate,
 };
 
-- 
2.13.0


