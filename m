From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/2] MIPS: ath79: Remove the unused GPIO function API
Date: Fri,  3 Jul 2015 11:11:48 +0200
Message-ID: <1435914709-15092-2-git-send-email-albeu@free.fr>
References: <1435914709-15092-1-git-send-email-albeu@free.fr>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1435914709-15092-1-git-send-email-albeu@free.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-gpio@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>
List-Id: linux-gpio@vger.kernel.org

To prepare moving the GPIO driver to drivers/gpio remove the
platform specific pinmux API. As it is not used by any board,
and such functionality should better be implemented using the
pinmux subsystem just removing it seems to be the best option.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 arch/mips/ath79/common.h |  3 ---
 arch/mips/ath79/gpio.c   | 43 -------------------------------------------
 2 files changed, 46 deletions(-)

diff --git a/arch/mips/ath79/common.h b/arch/mips/ath79/common.h
index e5ea712..ca7cc19 100644
--- a/arch/mips/ath79/common.h
+++ b/arch/mips/ath79/common.h
@@ -25,9 +25,6 @@ unsigned long ath79_get_sys_clk_rate(const char *id);
 void ath79_ddr_ctrl_init(void);
 void ath79_ddr_wb_flush(unsigned int reg);
 
-void ath79_gpio_function_enable(u32 mask);
-void ath79_gpio_function_disable(u32 mask);
-void ath79_gpio_function_setup(u32 set, u32 clear);
 void ath79_gpio_init(void);
 
 #endif /* __ATH79_COMMON_H */
diff --git a/arch/mips/ath79/gpio.c b/arch/mips/ath79/gpio.c
index f59ccb2..c3c92eb 100644
--- a/arch/mips/ath79/gpio.c
+++ b/arch/mips/ath79/gpio.c
@@ -24,8 +24,6 @@
 #include <linux/of_device.h>
 
 #include <asm/mach-ath79/ar71xx_regs.h>
-#include <asm/mach-ath79/ath79.h>
-#include "common.h"
 
 static void __iomem *ath79_gpio_base;
 static u32 ath79_gpio_count;
@@ -139,47 +137,6 @@ static struct gpio_chip ath79_gpio_chip = {
 	.base			= 0,
 };
 
-static void __iomem *ath79_gpio_get_function_reg(void)
-{
-	u32 reg = 0;
-
-	if (soc_is_ar71xx() ||
-	    soc_is_ar724x() ||
-	    soc_is_ar913x() ||
-	    soc_is_ar933x())
-		reg = AR71XX_GPIO_REG_FUNC;
-	else if (soc_is_ar934x())
-		reg = AR934X_GPIO_REG_FUNC;
-	else
-		BUG();
-
-	return ath79_gpio_base + reg;
-}
-
-void ath79_gpio_function_setup(u32 set, u32 clear)
-{
-	void __iomem *reg = ath79_gpio_get_function_reg();
-	unsigned long flags;
-
-	spin_lock_irqsave(&ath79_gpio_lock, flags);
-
-	__raw_writel((__raw_readl(reg) & ~clear) | set, reg);
-	/* flush write */
-	__raw_readl(reg);
-
-	spin_unlock_irqrestore(&ath79_gpio_lock, flags);
-}
-
-void ath79_gpio_function_enable(u32 mask)
-{
-	ath79_gpio_function_setup(mask, 0);
-}
-
-void ath79_gpio_function_disable(u32 mask)
-{
-	ath79_gpio_function_setup(0, mask);
-}
-
 static const struct of_device_id ath79_gpio_of_match[] = {
 	{ .compatible = "qca,ar7100-gpio" },
 	{ .compatible = "qca,ar9340-gpio" },
-- 
2.0.0
