From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 098/182] pinctrl: adi2: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:31:21 +0100
Message-ID: <1449667881-2340-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:36741 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754518AbbLINbZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:31:25 -0500
Received: by lbblt2 with SMTP id lt2so30132095lbb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:31:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sonic Zhang <sonic.zhang@analog.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-adi2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index fd342dffe4dc..9ad1a8d29bbe 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -636,7 +636,7 @@ static int adi_pinmux_set(struct pinctrl_dev *pctldev, unsigned func_id,
 		if (range == NULL) /* should not happen */
 			return -ENODEV;
 
-		port = container_of(range->gc, struct gpio_port, chip);
+		port = gpiochip_get_data(range->gc);
 
 		spin_lock_irqsave(&port->lock, flags);
 
@@ -684,7 +684,7 @@ static int adi_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 	u8 offset;
 
-	port = container_of(range->gc, struct gpio_port, chip);
+	port = gpiochip_get_data(range->gc);
 	offset = pin_to_offset(range, pin);
 
 	spin_lock_irqsave(&port->lock, flags);
@@ -718,7 +718,7 @@ static int adi_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	struct gpio_port *port;
 	unsigned long flags;
 
-	port = container_of(chip, struct gpio_port, chip);
+	port = gpiochip_get_data(chip);
 
 	spin_lock_irqsave(&port->lock, flags);
 
@@ -733,7 +733,7 @@ static int adi_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static void adi_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 	int value)
 {
-	struct gpio_port *port = container_of(chip, struct gpio_port, chip);
+	struct gpio_port *port = gpiochip_get_data(chip);
 	struct gpio_port_t *regs = port->regs;
 	unsigned long flags;
 
@@ -750,7 +750,7 @@ static void adi_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 static int adi_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	int value)
 {
-	struct gpio_port *port = container_of(chip, struct gpio_port, chip);
+	struct gpio_port *port = gpiochip_get_data(chip);
 	struct gpio_port_t *regs = port->regs;
 	unsigned long flags;
 
@@ -770,7 +770,7 @@ static int adi_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int adi_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_port *port = container_of(chip, struct gpio_port, chip);
+	struct gpio_port *port = gpiochip_get_data(chip);
 	struct gpio_port_t *regs = port->regs;
 	unsigned long flags;
 	int ret;
@@ -786,7 +786,7 @@ static int adi_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 
 static int adi_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_port *port = container_of(chip, struct gpio_port, chip);
+	struct gpio_port *port = gpiochip_get_data(chip);
 
 	if (port->irq_base >= 0)
 		return irq_find_mapping(port->domain, offset);
@@ -994,7 +994,7 @@ static int adi_gpio_probe(struct platform_device *pdev)
 	port->chip.ngpio		= port->width;
 	gpio = port->chip.base + port->width;
 
-	ret = gpiochip_add(&port->chip);
+	ret = gpiochip_add_data(&port->chip, port);
 	if (ret) {
 		dev_err(&pdev->dev, "Fail to add GPIO chip.\n");
 		goto out_remove_domain;
-- 
2.4.3

