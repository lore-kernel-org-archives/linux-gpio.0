From: Dmitry Mastykin <mastichi@gmail.com>
Subject: pinctrl-mcp23s08: 1 changed pin -> multiple interrupts
Date: Mon, 16 Oct 2017 18:19:42 +0300
Message-ID: <CALieaeeBpmbr6f_zP7yUniSKODaWasybPoAGVKjWyTJ9+Vg3nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:47598 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753508AbdJPPTn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 11:19:43 -0400
Received: by mail-wm0-f67.google.com with SMTP id t69so4462042wmt.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 08:19:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello,
I had problems with pinctrl-mcp23s08 driver.
I use it with MCP23008 chip. Half of the chip is used by gpio-keys,
other half is eventually used via sysfs.
Pushing a key caused interrupts for all the 4 keys. In result - no
keyboard codes generated.
I found that problem was in mcp23s08_get() that being called by isr
for each changed pin clobbers the cached_gpio.
With following patch driver works for me.

Regards,
Dmitry


diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c
b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3e40d42..27ce202 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -63,6 +63,7 @@ struct mcp23s08 {
  int irq;
  bool irq_controller;
  int cached_gpio;
+ int cached_gpinten;
  /* lock protects regmap access with bypass/cache flags */
  struct mutex lock;

@@ -401,6 +402,9 @@ static int mcp23s08_get(struct gpio_chip *chip,
unsigned offset)
  struct mcp23s08 *mcp = gpiochip_get_data(chip);
  int status, ret;

+ if (mcp->cached_gpinten & (1 << offset))
+ return !!(mcp->cached_gpio & (1 << offset));
+
  mutex_lock(&mcp->lock);

  /* REVISIT reading this clears any IRQ ... */
@@ -486,15 +490,15 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
  mcp->cached_gpio = gpio;
  mutex_unlock(&mcp->lock);

+ dev_dbg(mcp->chip.parent,
+ "intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
+ intcap, intf, gpio_orig, gpio);
+
  if (intf == 0) {
  /* There is no interrupt pending */
  return IRQ_HANDLED;
  }

- dev_dbg(mcp->chip.parent,
- "intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
- intcap, intf, gpio_orig, gpio);
-
  for (i = 0; i < mcp->chip.ngpio; i++) {
  /* We must check all of the inputs on the chip,
  * otherwise we may not notice a change on >=2 pins.
@@ -514,6 +518,9 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
  * to see if the input has changed.
  */

+ if (!(mcp->cached_gpinten & BIT(i)))
+ continue;
+
  intf_set = intf & BIT(i);
  if (i < 8 && intf_set)
  intcap_mask = 0x00FF;
@@ -552,6 +559,7 @@ static void mcp23s08_irq_mask(struct irq_data *data)
  unsigned int pos = data->hwirq;

  mcp_set_bit(mcp, MCP_GPINTEN, pos, false);
+ mcp->cached_gpinten &= ~BIT(pos);
 }

 static void mcp23s08_irq_unmask(struct irq_data *data)
@@ -561,6 +569,7 @@ static void mcp23s08_irq_unmask(struct irq_data *data)
  unsigned int pos = data->hwirq;

  mcp_set_bit(mcp, MCP_GPINTEN, pos, true);
+ mcp->cached_gpinten |= BIT(pos);
 }

 static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
@@ -891,6 +900,8 @@ static int mcp23s08_probe_one(struct mcp23s08
*mcp, struct device *dev,
  goto fail;
  }

+ mcp_read(mcp, MCP_GPIO, &mcp->cached_gpio);  // initial value
+
  ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
  if (ret < 0)
  goto fail;
