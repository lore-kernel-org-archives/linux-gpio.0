From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: merrifield: set default handler to be handle_bad_irq()
Date: Mon, 10 Oct 2016 12:07:53 +0300
Message-ID: <20161010090753.39450-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:44954 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751586AbcJJJH5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Oct 2016 05:07:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

We switch the default handler to be handle_bad_irq() instead of
handle_simple_irq() (which was not correct anyway).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 45b5127..82cdcdc 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -411,7 +411,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	}
 
 	retval = gpiochip_irqchip_add(&priv->chip, &mrfld_irqchip, irq_base,
-				      handle_simple_irq, IRQ_TYPE_NONE);
+				      handle_bad_irq, IRQ_TYPE_NONE);
 	if (retval) {
 		dev_err(&pdev->dev, "could not connect irqchip to gpiochip\n");
 		return retval;
-- 
2.9.3

