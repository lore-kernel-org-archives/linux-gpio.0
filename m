From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] gpio: pl061: remove confusing naming
Date: Tue, 26 Nov 2013 14:24:08 +0100
Message-ID: <1385472248-26039-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:46296 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753036Ab3KZNYP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 08:24:15 -0500
Received: by mail-lb0-f170.google.com with SMTP id w7so4515350lbi.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 05:24:14 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Baruch Siach <baruch@tkos.co.il>, Deepak Sikri <deepak.sikri@st.com>

Drop the " gpio" suffix after the pl061 irq_chip name:
this is only confusing: an irqchip name should be a single,
short, simple string that looks nice in /proc/interrupts.

Drop the nameing of each individual IRQ to "pl061" - I
think this naming function is for naming the IRQ line,
not for boilerplating them all with the name of the
parent controller, which is already known from the
.name field of the irq_chip.

Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Deepak Sikri <deepak.sikri@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index c3935c58185d..621052f06e67 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -254,7 +254,7 @@ static void pl061_irq_shutdown(struct irq_data *d)
 }
 
 static struct irq_chip pl061_irqchip = {
-	.name		= "pl061 gpio",
+	.name		= "pl061",
 	.irq_mask	= pl061_irq_mask,
 	.irq_unmask	= pl061_irq_unmask,
 	.irq_set_type	= pl061_irq_type,
@@ -267,8 +267,7 @@ static int pl061_irq_map(struct irq_domain *d, unsigned int irq,
 {
 	struct pl061_gpio *chip = d->host_data;
 
-	irq_set_chip_and_handler_name(irq, &pl061_irqchip, handle_simple_irq,
-				      "pl061");
+	irq_set_chip_and_handler(irq, &pl061_irqchip, handle_simple_irq);
 	irq_set_chip_data(irq, chip);
 	irq_set_irq_type(irq, IRQ_TYPE_NONE);
 
-- 
1.8.3.1

