From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH] gpio: mvebu: Fix cause computation in irq handler
Date: Wed, 12 Jul 2017 13:22:29 +0200
Message-ID: <20170712112229.858-1-gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54779 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755886AbdGLLWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 07:22:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>

When switching to regmap, the way to compute the irq cause was
reorganized. However while doing it, a typo was introduced: a 'xor'
replaced a 'and'.

This lead to wrong behavior in the interrupt handler ans one of the
symptom was wrong irq handler called on the Armada 388 GP:
"->handle_irq():  c016303c,
handle_bad_irq+0x0/0x278
->irq_data.chip(): c0b0ec0c,
0xc0b0ec0c
->action():   (null)
   IRQ_NOPROBE set
 IRQ_NOREQUEST set
unexpected IRQ trap at vector 00
irq 0, desc: ee804800, depth: 1, count: 0, unhandled: 0"

Fixes: 2233bf7a92e7 ("gpio: mvebu: switch to regmap for register access")
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/gpio/gpio-mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index e338c3743562..45c65f805fd6 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -557,7 +557,7 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 	edge_cause = mvebu_gpio_read_edge_cause(mvchip);
 	edge_mask  = mvebu_gpio_read_edge_mask(mvchip);
 
-	cause = (data_in ^ level_mask) | (edge_cause & edge_mask);
+	cause = (data_in & level_mask) | (edge_cause & edge_mask);
 
 	for (i = 0; i < mvchip->chip.ngpio; i++) {
 		int irq;
-- 
2.13.2

