From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: set explicit nesting on drivers
Date: Thu, 24 Nov 2016 13:39:01 +0100
Message-ID: <1479991141-24202-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33410 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938647AbcKXMjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 07:39:09 -0500
Received: by mail-lf0-f52.google.com with SMTP id c13so27736752lfg.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2016 04:39:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Bin Gao <bin.gao@linux.intel.com>

The ADNP, CrystalCove and WhiskeyCove are all nested GPIO
irqchips, but were avoiding to connect the parent IRQ to
the gpiochip. This works, but is kind of sloppy as the
child IRQs are not marked as having the parent IRQ as
parent.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
Cc: Bin Gao <bin.gao@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adnp.c        | 2 ++
 drivers/gpio/gpio-crystalcove.c | 2 ++
 drivers/gpio/gpio-wcove.c       | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 7a5c0a93e1ff..36b12f5a95b3 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -479,6 +479,8 @@ static int adnp_irq_setup(struct adnp *adnp)
 		return err;
 	}
 
+	gpiochip_set_nested_irqchip(chip, &adnp_irq_chip, adnp_irq);
+
 	return 0;
 }
 
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index d0022d655a09..2197368cc899 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -362,6 +362,8 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 		return retval;
 	}
 
+	gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
+
 	return 0;
 }
 
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 88f29601f8de..34baee5b1dd6 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -446,6 +446,8 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	gpiochip_set_nested_irqchip(&wg->chip, &wcove_irqchip, virq);
+
 	return 0;
 }
 
-- 
2.7.4

