From: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Subject: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
Date: Tue, 9 Sep 2014 15:12:25 +0800
Message-ID: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cnbjrel01.sonyericsson.com ([219.141.167.165]:4170 "EHLO
	cnbjrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756013AbaIIHWm convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 9 Sep 2014 03:22:42 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "'linus.walleij@linaro.org'" <linus.walleij@linaro.org>, "'gnurou@gmail.com'" <gnurou@gmail.com>, "'linux-gpio@vger.kernel.org'" <linux-gpio@vger.kernel.org>, "'akpm@linux-foundation.org'" <akpm@linux-foundation.org>

this patch change use from irq_create_mapping to irq_alloc_descs_from,
use irq_create_mapping to alloc virq one by one is not safe,
it can't promise the allcated virqs are continuous,
in stead, we use irq_alloc_descs_from() to alloc virqs in one time,
so that the allocated virqs are in continuous bitmaps.

Signed-off-by: Yalin Wang <yalin.wang@sonymobile.com>
---
 drivers/gpio/gpiolib.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 15cc0bb..2b6c441 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -566,7 +566,6 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 			 unsigned int type)
 {
 	struct device_node *of_node;
-	unsigned int offset;
 	unsigned irq_base = 0;
 
 	if (!gpiochip || !irqchip)
@@ -604,14 +603,13 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 	 * any gpiochip calls. If the first_irq was zero, this is
 	 * necessary to allocate descriptors for all IRQs.
 	 */
-	for (offset = 0; offset < gpiochip->ngpio; offset++) {
-		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
-		if (offset == 0)
-			/*
-			 * Store the base into the gpiochip to be used when
-			 * unmapping the irqs.
-			 */
-			gpiochip->irq_base = irq_base;
+	if (first_irq > 0) {
+		gpiochip->irq_base = first_irq;
+	} else {
+		gpiochip->irq_base = irq_alloc_descs_from(1, gpiochip->ngpio,
+				of_node_to_nid(of_node));
+		irq_domain_associate_many(gpiochip->irqdomain,
+				gpiochip->irq_base, 0, gpiochip->ngpio);
 	}
 
 	acpi_gpiochip_request_interrupts(gpiochip);
-- 
2.1.0
