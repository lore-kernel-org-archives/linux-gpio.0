From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 088/182] gpio: convert remaining users to gpiochip_add_data()
Date: Wed,  9 Dec 2015 14:29:29 +0100
Message-ID: <1449667769-1721-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35093 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbbLIN3d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:29:33 -0500
Received: by lbpu9 with SMTP id u9so29781267lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:29:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>

For completion, sweep the floor from all gpiochip_add() usage so
we can remove that function and get rid of the function wrapper
gpiochip_add().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ich.c      | 2 +-
 drivers/gpio/gpio-iop.c      | 2 +-
 drivers/gpio/gpio-janz-ttl.c | 2 +-
 drivers/gpio/gpio-ks8695.c   | 2 +-
 drivers/gpio/gpio-loongson.c | 2 +-
 drivers/gpio/gpio-sa1100.c   | 2 +-
 drivers/gpio/gpio-tegra.c    | 2 +-
 drivers/gpio/gpio-twl6040.c  | 2 +-
 drivers/gpio/gpio-vr41xx.c   | 2 +-
 drivers/gpio/gpio-xtensa.c   | 4 ++--
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 8623d12e23c1..a4893386abbf 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -499,7 +499,7 @@ static int ichx_gpio_probe(struct platform_device *pdev)
 
 init:
 	ichx_gpiolib_setup(&ichx_priv.chip);
-	err = gpiochip_add(&ichx_priv.chip);
+	err = gpiochip_add_data(&ichx_priv.chip, NULL);
 	if (err) {
 		pr_err("Failed to register GPIOs\n");
 		goto add_err;
diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 2ed0237a8baf..fb65e5850e0c 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -114,7 +114,7 @@ static int iop3xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	return gpiochip_add(&iop3xx_chip);
+	return gpiochip_add_data(&iop3xx_chip, NULL);
 }
 
 static struct platform_driver iop3xx_gpio_driver = {
diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index e5f85cab0100..5b7346b3c722 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -182,7 +182,7 @@ static int ttl_probe(struct platform_device *pdev)
 	gpio->base = -1;
 	gpio->ngpio = 20;
 
-	ret = gpiochip_add(gpio);
+	ret = gpiochip_add_data(gpio, NULL);
 	if (ret) {
 		dev_err(dev, "unable to add GPIO chip\n");
 		return ret;
diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
index cc09b237e88c..9f86ed9c753b 100644
--- a/drivers/gpio/gpio-ks8695.c
+++ b/drivers/gpio/gpio-ks8695.c
@@ -234,7 +234,7 @@ static struct gpio_chip ks8695_gpio_chip = {
 /* Register the GPIOs */
 void ks8695_register_gpios(void)
 {
-	if (gpiochip_add(&ks8695_gpio_chip))
+	if (gpiochip_add_data(&ks8695_gpio_chip, NULL))
 		printk(KERN_ERR "Unable to register core GPIOs\n");
 }
 
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index ccc65a1aea88..92c4fe7b2677 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -110,6 +110,6 @@ static struct gpio_chip loongson_chip = {
 
 static int __init loongson_gpio_setup(void)
 {
-	return gpiochip_add(&loongson_chip);
+	return gpiochip_add_data(&loongson_chip, NULL);
 }
 postcore_initcall(loongson_gpio_setup);
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 990fa9023e22..997f7522bbfa 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -238,7 +238,7 @@ void __init sa1100_init_gpio(void)
 	GRER = 0;
 	GEDR = -1;
 
-	gpiochip_add(&sa1100_gpio_chip);
+	gpiochip_add_data(&sa1100_gpio_chip, NULL);
 
 	sa1100_gpio_irqdomain = irq_domain_add_simple(NULL,
 			28, IRQ_GPIO0,
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 027e5f47dd28..b06ef1995743 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -491,7 +491,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	tegra_gpio_chip.of_node = pdev->dev.of_node;
 
-	ret = gpiochip_add(&tegra_gpio_chip);
+	ret = gpiochip_add_data(&tegra_gpio_chip, NULL);
 	if (ret < 0) {
 		irq_domain_remove(irq_domain);
 		return ret;
diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index 2da7c5f70034..8e9e9853f3bd 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -100,7 +100,7 @@ static int gpo_twl6040_probe(struct platform_device *pdev)
 	twl6040gpo_chip.of_node = twl6040_core_dev->of_node;
 #endif
 
-	ret = gpiochip_add(&twl6040gpo_chip);
+	ret = gpiochip_add_data(&twl6040gpo_chip, NULL);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
 		twl6040gpo_chip.ngpio = 0;
diff --git a/drivers/gpio/gpio-vr41xx.c b/drivers/gpio/gpio-vr41xx.c
index 1947531b7cf5..ac8deb01f6f6 100644
--- a/drivers/gpio/gpio-vr41xx.c
+++ b/drivers/gpio/gpio-vr41xx.c
@@ -544,7 +544,7 @@ static int giu_probe(struct platform_device *pdev)
 
 	vr41xx_gpio_chip.parent = &pdev->dev;
 
-	ret = gpiochip_add(&vr41xx_gpio_chip);
+	ret = gpiochip_add_data(&vr41xx_gpio_chip, NULL);
 	if (!ret) {
 		iounmap(giu_base);
 		return -ENODEV;
diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 93ec95df67a3..f16c0427952e 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -148,10 +148,10 @@ static int xtensa_gpio_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	ret = gpiochip_add(&impwire_chip);
+	ret = gpiochip_add_data(&impwire_chip, NULL);
 	if (ret)
 		return ret;
-	return gpiochip_add(&expstate_chip);
+	return gpiochip_add_data(&expstate_chip, NULL);
 }
 
 static struct platform_driver xtensa_gpio_driver = {
-- 
2.4.3

