From: Krzysztof Adamski <krzysztof.adamski@tieto.com>
Subject: [PATCH] pinctrl: sunxi: set pin function as input on export
Date: Mon,  8 Feb 2016 15:37:22 +0100
Message-ID: <1454942242-25690-1-git-send-email-krzysztof.adamski@tieto.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>, Jonas Gorski <jogo@openwrt.org>, Krzysztof Adamski <krzysztof.adamski@tieto.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: linux-gpio@vger.kernel.org

Default function of a pin in sunxi SoCs is "disabled". By default gpios
exported by sysfs are set as input and indeed, when reading "direction"
file you will get "in". The "value" pin won't return proper value,
though, confusing user of this interface.

This patch sets direction of a GPIO as input when exporting it.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@tieto.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 7a2465f..905a9fb 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -452,6 +452,16 @@ static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 	return pinctrl_gpio_direction_input(chip->base + offset);
 }
 
+int sunxi_pinctrl_gpio_request(struct gpio_chip *chip, unsigned offset)
+{
+	int ret = pinctrl_gpio_direction_input(chip->base + offset);
+
+	if (ret)
+		return ret;
+
+	return pinctrl_request_gpio(chip->base + offset);
+}
+
 static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
@@ -946,7 +956,7 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
 
 	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
 	pctl->chip->owner = THIS_MODULE;
-	pctl->chip->request = gpiochip_generic_request,
+	pctl->chip->request = sunxi_pinctrl_gpio_request,
 	pctl->chip->free = gpiochip_generic_free,
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input,
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output,
-- 
2.4.2
