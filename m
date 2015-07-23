From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/5] pinctrl: nomadik: find chip from local array
Date: Thu, 23 Jul 2015 09:09:29 +0200
Message-ID: <1437635369-23369-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:33241 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbGWHJf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2015 03:09:35 -0400
Received: by laah7 with SMTP id h7so20295646laa.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2015 00:09:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Instead of indexing around the GPIO ranges to find a chip, look directly
in the local array of state containers for nmk_gpio_chip:s.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 64 +++++++++++++------------------
 1 file changed, 26 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index c5b8c89dbe1a..f068583fdc9b 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1356,35 +1356,40 @@ static int nmk_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-static struct pinctrl_gpio_range *
-nmk_match_gpio_range(struct pinctrl_dev *pctldev, unsigned offset)
+static struct nmk_gpio_chip *find_nmk_gpio_from_pin(unsigned pin)
 {
-	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
 	int i;
+	struct nmk_gpio_chip *nmk_gpio;
 
-	for (i = 0; i < npct->soc->gpio_num_ranges; i++) {
-		struct pinctrl_gpio_range *range;
-
-		range = &npct->soc->gpio_ranges[i];
-		if (offset >= range->pin_base &&
-		    offset <= (range->pin_base + range->npins - 1))
-			return range;
+	for(i = 0; i < NMK_MAX_BANKS; i++) {
+		nmk_gpio = nmk_gpio_chips[i];
+		if (!nmk_gpio)
+			continue;
+		if (pin >= nmk_gpio->chip.base &&
+			pin < nmk_gpio->chip.base + nmk_gpio->chip.ngpio)
+			return nmk_gpio;
 	}
 	return NULL;
 }
 
+static struct gpio_chip *find_gc_from_pin(unsigned pin)
+{
+	struct nmk_gpio_chip *nmk_gpio = find_nmk_gpio_from_pin(pin);
+
+	if (nmk_gpio)
+		return &nmk_gpio->chip;
+	return NULL;
+}
+
 static void nmk_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 		   unsigned offset)
 {
-	struct pinctrl_gpio_range *range;
-	struct gpio_chip *chip;
+	struct gpio_chip *chip = find_gc_from_pin(offset);
 
-	range = nmk_match_gpio_range(pctldev, offset);
-	if (!range || !range->gc) {
+	if (!chip) {
 		seq_printf(s, "invalid pin offset");
 		return;
 	}
-	chip = range->gc;
 	nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base, offset);
 }
 
@@ -1729,25 +1734,16 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned function,
 	}
 
 	for (i = 0; i < g->npins; i++) {
-		struct pinctrl_gpio_range *range;
 		struct nmk_gpio_chip *nmk_chip;
-		struct gpio_chip *chip;
 		unsigned bit;
 
-		range = nmk_match_gpio_range(pctldev, g->pins[i]);
-		if (!range) {
+		nmk_chip = find_nmk_gpio_from_pin(g->pins[i]);
+		if (!nmk_chip) {
 			dev_err(npct->dev,
 				"invalid pin offset %d in group %s at index %d\n",
 				g->pins[i], g->name, i);
 			goto out_glitch;
 		}
-		if (!range->gc) {
-			dev_err(npct->dev, "GPIO chip missing in range for pin offset %d in group %s at index %d\n",
-				g->pins[i], g->name, i);
-			goto out_glitch;
-		}
-		chip = range->gc;
-		nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
 		dev_dbg(npct->dev, "setting pin %d to altsetting %d\n", g->pins[i], g->altsetting);
 
 		clk_enable(nmk_chip->clk);
@@ -1863,25 +1859,17 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 	};
 	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
 	struct nmk_gpio_chip *nmk_chip;
-	struct pinctrl_gpio_range *range;
-	struct gpio_chip *chip;
 	unsigned bit;
 	pin_cfg_t cfg;
 	int pull, slpm, output, val, i;
 	bool lowemi, gpiomode, sleep;
 
-	range = nmk_match_gpio_range(pctldev, pin);
-	if (!range) {
-		dev_err(npct->dev, "invalid pin offset %d\n", pin);
+	nmk_chip = find_nmk_gpio_from_pin(pin);
+	if (!nmk_chip) {
+		dev_err(npct->dev,
+			"invalid pin offset %d\n", pin);
 		return -EINVAL;
 	}
-	if (!range->gc) {
-		dev_err(npct->dev, "GPIO chip missing in range for pin %d\n",
-			pin);
-		return -EINVAL;
-	}
-	chip = range->gc;
-	nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
 
 	for (i = 0; i < num_configs; i++) {
 		/*
-- 
2.4.3

