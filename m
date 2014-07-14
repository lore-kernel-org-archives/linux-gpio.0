From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/2] pinctrl: sunxi: number gpio ranges starting
 from 0
Date: Tue, 15 Jul 2014 01:24:37 +0800
Message-ID: <1405358677-23657-3-git-send-email-wens@csie.org>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWNESCPAKGQETYKCLQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1405358677-23657-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

The pinctrl-sunxi driver originally used the pin number as the gpio
range offset. This resulted in large, bogus gpio numbers for the
new sun6i-a31-r pinctrl devices.

This patch makes the driver number the gpios ranges starting from an
offset of 0, by subtracting the pin_base number from the pin number.
This also makes the system-wide gpio number match the pin number.

Tested on sun8i with sysfs exported gpios.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

This patch also changes the GPIO bindings for R_PIO:

    gpios = <&r_pio B N flag>;

Where B originally was the pinbank label (L or M) counted from A,
with this patch it becomes (L or M) counted from its pinbank base (L).

Thus

    gpios = <&r_pio 10 11 0>; /* PL11 */

becomes

    gpios = <&r_pio 0 11 0>; /* PL11 */

IMO this is correct, as the binding shows the bank offset and pin offset
within the bank for the GPIO controller. But I'm worried it might be a
bit confusing.

---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 23c1b9f..de4fb06 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -507,7 +507,7 @@ static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
 	base = PINS_PER_BANK * gpiospec->args[0];
 	pin = base + gpiospec->args[1];
 
-	if (pin > (gc->base + gc->ngpio))
+	if (pin > gc->ngpio)
 		return -EINVAL;
 
 	if (flags)
@@ -520,12 +520,13 @@ static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct sunxi_pinctrl *pctl = dev_get_drvdata(chip->dev);
 	struct sunxi_desc_function *desc;
+	unsigned pinnum = pctl->desc->pin_base + offset;
 	unsigned irqnum;
 
 	if (offset >= chip->ngpio)
 		return -ENXIO;
 
-	desc = sunxi_pinctrl_desc_find_function_by_pin(pctl, offset, "irq");
+	desc = sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "irq");
 	if (!desc)
 		return -EINVAL;
 
@@ -548,7 +549,8 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 	if (!func)
 		return -EINVAL;
 
-	ret = gpio_lock_as_irq(pctl->chip, pctl->irq_array[d->hwirq]);
+	ret = gpio_lock_as_irq(pctl->chip,
+			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
 	if (ret) {
 		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
 			irqd_to_hwirq(d));
@@ -565,7 +567,8 @@ static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 
-	gpio_unlock_as_irq(pctl->chip, pctl->irq_array[d->hwirq]);
+	gpio_unlock_as_irq(pctl->chip,
+			   pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
 }
 
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
@@ -931,7 +934,7 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 
 		ret = gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
-					     pin->pin.number,
+					     pin->pin.number - pctl->desc->pin_base,
 					     pin->pin.number, 1);
 		if (ret)
 			goto gpiochip_error;
-- 
2.0.1
