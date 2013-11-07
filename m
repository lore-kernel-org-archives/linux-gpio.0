From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: mvebu: make mvchip->irqbase signed for error handling
Date: Thu, 7 Nov 2013 10:50:19 +0300
Message-ID: <20131107075019.GH21844@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:19854 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291Ab3KGHud (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2013 02:50:33 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a bug in mvebu_gpio_probe() where we do:

	mvchip->irqbase = irq_alloc_descs(-1, 0, ngpios, -1);
	if (mvchip->irqbase < 0) {

The problem is that mvchip->irqbase is unsigned so the error handling
doesn't work.  I have changed it to be a regular int.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 3c3321f..db31290 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -79,7 +79,7 @@ struct mvebu_gpio_chip {
 	spinlock_t	   lock;
 	void __iomem	  *membase;
 	void __iomem	  *percpu_membase;
-	unsigned int       irqbase;
+	int		   irqbase;
 	struct irq_domain *domain;
 	int                soc_variant;
 };
