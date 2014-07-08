From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH RESEND] gpio: rcar: Add support for DT IRQ flags
Date: Tue, 08 Jul 2014 12:46:46 +0200
Message-ID: <12008900.rC4lq8SXRG@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:59966 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322AbaGHKpp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 06:45:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <damm@opensource.se>, Linus Walleij <linus.walleij@linaro.org>

The gpio-rcar driver has no IRQ domain OF xlate function and thus
ignores IRQ flags specified in DT. Fix this by using the two-cell xlate
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpio/gpio-rcar.c | 1 +
 1 file changed, 1 insertion(+)

The patch hasn't made it to Linus' inbox, I'm thus resending it.

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index ca76ce7..c9edcc9 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -283,6 +283,7 @@ static int gpio_rcar_irq_domain_map(struct irq_domain *h, unsigned int irq,
 
 static struct irq_domain_ops gpio_rcar_irq_domain_ops = {
 	.map	= gpio_rcar_irq_domain_map,
+	.xlate	= irq_domain_xlate_twocell,
 };
 
 struct gpio_rcar_info {
-- 
Regards,

Laurent Pinchart

