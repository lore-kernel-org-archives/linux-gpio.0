From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 1/6] gpio: mvebu: checkpatch: block comment fixes
Date: Thu, 16 Mar 2017 07:33:56 +0100
Message-ID: <20170316063402.8667-2-ralph.sennhauser@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Fix issues in block comments reported by checkpatch.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a649556..a2351f3 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -62,9 +62,11 @@
 #define GPIO_EDGE_MASK_MV78200_OFF(cpu)	  ((cpu) ? 0x30 : 0x18)
 #define GPIO_LEVEL_MASK_MV78200_OFF(cpu)  ((cpu) ? 0x34 : 0x1C)
 
-/* The Armada XP has per-CPU registers for interrupt cause, interrupt
+/*
+ * The Armada XP has per-CPU registers for interrupt cause, interrupt
  * mask and interrupt level mask. Those are relative to the
- * percpu_membase. */
+ * percpu_membase.
+ */
 #define GPIO_EDGE_CAUSE_ARMADAXP_OFF(cpu) ((cpu) * 0x4)
 #define GPIO_EDGE_MASK_ARMADAXP_OFF(cpu)  (0x10 + (cpu) * 0x4)
 #define GPIO_LEVEL_MASK_ARMADAXP_OFF(cpu) (0x20 + (cpu) * 0x4)
@@ -239,8 +241,10 @@ static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
 	int ret;
 	u32 u;
 
-	/* Check with the pinctrl driver whether this pin is usable as
-	 * an input GPIO */
+	/*
+	 * Check with the pinctrl driver whether this pin is usable as
+	 * an input GPIO
+	 */
 	ret = pinctrl_gpio_direction_input(chip->base + pin);
 	if (ret)
 		return ret;
@@ -262,8 +266,10 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned pin,
 	int ret;
 	u32 u;
 
-	/* Check with the pinctrl driver whether this pin is usable as
-	 * an output GPIO */
+	/*
+	 * Check with the pinctrl driver whether this pin is usable as
+	 * an output GPIO
+	 */
 	ret = pinctrl_gpio_direction_output(chip->base + pin);
 	if (ret)
 		return ret;
@@ -712,8 +718,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(mvchip->membase))
 		return PTR_ERR(mvchip->membase);
 
-	/* The Armada XP has a second range of registers for the
-	 * per-CPU registers */
+	/*
+	 * The Armada XP has a second range of registers for the
+	 * per-CPU registers
+	 */
 	if (soc_variant == MVEBU_GPIO_SOC_VARIANT_ARMADAXP) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		mvchip->percpu_membase = devm_ioremap_resource(&pdev->dev,
-- 
2.10.2
