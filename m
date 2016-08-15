From: Bin Gao <bin.gao@linux.intel.com>
Subject: [PATCH] gpio: wcove-gpio: add get_direction method
Date: Mon, 15 Aug 2016 11:03:23 -0700
Message-ID: <20160815180323.GA229243@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:18093 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752930AbcHOR67 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 15 Aug 2016 13:58:59 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bin Gao <bin.gao@intel.com>

This patch adds .get_direction method for the gpio_chip structure
of the wcove_gpio driver.

Signed-off-by: Bin Gao <bin.gao@intel.com>
---
 drivers/gpio/gpio-wcove.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index f5c88df..e11d6a3 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -164,6 +164,19 @@ static int wcove_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
 			    CTLO_OUTPUT_SET | value);
 }
 
+static int wcove_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct wcove_gpio *wg = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &val);
+	if (ret)
+		return ret;
+
+	return !(val & CTLO_DIR_OUT);
+}
+
 static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
@@ -394,6 +407,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.label = KBUILD_MODNAME;
 	wg->chip.direction_input = wcove_gpio_dir_in;
 	wg->chip.direction_output = wcove_gpio_dir_out;
+	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
 	wg->chip.set = wcove_gpio_set;
 	wg->chip.set_single_ended = wcove_gpio_set_single_ended,
-- 
1.9.1

