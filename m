From: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: sunxi: Remove non existing irq's
Date: Mon, 29 Feb 2016 00:13:26 +0100
Message-ID: <bd43820c6708d57ff2997dccd588faa28da11990.1456698862.git.henry@nitronetworks.nl>
References: <cover.1456698862.git.henry@nitronetworks.nl>
Reply-To: henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJ57UPZYEDRBHP6ZW3AKGQEZZ4BAJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <cover.1456698862.git.henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

While I was testing irq's on the cubietruck I found a couple of
not working irq pins. Further diving into the problem it opened
up a mess called "manual".

This so called manual (A20 user manual v1.3 dated 2014-10-10) says:

Pin overview:
    Page 233:       EINT12 is on pin PC19 mux6.
    Page 236:       EINT12 is on pin PH12 mux6.

Now, it is a bit strange to have the same IRQ on 2 different pins,
but I guess this could still be possible hardware wise. But then:

Pin registers:
    Page 253:       EINT12 is *not* on pin PC19.
    Page 281:       EINT12 is on pin PH12.

The manual is so contradicting that further tests had to be made
to see which of the 2 statements where correct.

This patch is based on actual outcome of these tests and not what
the manual says.

Test procedure used:

Connect a 1 pulse per second (GPS) line to the pin.

echo pin### > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio###/direction
echo rising > /sys/class/gpio/gpio###/edge

Check /proc/interrupts if a irq was attached and if irq's where
received.

Signed-off-by: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
index cf1ce0c..25748b4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
@@ -343,26 +343,22 @@ static const struct sunxi_desc_pin sun7i_a20_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE4 */
-		  SUNXI_FUNCTION(0x3, "spi2"),		/* CS0 */
-		  SUNXI_FUNCTION_IRQ(0x6, 12)),		/* EINT12 */
+		  SUNXI_FUNCTION(0x3, "spi2")),		/* CS0 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 20),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE5 */
-		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
-		  SUNXI_FUNCTION_IRQ(0x6, 13)),		/* EINT13 */
+		  SUNXI_FUNCTION(0x3, "spi2")),		/* CLK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 21),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE6 */
-		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
-		  SUNXI_FUNCTION_IRQ(0x6, 14)),		/* EINT14 */
+		  SUNXI_FUNCTION(0x3, "spi2")),		/* MOSI */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 22),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE7 */
-		  SUNXI_FUNCTION(0x3, "spi2"),		/* MISO */
-		  SUNXI_FUNCTION_IRQ(0x6, 15)),		/* EINT15 */
+		  SUNXI_FUNCTION(0x3, "spi2")),		/* MISO */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 23),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-- 
2.5.0
