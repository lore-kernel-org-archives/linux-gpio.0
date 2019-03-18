From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] pinctrl: sunxi: Allow to disable pinctrl drivers
Date: Mon, 18 Mar 2019 11:27:28 +0100
Message-ID: <20190318102728.9753-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Our pinctrl drivers are consisting of some common code, and big pin tables
that are SoC-specific. This is fine in most cases, but when you want to
reduce the size of the particular kernel image, those big tables are, well,
quite big.

We haven't had the option to disable them in the past since they were
hidden Kconfig options based on the SoC support. However, that granularity
isn't great since we don't have one Kconfig option per-SoC, but rather one
by family.

Make those options selectable by the user so that they can disable it if
needed, while keeping the current default to not change the standard case.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/pinctrl/sunxi/Kconfig | 57 +++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index a731fc966b63..68df7aa56478 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -11,82 +11,101 @@ config PINCTRL_SUNIV_F1C100S
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN4I_A10
-	def_bool MACH_SUN4I || MACH_SUN7I || MACH_SUN8I
+	bool "Support for the Allwinner A10 PIO"
+	default MACH_SUN4I || MACH_SUN7I || MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN5I
-	def_bool MACH_SUN5I
+	bool "Support for the Allwinner sun5i family PIO"
+	default MACH_SUN5I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN6I_A31
-	def_bool MACH_SUN6I
+	bool "Support for the Allwinner A31 PIO"
+	default MACH_SUN6I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN6I_A31_R
-	def_bool MACH_SUN6I
+	bool "Support for the Allwinner A31 R-PIO"
+	default MACH_SUN6I
 	depends on RESET_CONTROLLER
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_A23
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner A23 PIO"
+	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_A33
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner A33 PIO"
+	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_A83T
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner A83T PIO"
+	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_A83T_R
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner A83T R-PIO"
+	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_A23_R
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner A23 R-PIO"
+	default MACH_SUN8I
 	depends on RESET_CONTROLLER
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_H3
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner H3 PIO"
+	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_H3_R
-	def_bool MACH_SUN8I || (ARM64 && ARCH_SUNXI)
+	bool "Support for the Allwinner H3 R-PIO"
+	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_V3S
-	def_bool MACH_SUN8I
+	bool "Support for the Allwinner V3s PIO"
+	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN9I_A80
-	def_bool MACH_SUN9I
+	bool "Support for the Allwinner A80 PIO"
+	default MACH_SUN9I
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN9I_A80_R
-	def_bool MACH_SUN9I
+	bool "Support for the Allwinner A80 R-PIO"
+	default MACH_SUN9I
 	depends on RESET_CONTROLLER
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_A64
-	def_bool ARM64 && ARCH_SUNXI
+	bool "Support for the Allwinner A64 PIO"
+	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_A64_R
-	def_bool ARM64 && ARCH_SUNXI
+	bool "Support for the Allwinner A64 R-PIO"
+	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_H5
-	def_bool ARM64 && ARCH_SUNXI
+	bool "Support for the Allwinner H5 PIO"
+	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_H6
-	def_bool ARM64 && ARCH_SUNXI
+	bool "Support for the Allwinner H6 PIO"
+	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_H6_R
-	def_bool ARM64 && ARCH_SUNXI
+	bool "Support for the Allwinner H6 R-PIO"
+	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 endif
-- 
2.20.1
