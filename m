From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [RFC 2/2] gpio_keys: updated the gpio_key driver to use the gpio descriptors instead ot the integer namespace.
Date: Wed, 29 Jan 2014 17:11:16 +0100
Message-ID: <1391011876-7207-3-git-send-email-jjhiblot@traphandler.com>
References: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:52924 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753033AbaA2QO6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2014 11:14:58 -0500
Received: by mail-wg0-f46.google.com with SMTP id x12so3903747wgg.13
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2014 08:14:57 -0800 (PST)
In-Reply-To: <1391011876-7207-1-git-send-email-jjhiblot@traphandler.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
---
 drivers/input/keyboard/gpio_keys.c | 44 +++++++++++++++++++-------------------
 include/linux/gpio_keys.h          |  3 ++-
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 2db1324..306cb77 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -328,7 +328,7 @@ static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
 	const struct gpio_keys_button *button = bdata->button;
 	struct input_dev *input = bdata->input;
 	unsigned int type = button->type ?: EV_KEY;
-	int state = (gpio_get_value_cansleep(button->gpio) ? 1 : 0) ^ button->active_low;
+	int state = (gpiod_get_value_cansleep(button->gpio) ? 1 : 0) ^ button->active_low;
 
 	if (type == EV_ABS) {
 		if (state)
@@ -427,7 +427,7 @@ out:
 static int gpio_keys_setup_key(struct platform_device *pdev,
 				struct input_dev *input,
 				struct gpio_button_data *bdata,
-				const struct gpio_keys_button *button)
+				struct gpio_keys_button *button)
 {
 	const char *desc = button->desc ? button->desc : "gpio_keys";
 	struct device *dev = &pdev->dev;
@@ -439,17 +439,17 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	bdata->button = button;
 	spin_lock_init(&bdata->lock);
 
-	if (gpio_is_valid(button->gpio)) {
-
-		error = gpio_request_one(button->gpio, GPIOF_IN, desc);
-		if (error < 0) {
+	if (button->hw_gpio) {
+		button->gpio = gpiod_request(button->hw_gpio, desc, 0);
+		if (IS_ERR(button->gpio)) {
+			error = PTR_ERR(button->gpio);
 			dev_err(dev, "Failed to request GPIO %d, error %d\n",
-				button->gpio, error);
+				hw_desc_to_gpio(button->hw_gpio), error);
 			return error;
 		}
 
 		if (button->debounce_interval) {
-			error = gpio_set_debounce(button->gpio,
+			error = gpiod_set_debounce(button->gpio,
 					button->debounce_interval * 1000);
 			/* use timer if gpiolib doesn't provide debounce */
 			if (error < 0)
@@ -457,12 +457,12 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 						button->debounce_interval;
 		}
 
-		irq = gpio_to_irq(button->gpio);
+		irq = hw_gpiod_to_irq(button->hw_gpio);
 		if (irq < 0) {
 			error = irq;
 			dev_err(dev,
 				"Unable to get irq number for GPIO %d, error %d\n",
-				button->gpio, error);
+				hw_desc_to_gpio(button->hw_gpio), error);
 			goto fail;
 		}
 		bdata->irq = irq;
@@ -513,8 +513,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	return 0;
 
 fail:
-	if (gpio_is_valid(button->gpio))
-		gpio_free(button->gpio);
+	if (button->gpio)
+		gpiod_put(button->gpio);
 
 	return error;
 }
@@ -526,7 +526,7 @@ static void gpio_keys_report_state(struct gpio_keys_drvdata *ddata)
 
 	for (i = 0; i < ddata->pdata->nbuttons; i++) {
 		struct gpio_button_data *bdata = &ddata->data[i];
-		if (gpio_is_valid(bdata->button->gpio))
+		if (bdata->button->gpio)
 			gpio_keys_gpio_report_event(bdata);
 	}
 	input_sync(input);
@@ -603,7 +603,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 
 	i = 0;
 	for_each_child_of_node(node, pp) {
-		int gpio;
+		struct gpio_hw_desc *gpio;
 		enum of_gpio_flags flags;
 
 		if (!of_find_property(pp, "gpios", NULL)) {
@@ -612,9 +612,9 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 			continue;
 		}
 
-		gpio = of_get_gpio_flags(pp, 0, &flags);
-		if (gpio < 0) {
-			error = gpio;
+		gpio = of_get_gpiod_flags(pp, 0, &flags);
+		if (IS_ERR(gpio)) {
+			error = PTR_ERR(gpio);
 			if (error != -EPROBE_DEFER)
 				dev_err(dev,
 					"Failed to get gpio flags, error: %d\n",
@@ -624,12 +624,12 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 
 		button = &pdata->buttons[i++];
 
-		button->gpio = gpio;
+		button->hw_gpio = gpio;
 		button->active_low = flags & OF_GPIO_ACTIVE_LOW;
 
 		if (of_property_read_u32(pp, "linux,code", &button->code)) {
 			dev_err(dev, "Button without keycode: 0x%x\n",
-				button->gpio);
+				hw_desc_to_gpio(button->hw_gpio));
 			error = -EINVAL;
 			goto err_free_pdata;
 		}
@@ -681,8 +681,8 @@ static void gpio_remove_key(struct gpio_button_data *bdata)
 	if (bdata->timer_debounce)
 		del_timer_sync(&bdata->timer);
 	cancel_work_sync(&bdata->work);
-	if (gpio_is_valid(bdata->button->gpio))
-		gpio_free(bdata->button->gpio);
+	if (bdata->button->gpio)
+		gpiod_put(bdata->button->gpio);
 }
 
 static int gpio_keys_probe(struct platform_device *pdev)
@@ -733,7 +733,7 @@ static int gpio_keys_probe(struct platform_device *pdev)
 		__set_bit(EV_REP, input->evbit);
 
 	for (i = 0; i < pdata->nbuttons; i++) {
-		const struct gpio_keys_button *button = &pdata->buttons[i];
+		struct gpio_keys_button *button = &pdata->buttons[i];
 		struct gpio_button_data *bdata = &ddata->data[i];
 
 		error = gpio_keys_setup_key(pdev, input, bdata, button);
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
index a7e977f..b42cd4e 100644
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -6,7 +6,8 @@ struct device;
 struct gpio_keys_button {
 	/* Configuration parameters */
 	unsigned int code;	/* input event code (KEY_*, SW_*) */
-	int gpio;		/* -1 if this key does not support gpio */
+	struct gpio_desc *gpio;
+	struct gpio_hw_desc *hw_gpio;
 	int active_low;
 	const char *desc;
 	unsigned int type;	/* input event type (EV_KEY, EV_SW, EV_ABS) */
-- 
1.8.5.2

