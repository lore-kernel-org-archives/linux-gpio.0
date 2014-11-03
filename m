From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH 1/5] gpio: moxart: convert to use basic mmio gpio library
Date: Mon, 3 Nov 2014 15:08:30 +0100
Message-ID: <CACmBeS2K4pjJ5VZtrjJ-2zwu-hC+c=+6ptkGvX+6w+U4y4Tw0Q@mail.gmail.com>
References: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
	<1414591005-30961-2-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:52130 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751838AbaKCOIc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Nov 2014 09:08:32 -0500
Received: by mail-lb0-f172.google.com with SMTP id w7so2175742lbi.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2014 06:08:31 -0800 (PST)
In-Reply-To: <1414591005-30961-2-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kamlakant.patel@linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Thanks for keeping this maintained.

I think there's a problem..

RTC is not read on boot: "hctosys: invalid date/time".
hwclock result in: "Timed out waiting for time change."

Comments and patch suggestion below.


On 29 October 2014 14:56,  <kamlakant.patel@linaro.org> wrote:
>  static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>         struct moxart_gpio_chip *gc = to_moxart_gpio(chip);

to_moxart_gpio() helper is no longer valid here, since bgpio_chip is
the new container.


>  static int moxart_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct resource *res;
> +       struct bgpio_chip *bgc;
>         struct moxart_gpio_chip *mgc;
>         int ret;
>
>         mgc = devm_kzalloc(dev, sizeof(*mgc), GFP_KERNEL);
>         if (!mgc)
>                 return -ENOMEM;
> -       mgc->gpio = moxart_template_chip;
> +
> +       bgc = devm_kzalloc(dev, sizeof(*bgc), GFP_KERNEL);
> +       if (!bgc)
> +               return -ENOMEM;
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         mgc->base = devm_ioremap_resource(dev, res);
>         if (IS_ERR(mgc->base))
>                 return PTR_ERR(mgc->base);
>
> -       mgc->gpio.dev = dev;
> +       ret = bgpio_init(bgc, dev, 4, mgc->base + GPIO_PIN_DIRECTION,
> +                   mgc->base + GPIO_DATA_OUT, NULL,
> +                   mgc->base + GPIO_PIN_DIRECTION, NULL, 0);
> +
> +       if (ret) {
> +               dev_err(&pdev->dev, "bgpio_init failed\n");
> +               return ret;
> +       }
> +
> +       bgc->gc.label = "moxart-gpio";
> +       bgc->gc.request = moxart_gpio_request;
> +       bgc->gc.free = moxart_gpio_free,
> +       bgc->gc.get = moxart_gpio_get,

End with semicolon?



 drivers/gpio/Kconfig       |  1 +
 drivers/gpio/gpio-moxart.c | 84 ++++++++++++++++------------------------------
 2 files changed, 29 insertions(+), 56 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9de1515..c1b8a90 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -185,6 +185,7 @@ config GPIO_F7188X
 config GPIO_MOXART
  bool "MOXART GPIO support"
  depends on ARCH_MOXART
+ select GPIO_GENERIC
  help
   Select this option to enable GPIO driver for
   MOXA ART SoC devices.
diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 4661e18..50278b6 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -23,21 +23,23 @@
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/bitops.h>
+#include <linux/basic_mmio_gpio.h>

 #define GPIO_DATA_OUT 0x00
 #define GPIO_DATA_IN 0x04
 #define GPIO_PIN_DIRECTION 0x08

-struct moxart_gpio_chip {
- struct gpio_chip gpio;
+struct moxart_bgpio_chip {
+ struct bgpio_chip gpio;
  void __iomem *base;
 };

-static inline struct moxart_gpio_chip *to_moxart_gpio(struct gpio_chip *chip)
+static inline struct moxart_bgpio_chip *to_moxart_bgpio(struct
bgpio_chip *chip)
 {
- return container_of(chip, struct moxart_gpio_chip, gpio);
+ return container_of(chip, struct moxart_bgpio_chip, gpio);
 }

+
 static int moxart_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
  return pinctrl_request_gpio(offset);
@@ -48,23 +50,11 @@ static void moxart_gpio_free(struct gpio_chip
*chip, unsigned offset)
  pinctrl_free_gpio(offset);
 }

-static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-{
- struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
- void __iomem *ioaddr = gc->base + GPIO_DATA_OUT;
- u32 reg = readl(ioaddr);
-
- if (value)
- reg = reg | BIT(offset);
- else
- reg = reg & ~BIT(offset);
-
- writel(reg, ioaddr);
-}
-
 static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
- struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
+ struct bgpio_chip *bgc = to_bgpio_chip(chip);
+ struct moxart_bgpio_chip *gc = to_moxart_bgpio(bgc);
+
  u32 ret = readl(gc->base + GPIO_PIN_DIRECTION);

  if (ret & BIT(offset))
@@ -73,65 +63,47 @@ static int moxart_gpio_get(struct gpio_chip *chip,
unsigned offset)
  return !!(readl(gc->base + GPIO_DATA_IN) & BIT(offset));
 }

-static int moxart_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
- struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
- void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
-
- writel(readl(ioaddr) & ~BIT(offset), ioaddr);
- return 0;
-}
-
-static int moxart_gpio_direction_output(struct gpio_chip *chip,
- unsigned offset, int value)
-{
- struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
- void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
-
- moxart_gpio_set(chip, offset, value);
- writel(readl(ioaddr) | BIT(offset), ioaddr);
- return 0;
-}
-
-static struct gpio_chip moxart_template_chip = {
- .label = "moxart-gpio",
- .request = moxart_gpio_request,
- .free = moxart_gpio_free,
- .direction_input = moxart_gpio_direction_input,
- .direction_output = moxart_gpio_direction_output,
- .set = moxart_gpio_set,
- .get = moxart_gpio_get,
- .ngpio = 32,
- .owner = THIS_MODULE,
-};
-
 static int moxart_gpio_probe(struct platform_device *pdev)
 {
  struct device *dev = &pdev->dev;
  struct resource *res;
- struct moxart_gpio_chip *mgc;
+ struct moxart_bgpio_chip *mgc;
  int ret;

  mgc = devm_kzalloc(dev, sizeof(*mgc), GFP_KERNEL);
  if (!mgc)
  return -ENOMEM;
- mgc->gpio = moxart_template_chip;

  res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  mgc->base = devm_ioremap_resource(dev, res);
  if (IS_ERR(mgc->base))
  return PTR_ERR(mgc->base);

- mgc->gpio.dev = dev;
+ ret = bgpio_init(&mgc->gpio, dev, 4, mgc->base + GPIO_PIN_DIRECTION,
+ mgc->base + GPIO_DATA_OUT, NULL,
+ mgc->base + GPIO_PIN_DIRECTION, NULL, 0);
+
+ if (ret) {
+ dev_err(&pdev->dev, "bgpio_init failed\n");
+ return ret;
+ }
+
+ mgc->gpio.gc.label = "moxart-gpio";
+ mgc->gpio.gc.request = moxart_gpio_request;
+ mgc->gpio.gc.free = moxart_gpio_free;
+ mgc->gpio.gc.get = moxart_gpio_get;
+ mgc->gpio.gc.ngpio = 32;
+ mgc->gpio.gc.dev = dev;
+ mgc->gpio.gc.owner = THIS_MODULE;

- ret = gpiochip_add(&mgc->gpio);
+ ret = gpiochip_add(&mgc->gpio.gc);
  if (ret) {
  dev_err(dev, "%s: gpiochip_add failed\n",
  dev->of_node->full_name);
  return ret;
  }

- return 0;
+ return ret;
 }

 static const struct of_device_id moxart_gpio_match[] = {



Regards,
Jonas
