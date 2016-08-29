From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 04/33] gpio: sa1100: implement get_direction method
Date: Mon, 29 Aug 2016 11:24:25 +0100
Message-ID: <E1beJjt-0000m4-Rf@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56240 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756515AbcH2KYg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:24:36 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

Allow gpiolib to read back the current IO direction configuration by
implementing the .get_direction callback.  This, in part, allows
debugfs to report the complete true hardware state rather than the
software state.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/gpio-sa1100.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index bad0169524c9..249f433aa62d 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -52,6 +52,13 @@ static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	writel_relaxed(BIT(offset), sa1100_gpio_chip(chip)->membase + reg);
 }
 
+static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
+
+	return !(readl_relaxed(gpdr) & BIT(offset));
+}
+
 static int sa1100_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
@@ -85,6 +92,7 @@ static int sa1100_to_irq(struct gpio_chip *chip, unsigned offset)
 static struct sa1100_gpio_chip sa1100_gpio_chip = {
 	.chip = {
 		.label			= "gpio",
+		.get_direction		= sa1100_get_direction,
 		.direction_input	= sa1100_direction_input,
 		.direction_output	= sa1100_direction_output,
 		.set			= sa1100_gpio_set,
-- 
2.1.0

