From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: sunxi: a64: Rename function csi0
 to csi
Date: Mon,  3 Dec 2018 23:40:59 +0800
Message-ID: <20181203154100.4280-2-wens@csie.org>
References: <20181203154100.4280-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBD45SXQAKGQEE5R53DY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181203154100.4280-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

The A64 only has one CSI (camera sensor interface) controller. The
datasheet also lists the function as CSI_XXX instead of CSI0_XXX.

Rename the function names now before any there are any users.

Fixes: 96851d391d02 ("drivers: pinctrl: add driver for Allwinner A64 SoC")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
index f5f77432ce6f..8b974b2a2486 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
@@ -323,71 +323,71 @@ static const struct sunxi_desc_pin a64_pins[] = {
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* PCK */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* PCK */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* CLK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 1),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* CK */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* CK */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* ERR */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 2),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* HSYNC */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* HSYNC */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* SYNC */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 3),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* VSYNC */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* VSYNC */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* DVLD */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 4),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D0 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D0 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D0 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 5),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D1 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D1 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D1 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 6),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D2 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D2 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D2 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 7),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D3 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D3 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D3 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 8),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D4 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D4 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D4 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 9),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D5 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D5 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D5 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D6 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D6 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D6 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0"),		/* D7 */
+		  SUNXI_FUNCTION(0x2, "csi"),		/* D7 */
 		  SUNXI_FUNCTION(0x4, "ts0")),		/* D7 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 12),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0")),		/* SCK */
+		  SUNXI_FUNCTION(0x2, "csi")),		/* SCK */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 13),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-		  SUNXI_FUNCTION(0x2, "csi0")),		/* SDA */
+		  SUNXI_FUNCTION(0x2, "csi")),		/* SDA */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
-- 
2.20.0.rc1
