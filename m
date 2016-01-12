From: Peter Hung <hpeter@gmail.com>
Subject: [PATCH 2/2] gpio-f7188x: filter non-export gpio for F81866
Date: Tue, 12 Jan 2016 15:41:39 +0800
Message-ID: <1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
References: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Dont export gpios which not enabled by motherboard manufacturer.

Signed-off-by: Peter Hung <hpeter+linux_kernel@gmail.com>
---
 drivers/gpio/gpio-f7188x.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index a6a9641..f7fe7aa 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -38,6 +38,12 @@
 #define SIO_F71889_ID		0x0909	/* F71889 chipset ID */
 #define SIO_F81866_ID		0x1010	/* F81866 chipset ID */
 
+#define F81866_PORT_SEL_REG	0x27
+#define F81866_MULTI_FUN1_REG	0x28
+#define F81866_MULTI_FUN3_REG	0x29
+#define F81866_MULTI_FUN4_REG	0x2B
+#define F81866_GPIO_EN_REG	0x2C
+
 enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
 
 static const char * const f7188x_names[] = {
@@ -93,6 +99,15 @@ static inline void superio_outb(int base, int reg, int val)
 	outb(val, base + 1);
 }
 
+static inline void superio_mask_outb(int base, int reg, int mask, int val)
+{
+	u8 tmp;
+
+	tmp = superio_inb(base, reg);
+	tmp = (tmp & ~mask) | (val & mask);
+	superio_outb(base, reg, tmp);
+}
+
 static inline int superio_enter(int base)
 {
 	/* Don't step on other drivers' I/O space by accident. */
@@ -304,6 +319,125 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	superio_exit(sio->addr);
 }
 
+static int f81866_verify_gpioset(int base, int set)
+{
+	int err;
+	u8 tmp;
+
+	err = superio_enter(base);
+	if (err)
+		return err;
+
+	err = -ENODEV;
+
+	switch (set) {
+	case 0:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
+				BIT(0), 0);
+		tmp = superio_inb(base, F81866_GPIO_EN_REG);
+		if ((tmp & 0x1f) != 0x1f)
+			break; /* one in GPIO00~GPIO04 is not enable */
+
+		tmp = superio_inb(base, F81866_MULTI_FUN1_REG);
+		if ((tmp & 0xc) != 0x0)
+			break;
+
+		err = 0; /* GPIO0x set is all enabled */
+		break;
+	case 1:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
+				BIT(0), BIT(2));
+		tmp = superio_inb(base, F81866_GPIO_EN_REG);
+		if ((tmp & 0xef) != 0xef)
+			break; /* one in GPIO10~GPIO17 is not enable */
+
+		tmp = superio_inb(base, F81866_MULTI_FUN3_REG);
+		if ((tmp & 0x03) != 0x00)
+			break; /* one in GPIO12~GPIO13 is not enable */
+
+		err = 0; /* GPIO1x set is all enabled */
+		break;
+	case 2:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
+				BIT(0), BIT(3));
+		tmp = superio_inb(base, F81866_GPIO_EN_REG);
+		if ((tmp & 0xff) != 0xff)
+			break; /* one in GPIO20~GPIO27 is not enable */
+
+		tmp = superio_inb(base, F81866_MULTI_FUN3_REG);
+		if ((tmp & 0x08) != 0x00)
+			break; /* GPIO20 is not enable */
+
+		err = 0; /* GPIO2x set is all enabled */
+		break;
+	case 3:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(0), 0);
+		tmp = superio_inb(base, F81866_MULTI_FUN3_REG);
+		if ((tmp & 0x30) != 0x00)
+			break; /* GPIO3x is not enable */
+
+		err = 0; /* GPIO3x set is all enabled */
+		break;
+	case 4:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(0), 0);
+		tmp = superio_inb(base, F81866_MULTI_FUN3_REG);
+		if ((tmp & 0xc0) != 0x00)
+			break; /* GPIO4x is not enable */
+
+		err = 0; /* GPIO4x set is all enabled */
+		break;
+	case 5:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2),
+				0);
+		tmp = superio_inb(base, F81866_MULTI_FUN1_REG);
+		if ((tmp & 0x43) != 0x40)
+			break; /* GPIO5x is not enable */
+
+		err = 0; /* GPIO5x set is all enabled */
+		break;
+	case 6:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
+				BIT(0), 0);
+		tmp = superio_inb(base, F81866_MULTI_FUN1_REG);
+		if ((tmp & 0x4c) != 0x40)
+			break; /* GPIO60~64 is not enable */
+
+		tmp = superio_inb(base, F81866_MULTI_FUN4_REG);
+		if ((tmp & 0xe0) != 0xe0)
+			break; /* GPIO65~67 is not enable */
+
+		err = 0; /* GPIO6x set is all enabled */
+		break;
+	case 7:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2) |
+				BIT(0), 0);
+		tmp = superio_inb(base, F81866_MULTI_FUN1_REG);
+		if ((tmp & 0x20) != 0x20)
+			break; /* GPIO7x is not enable */
+
+		tmp = superio_inb(base, F81866_MULTI_FUN4_REG);
+		if ((tmp & 0x01) != 0x00)
+			break; /* GPIO70 is not enable */
+
+		err = 0; /* GPIO7x set is all enabled */
+		break;
+	case 8:
+		superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) | BIT(2),
+				0);
+		tmp = superio_inb(base, F81866_MULTI_FUN1_REG);
+		if ((tmp & 0x20) != 0x20)
+			break; /* GPIO8x is not enable */
+
+		err = 0; /* GPIO8x set is all enabled */
+		break;
+	default:
+		break;
+	}
+
+	superio_exit(base);
+	return err;
+}
+
 /*
  * Platform device and driver.
  */
@@ -351,6 +485,15 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < data->nr_bank; i++) {
 		struct f7188x_gpio_bank *bank = &data->bank[i];
 
+		/*
+		 * Dont export GPIO sysfs if pin set is not enable by MB
+		 * manufacturer.
+		 */
+		if (sio->type == f81866 && f81866_verify_gpioset(sio->addr, i))
+			continue;
+
+		dev_dbg(&pdev->dev, "%s: register GPIO%xx set\n", __func__,
+				bank->chip.base >> 4);
 		bank->chip.dev = &pdev->dev;
 		bank->data = data;
 
@@ -368,6 +511,11 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 err_gpiochip:
 	for (i = i - 1; i >= 0; i--) {
 		struct f7188x_gpio_bank *bank = &data->bank[i];
+
+		/* Some GPIO is not export, not need to remove */
+		if (!bank->data || !bank->chip.dev)
+			continue;
+
 		gpiochip_remove(&bank->chip);
 	}
 
@@ -381,6 +529,11 @@ static int f7188x_gpio_remove(struct platform_device *pdev)
 
 	for (i = 0; i < data->nr_bank; i++) {
 		struct f7188x_gpio_bank *bank = &data->bank[i];
+
+		/* Some GPIO is not export, not need to remove */
+		if (!bank->data || !bank->chip.dev)
+			continue;
+
 		gpiochip_remove(&bank->chip);
 	}
 
-- 
1.9.1
