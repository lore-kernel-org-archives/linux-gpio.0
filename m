From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: Return int for .irq_request_resources callback
Date: Tue, 18 Mar 2014 17:40:20 +0800
Message-ID: <1395135620.18373.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:38147 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753787AbaCRJk2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Mar 2014 05:40:28 -0400
Received: by mail-pb0-f42.google.com with SMTP id rr13so7065614pbb.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2014 02:40:28 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jamie Iles <jamie@jamieiles.com>, linux-gpio@vger.kernel.org

This fixes below build warnings:

  CC      drivers/gpio/gpio-dwapb.o
drivers/gpio/gpio-dwapb.c: In function 'dwapb_configure_irqs':
drivers/gpio/gpio-dwapb.c:258:33: warning: assignment from incompatible pointer type [enabled by default]
  CC      drivers/gpio/gpio-pl061.o
drivers/gpio/gpio-pl061.c:261:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-pl061.c:261:2: warning: (near initialization for 'pl061_irqchip.irq_request_resources') [enabled by default]

Fixes: 9a63a88cd390 ("gpio: switch drivers to use new callback")
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-dwapb.c | 2 +-
 drivers/gpio/gpio-pl061.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2cacb9ed..ed5711f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -136,7 +136,7 @@ static void dwapb_irq_disable(struct irq_data *d)
 	spin_unlock_irqrestore(&bgc->lock, flags);
 }
 
-static unsigned int dwapb_irq_reqres(struct irq_data *d)
+static int dwapb_irq_reqres(struct irq_data *d)
 {
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = igc->private;
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 2189183..d2a0ad5 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -233,7 +233,7 @@ static void pl061_irq_unmask(struct irq_data *d)
 	spin_unlock(&chip->lock);
 }
 
-static unsigned int pl061_irq_reqres(struct irq_data *d)
+static int pl061_irq_reqres(struct irq_data *d)
 {
 	struct pl061_gpio *chip = irq_data_get_irq_chip_data(d);
 
-- 
1.8.3.2



