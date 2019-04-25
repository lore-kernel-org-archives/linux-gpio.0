From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [RFC PATCH 3/3] gpio: mb86s70: enable ACPI and irqchip support
Date: Thu, 25 Apr 2019 12:20:20 +0200
Message-ID: <20190425102020.21533-4-ard.biesheuvel@linaro.org>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Graeme Gregory <graeme.gregory@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Masahisa Kojima <masahisa.kojima@linaro.org>
List-Id: linux-gpio@vger.kernel.org

In order to support this GPIO block in combination with an EXIU
interrupt controller on ACPI systems such as Socionext SynQuacer,
add the enumeration boilerplate, and add the EXIU irqchip handling
to the probe path. Also, make the clock handling conditonal on
non-ACPI enumeration, since ACPI handles this internally.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/gpio/Kconfig        |  4 ++
 drivers/gpio/gpio-mb86s7x.c | 58 +++++++++++++++++---
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3f50526a771f..2c2773ea9627 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -315,6 +315,10 @@ config GPIO_MB86S7X
 	help
 	  Say yes here to support the GPIO controller in Fujitsu MB86S70 SoCs.
 
+config GPIO_MB86S7X_ACPI
+	def_bool y
+	depends on ACPI && ARCH_SYNQUACER
+
 config GPIO_MENZ127
 	tristate "MEN 16Z127 GPIO support"
 	depends on MCB
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 3134c0d2bfe4..d254783f7e71 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -14,6 +14,7 @@
  *  GNU General Public License for more details.
  */
 
+#include <linux/acpi.h>
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/clk.h>
@@ -27,6 +28,8 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 
+#include "gpiolib.h"
+
 /*
  * Only first 8bits of a register correspond to each pin,
  * so there are 4 registers for 32 pins.
@@ -44,6 +47,8 @@ struct mb86s70_gpio_chip {
 	spinlock_t lock;
 };
 
+int exiu_acpi_init(struct platform_device *pdev, struct gpio_chip *gc);
+
 static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
 {
 	struct mb86s70_gpio_chip *gchip = gpiochip_get_data(gc);
@@ -143,6 +148,12 @@ static void mb86s70_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
 	spin_unlock_irqrestore(&gchip->lock, flags);
 }
 
+static bool mb86s70_gpio_have_acpi(struct platform_device *pdev)
+{
+	return IS_ENABLED(CONFIG_GPIO_MB86S7X_ACPI) &&
+	       ACPI_COMPANION(&pdev->dev);
+}
+
 static int mb86s70_gpio_probe(struct platform_device *pdev)
 {
 	struct mb86s70_gpio_chip *gchip;
@@ -160,13 +171,15 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gchip->base))
 		return PTR_ERR(gchip->base);
 
-	gchip->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(gchip->clk))
-		return PTR_ERR(gchip->clk);
+	if (!mb86s70_gpio_have_acpi(pdev)) {
+		gchip->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(gchip->clk))
+			return PTR_ERR(gchip->clk);
 
-	ret = clk_prepare_enable(gchip->clk);
-	if (ret)
-		return ret;
+		ret = clk_prepare_enable(gchip->clk);
+		if (ret)
+			return ret;
+	}
 
 	spin_lock_init(&gchip->lock);
 
@@ -182,21 +195,39 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	gchip->gc.parent = &pdev->dev;
 	gchip->gc.base = -1;
 
+	if (mb86s70_gpio_have_acpi(pdev)) {
+		ret = exiu_acpi_init(pdev, &gchip->gc);
+		if (ret) {
+			dev_err(&pdev->dev, "couldn't register gpio irqchip\n");
+			return ret;
+		}
+	}
+
 	ret = gpiochip_add_data(&gchip->gc, gchip);
 	if (ret) {
 		dev_err(&pdev->dev, "couldn't register gpio driver\n");
-		clk_disable_unprepare(gchip->clk);
+		if (gchip->clk)
+			clk_disable_unprepare(gchip->clk);
+		return ret;
 	}
 
-	return ret;
+	if (mb86s70_gpio_have_acpi(pdev))
+		acpi_gpiochip_request_interrupts(&gchip->gc);
+
+	return 0;
 }
 
 static int mb86s70_gpio_remove(struct platform_device *pdev)
 {
 	struct mb86s70_gpio_chip *gchip = platform_get_drvdata(pdev);
 
+	if (gchip->gc.irq.domain) {
+		acpi_gpiochip_free_interrupts(&gchip->gc);
+		irq_domain_remove(gchip->gc.irq.domain);
+	}
 	gpiochip_remove(&gchip->gc);
-	clk_disable_unprepare(gchip->clk);
+	if (gchip->clk)
+		clk_disable_unprepare(gchip->clk);
 
 	return 0;
 }
@@ -207,10 +238,19 @@ static const struct of_device_id mb86s70_gpio_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mb86s70_gpio_dt_ids);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id mb86s70_gpio_acpi_ids[] = {
+	{ "SCX0007" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, mb86s70_gpio_acpi_ids);
+#endif
+
 static struct platform_driver mb86s70_gpio_driver = {
 	.driver = {
 		.name = "mb86s70-gpio",
 		.of_match_table = mb86s70_gpio_dt_ids,
+		.acpi_match_table = ACPI_PTR(mb86s70_gpio_acpi_ids),
 	},
 	.probe = mb86s70_gpio_probe,
 	.remove = mb86s70_gpio_remove,
-- 
2.20.1
