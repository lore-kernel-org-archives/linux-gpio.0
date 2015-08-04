From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/6] ARM: shmobile: r8a7740 dtsi: Add missing "gpio-ranges" to gpio node
Date: Tue,  4 Aug 2015 15:55:15 +0200
Message-ID: <1438696519-13727-3-git-send-email-geert+renesas@glider.be>
References: <1438696519-13727-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:46635 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964970AbbHDNz0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2015 09:55:26 -0400
In-Reply-To: <1438696519-13727-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>

If a GPIO driver uses gpiochip_add_pin_range() (which is usually the
case for GPIO/PFC combos), the GPIO hogging mechanism configured from DT
doesn't work:

    requesting hog GPIO lcd0 (chip r8a7740_pfc, offset 176) failed

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
the range is added by of_gpiochip_add_pin_range(), which is called by
of_gpiochip_add() before the call to of_gpiochip_scan_hogs().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Acked-by.
---
 arch/arm/boot/dts/r8a7740.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index d84714468cce18df..e14cb1438216e8df 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -291,6 +291,7 @@
 		      <0xe605800c 0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-ranges = <&pfc 0 0 212>;
 		interrupts-extended =
 			<&irqpin0 0 0>, <&irqpin0 1 0>, <&irqpin0 2 0>, <&irqpin0 3 0>,
 			<&irqpin0 4 0>, <&irqpin0 5 0>, <&irqpin0 6 0>, <&irqpin0 7 0>,
-- 
1.9.1

