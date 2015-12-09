From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 131/182] avr32: gpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:36:53 +0100
Message-ID: <1449668213-4111-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:35564 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496AbbLINg7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:36:59 -0500
Received: by lbpu9 with SMTP id u9so29907040lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:36:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
AVR32 folks: please ACK this patch so I can take it through the
GPIO tree.
BTW: consider tidying up and moving this driver to drivers/pinctrl
and implement the right pin control interfaces for AVR32 ...
thanks.
---
 arch/avr32/mach-at32ap/pio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.c
index aa74491771fa..5020057ac7a2 100644
--- a/arch/avr32/mach-at32ap/pio.c
+++ b/arch/avr32/mach-at32ap/pio.c
@@ -203,7 +203,7 @@ fail:
 
 static int direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	struct pio_device *pio = container_of(chip, struct pio_device, chip);
+	struct pio_device *pio = gpiochip_get_data(chip);
 	u32 mask = 1 << offset;
 
 	if (!(pio_readl(pio, PSR) & mask))
@@ -215,7 +215,7 @@ static int direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct pio_device *pio = container_of(chip, struct pio_device, chip);
+	struct pio_device *pio = gpiochip_get_data(chip);
 
 	return (pio_readl(pio, PDSR) >> offset) & 1;
 }
@@ -224,7 +224,7 @@ static void gpio_set(struct gpio_chip *chip, unsigned offset, int value);
 
 static int direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct pio_device *pio = container_of(chip, struct pio_device, chip);
+	struct pio_device *pio = gpiochip_get_data(chip);
 	u32 mask = 1 << offset;
 
 	if (!(pio_readl(pio, PSR) & mask))
@@ -237,7 +237,7 @@ static int direction_output(struct gpio_chip *chip, unsigned offset, int value)
 
 static void gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct pio_device *pio = container_of(chip, struct pio_device, chip);
+	struct pio_device *pio = gpiochip_get_data(chip);
 	u32 mask = 1 << offset;
 
 	if (value)
@@ -335,7 +335,7 @@ gpio_irq_setup(struct pio_device *pio, int irq, int gpio_irq)
  */
 static void pio_bank_show(struct seq_file *s, struct gpio_chip *chip)
 {
-	struct pio_device *pio = container_of(chip, struct pio_device, chip);
+	struct pio_device *pio = gpiochip_get_data(chip);
 	u32			psr, osr, imr, pdsr, pusr, ifsr, mdsr;
 	unsigned		i;
 	u32			mask;
@@ -406,7 +406,7 @@ static int __init pio_probe(struct platform_device *pdev)
 	pio->chip.set = gpio_set;
 	pio->chip.dbg_show = pio_bank_show;
 
-	gpiochip_add(&pio->chip);
+	gpiochip_add_data(&pio->chip, pio);
 
 	gpio_irq_setup(pio, irq, gpio_irq_base);
 
-- 
2.4.3

