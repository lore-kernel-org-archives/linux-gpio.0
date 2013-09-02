From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: improve error path in gpiolib
Date: Mon,  2 Sep 2013 10:39:56 +0200
Message-ID: <1378111196-4247-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ea0-f182.google.com ([209.85.215.182]:53947 "EHLO
	mail-ea0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758105Ab3IBIkE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2013 04:40:04 -0400
Received: by mail-ea0-f182.google.com with SMTP id o10so2220445eaj.27
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2013 01:40:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Tim Bird <tim.bird@sonymobile.com>

At several places the gpiolib will proceed to handle a GPIO
descriptor even if it's ->chip member is NULL and no gpiochip
is associated.

Fix this by checking that both the descriptor cookie *and*
the chip pointer are valid.

Also bail out earlier with more specific diagnostic messages
on missing operations for setting as input/output or debounce.

ChangeLog v1->v2:
- Also return -EIO on gpiod_set_debounce() with missing
  operations in the vtable
- Fix indentations.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Frank Rowand <frank.rowand@sonymobile.com>
Cc: Tim Bird <tim.bird@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d6413b2..a7587db 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1398,7 +1398,7 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
 	int			status = -EPROBE_DEFER;
 	unsigned long		flags;
 
-	if (!desc) {
+	if (!desc || !desc->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
@@ -1406,8 +1406,6 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	chip = desc->chip;
-	if (chip == NULL)
-		goto done;
 
 	if (!try_module_get(chip->owner))
 		goto done;
@@ -1630,16 +1628,20 @@ static int gpiod_direction_input(struct gpio_desc *desc)
 	int			status = -EINVAL;
 	int			offset;
 
-	if (!desc) {
+	if (!desc || !desc->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
 
+	chip = desc->chip;
+	if (!chip->get || !chip->direction_input) {
+		pr_warn("%s: missing get() or direction_input() operations\n",
+			__func__);
+		return -EIO;
+	}
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	chip = desc->chip;
-	if (!chip || !chip->get || !chip->direction_input)
-		goto fail;
 	status = gpio_ensure_requested(desc);
 	if (status < 0)
 		goto fail;
@@ -1691,7 +1693,7 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
 	int			status = -EINVAL;
 	int offset;
 
-	if (!desc) {
+	if (!desc || !desc->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
@@ -1704,11 +1706,15 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
 	if (!value && test_bit(FLAG_OPEN_SOURCE,  &desc->flags))
 		return gpiod_direction_input(desc);
 
+	chip = desc->chip;
+	if (!chip->set || !chip->direction_output) {
+		pr_warn("%s: missing set() or direction_output() operations\n",
+			__func__);
+		return -EIO;
+	}
+
 	spin_lock_irqsave(&gpio_lock, flags);
 
-	chip = desc->chip;
-	if (!chip || !chip->set || !chip->direction_output)
-		goto fail;
 	status = gpio_ensure_requested(desc);
 	if (status < 0)
 		goto fail;
@@ -1765,7 +1771,7 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	int			status = -EINVAL;
 	int			offset;
 
-	if (!desc) {
+	if (!desc || !desc->chip) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
@@ -1773,8 +1779,11 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	chip = desc->chip;
-	if (!chip || !chip->set || !chip->set_debounce)
-		goto fail;
+	if (!chip->set || !chip->set_debounce) {
+		pr_warn("%s: missing set() or set_debounce() operations\n",
+			__func__);
+		return -EIO;
+	}
 
 	status = gpio_ensure_requested(desc);
 	if (status < 0)
-- 
1.8.3.1

