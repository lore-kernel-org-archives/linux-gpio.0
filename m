From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] ARM: shmobile: sh73a0 dtsi: Add missing "gpio-ranges" to gpio node
Date: Tue, 30 Jun 2015 09:45:23 +0200
Message-ID: <1435650327-2542-4-git-send-email-geert+renesas@glider.be>
References: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

If a GPIO driver uses gpiochip_add_pin_range() (which is usually the
case for GPIO/PFC combos), the GPIO hogging mechanism configured from DT
doesn't work:

    requesting hog GPIO led1-high (chip sh73a0_pfc, offset 20) failed

The actual error code is -517 == -EPROBE_DEFER.

The problem is that PFC+GPIO registration is handled in multiple steps:
  1. pinctrl_register(),
  2. gpiochip_add(),
  3. gpiochip_add_pin_range().

Configuration of the hogs is handled in gpiochip_add():

    gpiochip_add
        of_gpiochip_add
            of_gpiochip_scan_hogs
                gpiod_hog
                    gpiochip_request_own_desc
                        __gpiod_request
                            chip->request
                                pinctrl_request_gpio
                                    pinctrl_get_device_gpio_range

However, at this point the GPIO controller hasn't been added to
pinctrldev_list yet, so the range can't be found, and the operation fails
with -EPROBE_DEFER.

To fix this, add a "gpio-ranges" property to the gpio device node, so
the ranges are added by of_gpiochip_add_pin_range(), which is called by
of_gpiochip_add() before the call to of_gpiochip_scan_hogs().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 11e17c5f26e2cae2..ff7c8f298f30a58d 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -392,6 +392,9 @@
 		      <0xe605801c 0x1c>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-ranges =
+			<&pfc 0 0 119>, <&pfc 128 128 37>, <&pfc 192 192 91>,
+			<&pfc 288 288 22>;
 		interrupts-extended =
 			<&irqpin0 0 0>, <&irqpin0 1 0>, <&irqpin0 2 0>, <&irqpin0 3 0>,
 			<&irqpin0 4 0>, <&irqpin0 5 0>, <&irqpin0 6 0>, <&irqpin0 7 0>,
-- 
1.9.1

