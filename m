From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 01/33] gpio: sa1100: fix irq probing for ucb1x00
Date: Mon, 29 Aug 2016 11:24:10 +0100
Message-ID: <E1beJje-0000lm-Ei@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56220 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756527AbcH2KYP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:24:15 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

ucb1x00 has used IRQ probing since it's dawn to find the GPIO interrupt
that it's connected to.  However, commit 23393d49fb75 ("gpio: kill off
set_irq_flags usage") broke this by disabling IRQ probing on GPIO
interrupts.  Fix this.

Fixes: 23393d49fb75 ("gpio: kill off set_irq_flags usage")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/gpio-sa1100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 0c99e8fb9af3..8d8ee0ebf14c 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -155,7 +155,7 @@ static int sa1100_gpio_irqdomain_map(struct irq_domain *d,
 {
 	irq_set_chip_and_handler(irq, &sa1100_gpio_irq_chip,
 				 handle_edge_irq);
-	irq_set_noprobe(irq);
+	irq_set_probe(irq);
 
 	return 0;
 }
-- 
2.1.0

