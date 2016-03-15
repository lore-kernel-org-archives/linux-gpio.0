From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2] pinctrl: rockchip: add support the get_direction
Date: Tue, 15 Mar 2016 15:55:45 +0800
Message-ID: <1458028545-1202-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33673 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751155AbcCOH4u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 03:56:50 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, heiko@sntech.de
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Caesar Wang <wxt@rock-chips.com>, linux-rockchip@lists.infradead.org

This patch adds the get_direction to support the gpio
interface.

The gpio direction is not used on rockchip platform when use the gpio
debugfs.

Tested on kylin board. (RK3036 SoCs)
The repro steps:
$/sys/class/gpio/
echo 53 > export
$/sys/class/gpio/gpio53# cat direction
in
In general, the gpio53 should be out value, but the direction is the
default value 'in',  since the get_direction didn't supported in rockchip
pinctrl.

So, we should add this patch to support it.

Reported-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org

---

Changes in v2:
- As Heiko comments on (https://patchwork.kernel.org/patch/8576661/),
  fixes the wrong offset from original patch.

 drivers/pinctrl/pinctrl-rockchip.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index bf032b9..0b3fd02 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1208,6 +1208,16 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
+static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
+	u32 data;
+
+	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+
+	return !(data & BIT(offset));
+}
+
 /*
  * The calls to gpio_direction_output() and gpio_direction_input()
  * leads to this function call (via the pinctrl_gpio_direction_{input|output}()
@@ -1741,6 +1751,7 @@ static const struct gpio_chip rockchip_gpiolib_chip = {
 	.free = gpiochip_generic_free,
 	.set = rockchip_gpio_set,
 	.get = rockchip_gpio_get,
+	.get_direction	= rockchip_gpio_get_direction,
 	.direction_input = rockchip_gpio_direction_input,
 	.direction_output = rockchip_gpio_direction_output,
 	.to_irq = rockchip_gpio_to_irq,
-- 
1.9.1

