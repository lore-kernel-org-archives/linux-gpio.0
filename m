From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH 3/3][v6] serial_mctrl_gpio: use gpiod_set_array function
Date: Tue, 04 Nov 2014 17:12:12 +0100
Message-ID: <4411649.XDFZ6bkb1u@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:50952 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754685AbaKDQMR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Nov 2014 11:12:17 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>

Make the serial_mctrl_gpio driver the first user of the new gpiod_set_array
function. All modem control output signals are now set simultaneously.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
This patch depends on my previous patch "gpiolib: allow simultaneous setting
of multiple GPIO outputs".

Change log:
  v6: - add this patch to the series

 drivers/tty/serial/serial_mctrl_gpio.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index a3035f9..a38596c 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -44,15 +44,21 @@ static const struct {
 void mctrl_gpio_set(struct mctrl_gpios *gpios, unsigned int mctrl)
 {
 	enum mctrl_gpio_idx i;
+	struct gpio_desc *desc_array[UART_GPIO_MAX];
+	int value_array[UART_GPIO_MAX];
+	unsigned int count = 0;
 
 	if (IS_ERR_OR_NULL(gpios))
 		return;
 
 	for (i = 0; i < UART_GPIO_MAX; i++)
 		if (!IS_ERR_OR_NULL(gpios->gpio[i]) &&
-		    mctrl_gpios_desc[i].dir_out)
-			gpiod_set_value(gpios->gpio[i],
-					!!(mctrl & mctrl_gpios_desc[i].mctrl));
+		    mctrl_gpios_desc[i].dir_out) {
+			desc_array[count] = gpios->gpio[i];
+			value_array[count] = !!(mctrl & mctrl_gpios_desc[i].mctrl);
+			count++;
+		}
+	gpiod_set_array(count, desc_array, value_array);
 }
 EXPORT_SYMBOL_GPL(mctrl_gpio_set);
 
--
2.0.4
