From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: [PATCH 2/2] gpio: add TS-4800 fpga GPIO support
Date: Wed, 13 Jan 2016 11:57:43 -0500
Message-ID: <1452704263-16763-2-git-send-email-julien.grossholtz@savoirfairelinux.com>
References: <1452704263-16763-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452704263-16763-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com, Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

The TS-4800 GPIO driver provide support for the GPIOs available
on the Technologic Sytems board FPGA. It allows to set
direction and read/write states.

It uses the generic gpio driver.

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
 drivers/gpio/Kconfig       |  7 ++++
 drivers/gpio/Makefile      |  1 +
 drivers/gpio/gpio-ts4800.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/gpio/gpio-ts4800.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b60f40a..1159abe 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -387,6 +387,13 @@ config GPIO_TB10X
 	select GENERIC_IRQ_CHIP
 	select OF_GPIO
 
+config GPIO_TS4800
+	tristate "TS-4800 DIO blocks and compatibles"
+	depends on OF_GPIO
+	select GPIO_GENERIC
+	help
+	  This driver support TS-4800 FPGA GPIO controllers.
+
 config GPIO_TZ1090
 	bool "Toumaz Xenif TZ1090 GPIO support"
 	depends on SOC_TZ1090
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 548e9b5..4d8daac 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
 obj-$(CONFIG_GPIO_TPS6586X)	+= gpio-tps6586x.o
 obj-$(CONFIG_GPIO_TPS65910)	+= gpio-tps65910.o
 obj-$(CONFIG_GPIO_TPS65912)	+= gpio-tps65912.o
+obj-$(CONFIG_GPIO_TS4800)	+= gpio-ts4800.o
 obj-$(CONFIG_GPIO_TS5500)	+= gpio-ts5500.o
 obj-$(CONFIG_GPIO_TWL4030)	+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)	+= gpio-twl6040.o
diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
new file mode 100644
index 0000000..c4908a4
--- /dev/null
+++ b/drivers/gpio/gpio-ts4800.c
@@ -0,0 +1,94 @@
+/*
+ * GPIO driver for the TS-4800 board
+ *
+ * Copyright (c) 2016 - Savoir-faire Linux
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#define DEFAULT_PIN_NUMBER      16
+#define INPUT_REG_OFFSET        0x00
+#define OUTPUT_REG_OFFSET       0x02
+#define DIRECTION_REG_OFFSET    0x04
+
+static int ts4800_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *node;
+	struct gpio_chip *chip;
+	struct resource *res;
+	void __iomem *base_addr;
+	int retval;
+	u32 ngpios;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(struct gpio_chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base_addr))
+		return PTR_ERR(base_addr);
+
+	node = pdev->dev.of_node;
+	if (!node)
+		return -EINVAL;
+
+	retval = of_property_read_u32(node, "ngpios", &ngpios);
+	if (retval == -EINVAL)
+		ngpios = DEFAULT_PIN_NUMBER;
+	else if (retval)
+		return retval;
+
+	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
+			    base_addr + OUTPUT_REG_OFFSET, NULL,
+			    base_addr + DIRECTION_REG_OFFSET, NULL,
+			    BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	if (retval) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return retval;
+	}
+
+	chip->base = -1;
+	chip->label = dev_name(&pdev->dev);
+	chip->ngpio = ngpios;
+
+	platform_set_drvdata(pdev, chip);
+
+	return gpiochip_add_data(chip, NULL);
+}
+
+static int ts4800_gpio_remove(struct platform_device *pdev)
+{
+	struct gpio_chip *chip = platform_get_drvdata(pdev);
+
+	gpiochip_remove(chip);
+
+	return 0;
+}
+
+static const struct of_device_id ts4800_gpio_of_match[] = {
+	{ .compatible = "technologic,ts4800-gpio", },
+	{},
+};
+
+static struct platform_driver ts4800_gpio_driver = {
+	.driver = {
+		   .name = "ts4800-gpio",
+		   .of_match_table = ts4800_gpio_of_match,
+		   },
+	.probe = ts4800_gpio_probe,
+	.remove = ts4800_gpio_remove,
+};
+
+module_platform_driver_probe(ts4800_gpio_driver, ts4800_gpio_probe);
+
+MODULE_AUTHOR("Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>");
+MODULE_DESCRIPTION("TS4800 FPGA GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.5.0
