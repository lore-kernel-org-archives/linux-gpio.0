From: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
Subject: [PATCH 2/2] pinctrl: sunxi: Change mux setting on PI
 irq pins
Date: Mon, 29 Feb 2016 00:13:27 +0100
Message-ID: <bd99b2fb93c4c7da52ceb70a43dafded76fff974.1456698862.git.henry@nitronetworks.nl>
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
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

While I was testing irq's on the cubietruck I found a couple of
not working irq pins. Further diving into the problem it opened
up a mess called "manual".

This so called manual (A20 user manual v1.3 dated 2014-10-10) says:

Pin overview:
    Page 237:       EINT26 is on mux 5.
    Page 288:       EINT26 is on mux 6.

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

Hardware used:
Henry Paulissen: Cubietruck
Andere Przywara: BananaPi M1

Tested-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Reviewed-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
index 25748b4..435ad30 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
@@ -956,65 +956,65 @@ static const struct sunxi_desc_pin sun7i_a20_pins[] = {
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi0"),		/* CS0 */
 		  SUNXI_FUNCTION(0x3, "uart5"),		/* TX */
-		  SUNXI_FUNCTION_IRQ(0x5, 22)),		/* EINT22 */
+		  SUNXI_FUNCTION_IRQ(0x6, 22)),		/* EINT22 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi0"),		/* CLK */
 		  SUNXI_FUNCTION(0x3, "uart5"),		/* RX */
-		  SUNXI_FUNCTION_IRQ(0x5, 23)),		/* EINT23 */
+		  SUNXI_FUNCTION_IRQ(0x6, 23)),		/* EINT23 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 12),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi0"),		/* MOSI */
 		  SUNXI_FUNCTION(0x3, "uart6"),		/* TX */
 		  SUNXI_FUNCTION(0x4, "clk_out_a"),	/* CLK_OUT_A */
-		  SUNXI_FUNCTION_IRQ(0x5, 24)),		/* EINT24 */
+		  SUNXI_FUNCTION_IRQ(0x6, 24)),		/* EINT24 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 13),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi0"),		/* MISO */
 		  SUNXI_FUNCTION(0x3, "uart6"),		/* RX */
 		  SUNXI_FUNCTION(0x4, "clk_out_b"),	/* CLK_OUT_B */
-		  SUNXI_FUNCTION_IRQ(0x5, 25)),		/* EINT25 */
+		  SUNXI_FUNCTION_IRQ(0x6, 25)),		/* EINT25 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi0"),		/* CS1 */
 		  SUNXI_FUNCTION(0x3, "ps2"),		/* SCK1 */
 		  SUNXI_FUNCTION(0x4, "timer4"),	/* TCLKIN0 */
-		  SUNXI_FUNCTION_IRQ(0x5, 26)),		/* EINT26 */
+		  SUNXI_FUNCTION_IRQ(0x6, 26)),		/* EINT26 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi1"),		/* CS1 */
 		  SUNXI_FUNCTION(0x3, "ps2"),		/* SDA1 */
 		  SUNXI_FUNCTION(0x4, "timer5"),	/* TCLKIN1 */
-		  SUNXI_FUNCTION_IRQ(0x5, 27)),		/* EINT27 */
+		  SUNXI_FUNCTION_IRQ(0x6, 27)),		/* EINT27 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi1"),		/* CS0 */
 		  SUNXI_FUNCTION(0x3, "uart2"),		/* RTS */
-		  SUNXI_FUNCTION_IRQ(0x5, 28)),		/* EINT28 */
+		  SUNXI_FUNCTION_IRQ(0x6, 28)),		/* EINT28 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi1"),		/* CLK */
 		  SUNXI_FUNCTION(0x3, "uart2"),		/* CTS */
-		  SUNXI_FUNCTION_IRQ(0x5, 29)),		/* EINT29 */
+		  SUNXI_FUNCTION_IRQ(0x6, 29)),		/* EINT29 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi1"),		/* MOSI */
 		  SUNXI_FUNCTION(0x3, "uart2"),		/* TX */
-		  SUNXI_FUNCTION_IRQ(0x5, 30)),		/* EINT30 */
+		  SUNXI_FUNCTION_IRQ(0x6, 30)),		/* EINT30 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "spi1"),		/* MISO */
 		  SUNXI_FUNCTION(0x3, "uart2"),		/* RX */
-		  SUNXI_FUNCTION_IRQ(0x5, 31)),		/* EINT31 */
+		  SUNXI_FUNCTION_IRQ(0x6, 31)),		/* EINT31 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 20),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-- 
2.5.0
