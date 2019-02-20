From: Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH v3 1/1] gpio: add driver for Mellanox BlueField GPIO controller
Date: Wed, 20 Feb 2019 17:00:49 -0500
Message-ID: <f6452e87ce2e1709e99b8f99cef1c49f0abfae0b.1550699918.git.sramani@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Shravan Kumar Ramani <sramani@mellanox.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patch adds support for the GPIO controller used by Mellanox
BlueField SOCs.

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Shravan Kumar Ramani <sramani@mellanox.com>
---
 drivers/gpio/Kconfig      |   6 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-mlxbf.c | 222 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 drivers/gpio/gpio-mlxbf.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b5a2845..c950fe8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1292,6 +1292,12 @@ config GPIO_MERRIFIELD
 	help
 	  Say Y here to support Intel Merrifield GPIO.
 
+config GPIO_MLXBF
+	tristate "Mellanox BlueField SoC GPIO"
+	depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || COMPILE_TEST
+	help
+	  Say Y here if you want GPIO support on Mellanox BlueField SoC.
+
 config GPIO_ML_IOH
 	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
 	depends on X86 || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 37628f8..8d54279 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_MENZ127)	+= gpio-menz127.o
 obj-$(CONFIG_GPIO_MERRIFIELD)	+= gpio-merrifield.o
 obj-$(CONFIG_GPIO_MC33880)	+= gpio-mc33880.o
 obj-$(CONFIG_GPIO_MC9S08DZ60)	+= gpio-mc9s08dz60.o
+obj-$(CONFIG_GPIO_MLXBF)	+= gpio-mlxbf.o
 obj-$(CONFIG_GPIO_ML_IOH)	+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)	+= gpio-mm-lantiq.o
 obj-$(CONFIG_GPIO_MOCKUP)      += gpio-mockup.o
diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
new file mode 100644
index 0000000..c0f21f4
--- /dev/null
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/resource.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/version.h>
+
+/* Number of pins on BlueField */
+#define MLXBF_GPIO_NR 54
+
+/* Pad Electrical Controls. */
+#define MLXBF_GPIO_PAD_CONTROL__FIRST_WORD 0x0700
+#define MLXBF_GPIO_PAD_CONTROL_1__FIRST_WORD 0x0708
+#define MLXBF_GPIO_PAD_CONTROL_2__FIRST_WORD 0x0710
+#define MLXBF_GPIO_PAD_CONTROL_3__FIRST_WORD 0x0718
+
+#define MLXBF_GPIO_PIN_DIR_I 0x1040
+#define MLXBF_GPIO_PIN_DIR_O 0x1048
+#define MLXBF_GPIO_PIN_STATE 0x1000
+#define MLXBF_GPIO_SCRATCHPAD 0x20
+
+#ifdef CONFIG_PM
+struct mlxbf_gpio_context_save_regs {
+	u64 scratchpad;
+	u64 pad_control[MLXBF_GPIO_NR];
+	u64 pin_dir_i;
+	u64 pin_dir_o;
+};
+#endif
+
+/* Device state structure. */
+struct mlxbf_gpio_state {
+	struct gpio_chip gc;
+
+	/* Must hold this lock to modify shared data. */
+	spinlock_t lock;
+
+	/* Memory Address */
+	void __iomem *dc_base;
+
+#ifdef CONFIG_PM
+	struct mlxbf_gpio_context_save_regs csave_regs;
+#endif
+};
+
+static int mlxbf_gpio_set_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
+	u64 in;
+	u64 out;
+
+	out = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
+	in = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
+
+	spin_lock(&gs->lock);
+	writeq(out & ~BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
+	writeq(in | BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
+	spin_unlock(&gs->lock);
+
+	return 0;
+}
+
+static int mlxbf_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
+				 int value)
+{
+	struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
+	u64 in;
+	u64 out;
+
+	out = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
+	in = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
+
+	spin_lock(&gs->lock);
+	writeq(out | BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
+	writeq(in & ~BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
+	spin_unlock(&gs->lock);
+
+	return 0;
+}
+
+static int mlxbf_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	u64 value;
+	struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
+
+	spin_lock(&gs->lock);
+	value = readq(gs->dc_base + MLXBF_GPIO_PIN_STATE);
+	spin_unlock(&gs->lock);
+
+	return (value >> offset) & 1;
+}
+
+static void mlxbf_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	u64 data;
+	struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
+
+	spin_lock(&gs->lock);
+	data = readq(gs->dc_base + MLXBF_GPIO_PIN_STATE);
+
+	if (value)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	writeq(data, gs->dc_base + MLXBF_GPIO_PIN_STATE);
+	spin_unlock(&gs->lock);
+}
+
+static int mlxbf_gpio_probe(struct platform_device *pdev)
+{
+	struct mlxbf_gpio_state *gs;
+	struct device *dev = &pdev->dev;
+	struct gpio_chip *gc;
+	struct resource *dc_res;
+	int ret;
+
+	gs = devm_kzalloc(&pdev->dev, sizeof(*gs), GFP_KERNEL);
+	if (!gs)
+		return -ENOMEM;
+
+	dc_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gs->dc_base = devm_ioremap_resource(&pdev->dev, dc_res);
+	if (IS_ERR(gs->dc_base))
+		return PTR_ERR(gs->dc_base);
+
+	gc = &gs->gc;
+	gc->direction_input = mlxbf_gpio_set_input;
+	gc->direction_output = mlxbf_gpio_set_output;
+	gc->get = mlxbf_gpio_get;
+	gc->set = mlxbf_gpio_set;
+	gc->label = dev_name(dev);
+	gc->parent = &pdev->dev;
+	gc->owner = THIS_MODULE;
+	gc->base = -1;
+	gc->ngpio = MLXBF_GPIO_NR;
+
+	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
+		return ret;
+	}
+
+	spin_lock_init(&gs->lock);
+	platform_set_drvdata(pdev, gs);
+	dev_info(&pdev->dev, "registered Mellanox BlueField GPIO");
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int mlxbf_gpio_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct mlxbf_gpio_state *gs = platform_get_drvdata(pdev);
+
+	gs->csave_regs.scratchpad = readq(gs->dc_base + MLXBF_GPIO_SCRATCHPAD);
+	gs->csave_regs.pad_control[0] =
+		readq(gs->dc_base + MLXBF_GPIO_PAD_CONTROL__FIRST_WORD);
+	gs->csave_regs.pad_control[1] =
+		readq(gs->dc_base + MLXBF_GPIO_PAD_CONTROL_1__FIRST_WORD);
+	gs->csave_regs.pad_control[2] =
+		readq(gs->dc_base + MLXBF_GPIO_PAD_CONTROL_2__FIRST_WORD);
+	gs->csave_regs.pad_control[3] =
+		readq(gs->dc_base + MLXBF_GPIO_PAD_CONTROL_3__FIRST_WORD);
+	gs->csave_regs.pin_dir_i = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
+	gs->csave_regs.pin_dir_o = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
+
+	return 0;
+}
+
+static int mlxbf_gpio_resume(struct platform_device *pdev)
+{
+	struct mlxbf_gpio_state *gs = platform_get_drvdata(pdev);
+
+	writeq(gs->csave_regs.scratchpad, gs->dc_base + MLXBF_GPIO_SCRATCHPAD);
+	writeq(gs->csave_regs.pad_control[0],
+	       gs->dc_base + MLXBF_GPIO_PAD_CONTROL__FIRST_WORD);
+	writeq(gs->csave_regs.pad_control[1],
+	       gs->dc_base + MLXBF_GPIO_PAD_CONTROL_1__FIRST_WORD);
+	writeq(gs->csave_regs.pad_control[2],
+	       gs->dc_base + MLXBF_GPIO_PAD_CONTROL_2__FIRST_WORD);
+	writeq(gs->csave_regs.pad_control[3],
+	       gs->dc_base + MLXBF_GPIO_PAD_CONTROL_3__FIRST_WORD);
+	writeq(gs->csave_regs.pin_dir_i, gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
+	writeq(gs->csave_regs.pin_dir_o, gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
+
+	return 0;
+}
+#endif
+
+static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
+	{ "MLNXBF02", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mlxbf_gpio_acpi_match);
+
+static struct platform_driver mlxbf_gpio_driver = {
+	.driver = {
+		.name = "mlxbf_gpio",
+		.acpi_match_table = ACPI_PTR(mlxbf_gpio_acpi_match),
+	},
+	.probe    = mlxbf_gpio_probe,
+#ifdef CONFIG_PM
+	.suspend  = mlxbf_gpio_suspend,
+	.resume   = mlxbf_gpio_resume,
+#endif
+};
+
+module_platform_driver(mlxbf_gpio_driver);
+
+MODULE_DESCRIPTION("Mellanox BlueField GPIO Driver");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_LICENSE("GPL");
-- 
2.1.2
