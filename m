From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 170/182] platform: x86: intel-pmic: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:49:00 +0100
Message-ID: <1449668940-6643-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36053 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251AbbLINtH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:49:07 -0500
Received: by lbblt2 with SMTP id lt2so30434272lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:49:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Feng Tang <feng.tang@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Feng Tang <feng.tang@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
It seems to be unclear who maintains platform/x86, so I'm just
gonna merge this patch into the GPIO tree unless there is a protest
from someone who wants to have a say.
---
 drivers/platform/x86/intel_pmic_gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index 0e73fd10ba72..63b371d6ee55 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -30,7 +30,7 @@
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <asm/intel_scu_ipc.h>
 #include <linux/device.h>
 #include <linux/intel_pmic_gpio.h>
@@ -174,7 +174,7 @@ static int pmic_irq_type(struct irq_data *data, unsigned type)
 
 static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct pmic_gpio *pg = container_of(chip, struct pmic_gpio, chip);
+	struct pmic_gpio *pg = gpiochip_get_data(chip);
 
 	return pg->irq_base + offset;
 }
@@ -279,7 +279,7 @@ static int platform_pmic_gpio_probe(struct platform_device *pdev)
 	mutex_init(&pg->buslock);
 
 	pg->chip.parent = dev;
-	retval = gpiochip_add(&pg->chip);
+	retval = gpiochip_add_data(&pg->chip, pg);
 	if (retval) {
 		pr_err("Can not add pmic gpio chip\n");
 		goto err;
-- 
2.4.3

