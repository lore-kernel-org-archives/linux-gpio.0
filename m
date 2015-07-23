From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5] pinctrl/ARM: move GPIO and pinctrl deps to device tree
Date: Thu, 23 Jul 2015 09:09:49 +0200
Message-ID: <1437635389-23463-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:36497 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbGWHJ5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2015 03:09:57 -0400
Received: by lagw2 with SMTP id w2so151674797lag.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2015 00:09:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org

This gets the GPIO ranges out of the driver and into the device
tree where they belong. Standard DT bindings already exist for
this. Since no systems with this are deployed we can just augment
all device trees and the drivers at the same time and simplify
the world.

This also defines the array of GPIO chips related to the pin
controller.

Cc: arm@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC: please ACK this if you are OK with it. I am using these
systems as showcase, so I want things to look clean and nice.
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi                 | 23 ++++++++++++----------
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi        |  8 +++++++-
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c  | 21 --------------------
 drivers/pinctrl/nomadik/pinctrl-nomadik-db8540.c  | 24 -----------------------
 drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c | 16 ---------------
 drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 17 ----------------
 drivers/pinctrl/nomadik/pinctrl-nomadik.h         |  4 ----
 7 files changed, 20 insertions(+), 93 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index a75f3289e653..77c10bd91a56 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -286,7 +286,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <0>;
-
+			gpio-ranges = <&pinctrl 0 0 32>;
 			clocks = <&prcc_pclk 1 9>;
 		};
 
@@ -301,7 +301,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <1>;
-
+			gpio-ranges = <&pinctrl 0 32 5>;
 			clocks = <&prcc_pclk 1 9>;
 		};
 
@@ -316,7 +316,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <2>;
-
+			gpio-ranges = <&pinctrl 0 64 32>;
 			clocks = <&prcc_pclk 3 8>;
 		};
 
@@ -331,7 +331,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <3>;
-
+			gpio-ranges = <&pinctrl 0 96 2>;
 			clocks = <&prcc_pclk 3 8>;
 		};
 
@@ -346,7 +346,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <4>;
-
+			gpio-ranges = <&pinctrl 0 128 32>;
 			clocks = <&prcc_pclk 3 8>;
 		};
 
@@ -361,7 +361,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <5>;
-
+			gpio-ranges = <&pinctrl 0 160 12>;
 			clocks = <&prcc_pclk 3 8>;
 		};
 
@@ -376,7 +376,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <6>;
-
+			gpio-ranges = <&pinctrl 0 192 32>;
 			clocks = <&prcc_pclk 2 11>;
 		};
 
@@ -391,7 +391,7 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <7>;
-
+			gpio-ranges = <&pinctrl 0 224 7>;
 			clocks = <&prcc_pclk 2 11>;
 		};
 
@@ -406,12 +406,15 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-bank = <8>;
-
+			gpio-ranges = <&pinctrl 0 256 12>;
 			clocks = <&prcc_pclk 5 1>;
 		};
 
-		pinctrl {
+		pinctrl: pinctrl {
 			compatible = "stericsson,db8500-pinctrl";
+			nomadik-gpio-chips = <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>,
+						<&gpio4>, <&gpio5>, <&gpio6>, <&gpio7>,
+						<&gpio8>;
 			prcm = <&prcmu>;
 		};
 
diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index 9a5f2ba139b7..6846e3eb027d 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -52,6 +52,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-bank = <0>;
+		gpio-ranges = <&pinctrl 0 0 32>;
 		clocks = <&pclk>;
 	};
 
@@ -65,6 +66,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-bank = <1>;
+		gpio-ranges = <&pinctrl 0 32 32>;
 		clocks = <&pclk>;
 	};
 
@@ -78,12 +80,14 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-bank = <2>;
+		gpio-ranges = <&pinctrl 0 64 32>;
 		clocks = <&pclk>;
 	};
 
 	gpio3: gpio@101e7000 {
 		compatible = "st,nomadik-gpio";
 		reg =  <0x101e7000 0x80>;
+		ngpio = <28>;
 		interrupt-parent = <&vica>;
 		interrupts = <9>;
 		interrupt-controller;
@@ -91,11 +95,13 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-bank = <3>;
+		gpio-ranges = <&pinctrl 0 96 28>;
 		clocks = <&pclk>;
 	};
 
-	pinctrl {
+	pinctrl: pinctrl {
 		compatible = "stericsson,stn8815-pinctrl";
+		nomadik-gpio-chips = <&gpio0>, <&gpio1>, <&gpio2>, <&gpio3>;
 		/* Pin configurations */
 		uart0 {
 			uart0_default_mux: uart0_mux {
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
index c74840729648..8392083514fb 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
@@ -355,25 +355,6 @@ static const struct pinctrl_pin_desc nmk_db8500_pins[] = {
 	PINCTRL_PIN(DB8500_PIN_AC27, "GPIO267_AC27"),
 };
 
-#define DB8500_GPIO_RANGE(a, b, c) { .name = "DB8500", .id = a, .base = b, \
-			.pin_base = b, .npins = c }
-
-/*
- * This matches the 32-pin gpio chips registered by the GPIO portion. This
- * cannot be const since we assign the struct gpio_chip * pointer at runtime.
- */
-static struct pinctrl_gpio_range nmk_db8500_ranges[] = {
-	DB8500_GPIO_RANGE(0, 0, 32),
-	DB8500_GPIO_RANGE(1, 32, 5),
-	DB8500_GPIO_RANGE(2, 64, 32),
-	DB8500_GPIO_RANGE(3, 96, 2),
-	DB8500_GPIO_RANGE(4, 128, 32),
-	DB8500_GPIO_RANGE(5, 160, 12),
-	DB8500_GPIO_RANGE(6, 192, 32),
-	DB8500_GPIO_RANGE(7, 224, 7),
-	DB8500_GPIO_RANGE(8, 256, 12),
-};
-
 /*
  * Read the pin group names like this:
  * u0_a_1    = first groups of pins for uart0 on alt function a
@@ -1238,8 +1219,6 @@ static const u16 db8500_prcm_gpiocr_regs[] = {
 };
 
 static const struct nmk_pinctrl_soc_data nmk_db8500_soc = {
-	.gpio_ranges = nmk_db8500_ranges,
-	.gpio_num_ranges = ARRAY_SIZE(nmk_db8500_ranges),
 	.pins = nmk_db8500_pins,
 	.npins = ARRAY_SIZE(nmk_db8500_pins),
 	.functions = nmk_db8500_functions,
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8540.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8540.c
index d7ba5443bae0..2860eafd1b42 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8540.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8540.c
@@ -341,28 +341,6 @@ static const struct pinctrl_pin_desc nmk_db8540_pins[] = {
 	PINCTRL_PIN(DB8540_PIN_D17, "GPIO267_D17"),
 };
 
-#define DB8540_GPIO_RANGE(a, b, c) { .name = "db8540", .id = a, .base = b, \
-			.pin_base = b, .npins = c }
-
-/*
- * This matches the 32-pin gpio chips registered by the GPIO portion. This
- * cannot be const since we assign the struct gpio_chip * pointer at runtime.
- */
-static struct pinctrl_gpio_range nmk_db8540_ranges[] = {
-	DB8540_GPIO_RANGE(0, 0, 18),
-	DB8540_GPIO_RANGE(0, 22, 7),
-	DB8540_GPIO_RANGE(1, 33, 6),
-	DB8540_GPIO_RANGE(2, 64, 4),
-	DB8540_GPIO_RANGE(2, 70, 18),
-	DB8540_GPIO_RANGE(3, 116, 12),
-	DB8540_GPIO_RANGE(4, 128, 32),
-	DB8540_GPIO_RANGE(5, 160, 9),
-	DB8540_GPIO_RANGE(6, 192, 23),
-	DB8540_GPIO_RANGE(6, 219, 5),
-	DB8540_GPIO_RANGE(7, 224, 9),
-	DB8540_GPIO_RANGE(8, 256, 12),
-};
-
 /*
  * Read the pin group names like this:
  * u0_a_1    = first groups of pins for uart0 on alt function a
@@ -1247,8 +1225,6 @@ static const u16 db8540_prcm_gpiocr_regs[] = {
 };
 
 static const struct nmk_pinctrl_soc_data nmk_db8540_soc = {
-	.gpio_ranges = nmk_db8540_ranges,
-	.gpio_num_ranges = ARRAY_SIZE(nmk_db8540_ranges),
 	.pins = nmk_db8540_pins,
 	.npins = ARRAY_SIZE(nmk_db8540_pins),
 	.functions = nmk_db8540_functions,
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c
index 2cd71470f270..a2de3b7a57a0 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik-stn8815.c
@@ -264,20 +264,6 @@ static const struct pinctrl_pin_desc nmk_stn8815_pins[] = {
 	PINCTRL_PIN(STN8815_PIN_J22, "GPIO123_J22"),
 };
 
-#define STN8815_GPIO_RANGE(a, b, c) { .name = "STN8815", .id = a, .base = b, \
-			.pin_base = b, .npins = c }
-
-/*
- * This matches the 32-pin gpio chips registered by the GPIO portion. This
- * cannot be const since we assign the struct gpio_chip * pointer at runtime.
- */
-static struct pinctrl_gpio_range nmk_stn8815_ranges[] = {
-	STN8815_GPIO_RANGE(0, 0, 32),
-	STN8815_GPIO_RANGE(1, 32, 32),
-	STN8815_GPIO_RANGE(2, 64, 32),
-	STN8815_GPIO_RANGE(3, 96, 28),
-};
-
 /*
  * Read the pin group names like this:
  * u0_a_1    = first groups of pins for uart0 on alt function a
@@ -342,8 +328,6 @@ static const struct nmk_function nmk_stn8815_functions[] = {
 };
 
 static const struct nmk_pinctrl_soc_data nmk_stn8815_soc = {
-	.gpio_ranges = nmk_stn8815_ranges,
-	.gpio_num_ranges = ARRAY_SIZE(nmk_stn8815_ranges),
 	.pins = nmk_stn8815_pins,
 	.npins = ARRAY_SIZE(nmk_stn8815_pins),
 	.functions = nmk_stn8815_functions,
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index d1020256c999..3f53213cf89e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -2060,19 +2060,6 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
-	/*
-	 * We need all the GPIO drivers to probe FIRST, or we will not be able
-	 * to obtain references to the struct gpio_chip * for them, and we
-	 * need this to proceed.
-	 */
-	for (i = 0; i < npct->soc->gpio_num_ranges; i++) {
-		if (!nmk_gpio_chips[npct->soc->gpio_ranges[i].id]) {
-			dev_warn(&pdev->dev, "GPIO chip %d not registered yet\n", i);
-			return -EPROBE_DEFER;
-		}
-		npct->soc->gpio_ranges[i].gc = &nmk_gpio_chips[npct->soc->gpio_ranges[i].id]->chip;
-	}
-
 	nmk_pinctrl_desc.pins = npct->soc->pins;
 	nmk_pinctrl_desc.npins = npct->soc->npins;
 	npct->dev = &pdev->dev;
@@ -2083,10 +2070,6 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(npct->pctl);
 	}
 
-	/* We will handle a range of GPIO pins */
-	for (i = 0; i < npct->soc->gpio_num_ranges; i++)
-		pinctrl_add_gpio_range(npct->pctl, &npct->soc->gpio_ranges[i]);
-
 	platform_set_drvdata(pdev, npct);
 	dev_info(&pdev->dev, "initialized Nomadik pin control driver\n");
 
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.h b/drivers/pinctrl/nomadik/pinctrl-nomadik.h
index d8215f1e70c7..30bba2a75a58 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.h
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.h
@@ -121,8 +121,6 @@ struct nmk_pingroup {
 
 /**
  * struct nmk_pinctrl_soc_data - Nomadik pin controller per-SoC configuration
- * @gpio_ranges: An array of GPIO ranges for this SoC
- * @gpio_num_ranges: The number of GPIO ranges for this SoC
  * @pins:	An array describing all pins the pin controller affects.
  *		All pins which are also GPIOs must be listed first within the
  *		array, and be numbered identically to the GPIO controller's
@@ -137,8 +135,6 @@ struct nmk_pingroup {
  * @prcm_gpiocr_registers: The array of PRCM GPIOCR registers on this SoC
  */
 struct nmk_pinctrl_soc_data {
-	struct pinctrl_gpio_range *gpio_ranges;
-	unsigned gpio_num_ranges;
 	const struct pinctrl_pin_desc *pins;
 	unsigned npins;
 	const struct nmk_function *functions;
-- 
2.4.3

