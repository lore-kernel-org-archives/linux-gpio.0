From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 3/3] fpga manager: Add FT232H driver for Altera FPP
Date: Thu,  6 Jul 2017 22:49:18 +0200
Message-ID: <1499374158-12388-4-git-send-email-agust@denx.de>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499374158-12388-1-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add FPGA manager driver for loading Altera FPGAs via fast
passive parallel (FPP) interface using FTDI FT232H chip.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/fpga/Kconfig         |   7 +
 drivers/fpga/Makefile        |   1 +
 drivers/fpga/ftdi-fifo-fpp.c | 569 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 577 insertions(+)
 create mode 100644 drivers/fpga/ftdi-fifo-fpp.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index ad5448f..3ccc7a8 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -38,6 +38,13 @@ config FPGA_MGR_ALTERA_PS_SPI
 	  FPGA manager driver support for Altera Arria/Cyclone/Stratix
 	  using the passive serial interface over SPI.
 
+config FPGA_MGR_FTDI_FIFO_FPP
+	tristate "Altera FPP over FT232H FIFO"
+	depends on MFD_FTDI_FT232H
+	help
+	  FPGA manager driver support for Altera fast passive parallel
+	  interface (FPP) over FT232H FT245 FIFO.
+
 config FPGA_MGR_SOCFPGA
 	tristate "Altera SOCFPGA FPGA Manager"
 	depends on ARCH_SOCFPGA || COMPILE_TEST
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index e09895f..66821c2 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_FPGA)			+= fpga-mgr.o
 # FPGA Manager Drivers
 obj-$(CONFIG_FPGA_MGR_ALTERA_CVP)	+= altera-cvp.o
 obj-$(CONFIG_FPGA_MGR_ALTERA_PS_SPI)	+= altera-ps-spi.o
+obj-$(CONFIG_FPGA_MGR_FTDI_FIFO_FPP)	+= ftdi-fifo-fpp.o
 obj-$(CONFIG_FPGA_MGR_ICE40_SPI)	+= ice40-spi.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+= socfpga-a10.o
diff --git a/drivers/fpga/ftdi-fifo-fpp.c b/drivers/fpga/ftdi-fifo-fpp.c
new file mode 100644
index 0000000..3981390
--- /dev/null
+++ b/drivers/fpga/ftdi-fifo-fpp.c
@@ -0,0 +1,569 @@
+/*
+ * Altera FPGA firmware upload via FPP using FT232H Bitbang/FT245-FIFO.
+ *
+ * Copyright (C) 2017 DENX Software Engineering
+ * Anatolij Gustschin <agust@denx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/fpga/fpga-mgr.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/ftdi/ftdi.h>
+#include <linux/usb.h>
+
+#define	BULK_OUT_BUF_SZ	SZ_256K
+#define	MAX_RETRIES	10
+
+/*
+ * With logic of CPLD we can write the state of nConfig pin and
+ * read back the state of some pins (conf_done, init_done, nStatus).
+ * Status header and bit assignment in data register on CPLD.
+ */
+#define INPUT_HEADER_0	0xA5
+#define INPUT_HEADER_1	0x5A
+#define IN_CONF_DONE	BIT(0)
+#define IN_INIT_DONE	BIT(1)
+#define OUT_NCONFIG	BIT(0)
+#define OUT_RESET_N	BIT(1)
+
+struct fpp_mgr_ops {
+	int (*write_init)(struct fpga_manager *mgr,
+			  struct fpga_image_info *info,
+			  const char *buf, size_t count);
+	int (*write)(struct fpga_manager *mgr, const char *buf, size_t count);
+	int (*write_complete)(struct fpga_manager *mgr,
+			      struct fpga_image_info *info);
+};
+
+struct fpp_fpga_mgr_priv {
+	struct platform_device	*pdev;
+	struct fpga_manager	*mgr;
+	struct fpp_mgr_ops	*ops;
+	struct gpio_chip	*gpiochip;
+	struct gpiod_lookup_table *lookup;
+	struct gpio_desc	*nconfig;
+	struct gpio_desc	*conf_done;
+	char			cfg_mode[8];
+	u8			out_data_port;
+	int			index;
+	void			*bulk_buf;
+	char			usb_dev_id[32];
+	char			fpga_mgr_name[64];
+};
+
+static int fpp_fpga_mgr_set_data_port(struct fpp_fpga_mgr_priv *priv,
+				      u8 bitmask, u8 value)
+{
+	struct device *dev = &priv->pdev->dev;
+	struct bulk_desc desc;
+	u8 *data;
+	int ret;
+
+	/*
+	 * With CPLD connected (in FT245 FIFO mode) we use ACBUS8&9
+	 * pins to switch between data and command mode:
+	 * ACBUS8&9 == 0, 0  --> normal mode (data communication)
+	 * ACBUS8&9 == 1, 0  --> command mode
+	 */
+	gpiod_set_raw_value_cansleep(priv->nconfig, 1);
+	gpiod_set_raw_value_cansleep(priv->conf_done, 0);
+	msleep(50);
+
+	/* Write commands to CPLD */
+	ret = ftdi_set_bitmode(priv->pdev, 0x00, BITMODE_SYNCFF);
+	if (ret)
+		return ret;
+
+	if (value)
+		priv->out_data_port |= bitmask;
+	else
+		priv->out_data_port &= ~bitmask;
+
+	data = priv->bulk_buf;
+	*data = priv->out_data_port;
+
+	desc.dir_out = true;
+	desc.act_len = 0;
+	desc.len = 1;
+	desc.data = data;
+	desc.timeout = FTDI_USB_WRITE_TIMEOUT;
+
+	ret = ftdi_bulk_xfer(priv->pdev, &desc);
+	if (ret) {
+		dev_err(dev, "Writing in SYNCFF mode failed: %d\n", ret);
+		return ret;
+	}
+
+	msleep(50);
+	/* Switch back to data mode with ACBUS8&9 back to low */
+	gpiod_set_raw_value_cansleep(priv->nconfig, 0);
+	gpiod_set_raw_value_cansleep(priv->conf_done, 0);
+	msleep(50);
+
+	return 0;
+}
+
+static int fpp_fpga_mgr_bitbang_write_init(struct fpga_manager *mgr,
+					   struct fpga_image_info *info,
+					   const char *buf, size_t count)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+	struct device *dev = &priv->pdev->dev;
+	int retries = MAX_RETRIES;
+	int ret;
+
+	gpiod_set_value_cansleep(priv->nconfig, 0);
+	msleep(50);
+	gpiod_set_value_cansleep(priv->nconfig, 1);
+	msleep(50);
+	gpiod_set_value_cansleep(priv->nconfig, 0);
+
+	/* Wait for CONF_DONE to get low */
+	do {
+		msleep(50);
+
+		ret = gpiod_get_value_cansleep(priv->conf_done);
+		if (ret < 0) {
+			dev_err(dev, "Failed to get CONF_DONE pin: %d\n", ret);
+			return ret;
+		}
+
+		if (!ret)
+			break;
+	} while (--retries > 0);
+
+	if (!retries) {
+		dev_warn(dev, "CONF_DONE low wait timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = ftdi_set_bitmode(priv->pdev, 0xff, BITMODE_BITBANG);
+	if (ret < 0)
+		return ret;
+
+	/* Set max. working baud rate (for hardware without CPLD) */
+	return ftdi_set_baudrate(priv->pdev, 700000);
+}
+
+static int fpp_fpga_mgr_bitbang_write(struct fpga_manager *mgr,
+				      const char *buf, size_t count)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+	struct bulk_desc desc;
+	size_t blk_sz;
+	int ret;
+
+	desc.data = priv->bulk_buf;
+	desc.dir_out = true;
+	desc.timeout = FTDI_USB_WRITE_TIMEOUT;
+
+	while (count) {
+		blk_sz = min_t(size_t, count, BULK_OUT_BUF_SZ);
+		memcpy(priv->bulk_buf, buf, blk_sz);
+		desc.act_len = 0;
+		desc.len = blk_sz;
+		ret = ftdi_bulk_xfer(priv->pdev, &desc);
+		if (ret < 0)
+			return ret;
+
+		buf += desc.act_len;
+		count -= desc.act_len;
+	}
+
+	return 0;
+}
+
+static int fpp_fpga_mgr_bitbang_write_complete(struct fpga_manager *mgr,
+					       struct fpga_image_info *info)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+	struct device *dev = &priv->pdev->dev;
+	int retries = MAX_RETRIES;
+	int ret;
+
+	/* Wait for CONF_DONE to get high */
+	do {
+		msleep(50);
+
+		ret = gpiod_get_value_cansleep(priv->conf_done);
+		if (ret < 0)
+			return ret;
+
+		if (ret)
+			break;
+	} while (--retries > 0);
+
+	if (!retries) {
+		dev_warn(dev, "CONF_DONE wait timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	ftdi_disable_bitbang(priv->pdev);
+
+	return 0;
+}
+
+static inline bool status_hdr_is_valid(u8 *buf)
+{
+	return buf[0] == INPUT_HEADER_0 && buf[1] == INPUT_HEADER_1;
+}
+
+static int fpp_fpga_mgr_ft245_fifo_write_init(struct fpga_manager *mgr,
+					      struct fpga_image_info *info,
+					      const char *buf, size_t count)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+	struct device *dev = &priv->pdev->dev;
+	u8 *inbuf = priv->bulk_buf;
+	int retries = MAX_RETRIES;
+	int ret;
+
+	gpiod_direction_output_raw(priv->conf_done, 0);
+
+	/* Set/reset nConfig via commands to CPLD */
+	ret = fpp_fpga_mgr_set_data_port(priv, OUT_NCONFIG, 1);
+	if (ret)
+		return ret;
+	ret = fpp_fpga_mgr_set_data_port(priv, OUT_NCONFIG, 0);
+	if (ret)
+		return ret;
+	ret = fpp_fpga_mgr_set_data_port(priv, OUT_NCONFIG, 1);
+	if (ret)
+		return ret;
+
+	/* In FT245 FIFO mode we need sync FIFO mode to talk to FPGA */
+	ret = ftdi_set_bitmode(priv->pdev, 0xff, BITMODE_SYNCFF);
+	if (ret)
+		return ret;
+
+	/* Wait until FPGA is ready for loading (conf_done zero) or timeout */
+	do {
+		ret = ftdi_read_data(priv->pdev, inbuf, 64);
+		if (ret < 0) {
+			dev_err(dev, "Can't read status data: %d\n", ret);
+			return ret;
+		}
+
+		/* Check input buffer header and conf_done status */
+		if (status_hdr_is_valid(inbuf) &&
+		    (inbuf[2] & IN_CONF_DONE) == 0)
+			break;
+
+		msleep(100); /* CPLD sends status every 100ms */
+	} while (--retries > 0);
+
+	if (!retries) {
+		dev_warn(dev, "CONF_DONE wait timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Configure for max. baud rate (3MHz * 4 in bitbang mode) */
+	return ftdi_set_baudrate(priv->pdev, 3000000);
+}
+
+static int fpp_fpga_mgr_ft245_fifo_write(struct fpga_manager *mgr,
+					 const char *buf, size_t count)
+{
+	return fpp_fpga_mgr_bitbang_write(mgr, buf, count);
+}
+
+static int fpp_fpga_mgr_ft245_fifo_write_complete(struct fpga_manager *mgr,
+						  struct fpga_image_info *info)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+	struct device *dev = &priv->pdev->dev;
+	u8 *inbuf = priv->bulk_buf;
+	int retries = MAX_RETRIES;
+	int ret;
+	u8 mask;
+
+	mask = IN_CONF_DONE | IN_INIT_DONE;
+
+	do {
+		ret = ftdi_read_data(priv->pdev, inbuf, 64);
+		if (ret < 0) {
+			dev_err(dev, "Can't read status data: %d\n", ret);
+			return ret;
+		}
+
+		if (status_hdr_is_valid(inbuf) && (inbuf[2] & mask) == mask)
+			break;
+
+		msleep(100);
+	} while (--retries > 0);
+
+	if (!retries) {
+		dev_warn(dev, "INIT_DONE wait timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Release Reset_n, keep nCONFIG high, too! */
+	return fpp_fpga_mgr_set_data_port(priv, OUT_NCONFIG | OUT_RESET_N, 1);
+}
+
+static enum fpga_mgr_states fpp_fpga_mgr_state(struct fpga_manager *mgr)
+{
+	return FPGA_MGR_STATE_UNKNOWN;
+}
+
+static int fpp_fpga_mgr_write_init(struct fpga_manager *mgr,
+				   struct fpga_image_info *info,
+				   const char *buf, size_t count)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+
+	if (info && info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
+		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
+		return -EINVAL;
+	}
+
+	if (priv->ops->write_init)
+		return priv->ops->write_init(mgr, info, buf, count);
+
+	return -ENODEV;
+}
+
+static int fpp_fpga_mgr_write(struct fpga_manager *mgr, const char *buf,
+			      size_t count)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+
+	if (priv->ops->write)
+		return priv->ops->write(mgr, buf, count);
+
+	return -ENODEV;
+}
+
+static int fpp_fpga_mgr_write_complete(struct fpga_manager *mgr,
+				       struct fpga_image_info *info)
+{
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+
+	if (priv->ops->write_complete)
+		return priv->ops->write_complete(mgr, info);
+
+	return -ENODEV;
+}
+
+static struct fpp_mgr_ops fpp_mgr_bitbang_ops = {
+	.write_init	= fpp_fpga_mgr_bitbang_write_init,
+	.write		= fpp_fpga_mgr_bitbang_write,
+	.write_complete	= fpp_fpga_mgr_bitbang_write_complete,
+};
+
+static struct fpp_mgr_ops fpp_mgr_ft245_fifo_ops = {
+	.write_init	= fpp_fpga_mgr_ft245_fifo_write_init,
+	.write		= fpp_fpga_mgr_ft245_fifo_write,
+	.write_complete	= fpp_fpga_mgr_ft245_fifo_write_complete,
+};
+
+static const struct fpga_manager_ops fpp_fpga_mgr_ops = {
+	.state		= fpp_fpga_mgr_state,
+	.write_init	= fpp_fpga_mgr_write_init,
+	.write		= fpp_fpga_mgr_write,
+	.write_complete	= fpp_fpga_mgr_write_complete,
+};
+
+static ssize_t show_cfg_mode(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct fpga_manager *mgr = platform_get_drvdata(pdev);
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", priv->cfg_mode);
+}
+
+static ssize_t store_cfg_mode(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct fpga_manager *mgr = platform_get_drvdata(pdev);
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+
+	if (!count || count > sizeof(priv->cfg_mode))
+		return -EINVAL;
+
+	if (!strncmp(buf, "fifo", 4)) {
+		strncpy(priv->cfg_mode, buf, sizeof(priv->cfg_mode));
+		priv->cfg_mode[4] = 0;
+		priv->ops = &fpp_mgr_ft245_fifo_ops;
+		gpiod_direction_output_raw(priv->conf_done, 0);
+	} else if (!strncmp(buf, "bitbang", 7)) {
+		strncpy(priv->cfg_mode, buf, sizeof(priv->cfg_mode));
+		priv->cfg_mode[7] = 0;
+		priv->ops = &fpp_mgr_bitbang_ops;
+		gpiod_direction_input(priv->conf_done);
+	} else {
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR(cfg_mode, 0664, show_cfg_mode, store_cfg_mode);
+
+static int gpiochip_match_mfd_parent(struct gpio_chip *chip, void *data)
+{
+	struct device *gpiodev = chip->parent;
+	struct device *dev = data;
+
+	if (gpiodev->parent == dev)
+		return 1;
+	return 0;
+}
+
+static struct gpio_chip *find_gpiochip_by_parent(struct device *dev)
+{
+	return gpiochip_find((void *)dev, gpiochip_match_mfd_parent);
+}
+
+static int fpp_fpga_mgr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fpp_fpga_mgr_priv *priv;
+	struct gpiod_lookup_table *lookup;
+	int lookup_size, ret;
+	unsigned int i, gpios = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = sscanf(dev_name(dev->parent), "%s", priv->usb_dev_id);
+	if (ret != 1) {
+		dev_err(dev, "Can't get parent device name: %d\n", ret);
+		return -ENODEV;
+	}
+
+	/* Use unique USB bus/port in FPGA manager name */
+	snprintf(priv->fpga_mgr_name, sizeof(priv->fpga_mgr_name),
+		 "ftdi-fpp-fpga-mgr %s", priv->usb_dev_id);
+
+	priv->gpiochip = find_gpiochip_by_parent(dev->parent);
+	if (!priv->gpiochip) {
+		dev_err(dev, "Defer probing FTDI CBUS gpiochip\n");
+		return -EPROBE_DEFER;
+	}
+
+	lookup_size = sizeof(*lookup) + 2 * sizeof(struct gpiod_lookup);
+	lookup = devm_kzalloc(dev, lookup_size, GFP_KERNEL);
+	if (!lookup)
+		return -ENOMEM;
+
+	lookup->dev_id = devm_kstrdup(dev, dev_name(dev), GFP_KERNEL);
+	if (!lookup->dev_id)
+		return -ENOMEM;
+
+	/* Does GPIO controller provide needed ACBUS8 and ACBUS9 pins? */
+	for (i = 0; i < priv->gpiochip->ngpio; i++) {
+		if (!priv->gpiochip->names[i])
+			continue;
+		if (!strncmp(priv->gpiochip->names[i], "ACBUS8", 6)) {
+			lookup->table[0].chip_hwnum = i;
+			gpios++;
+		}
+		if (!strncmp(priv->gpiochip->names[i], "ACBUS9", 6)) {
+			lookup->table[1].chip_hwnum = i;
+			gpios++;
+		}
+	}
+
+	if (gpios < 2) {
+		dev_err(dev, "Missing control GPIOs\n");
+		return -ENODEV;
+	}
+
+	lookup->table[0].chip_label = priv->gpiochip->label;
+	lookup->table[0].con_id = "nconfig";
+	lookup->table[0].flags = GPIO_ACTIVE_LOW;
+	lookup->table[1].chip_label = priv->gpiochip->label;
+	lookup->table[1].con_id = "conf_done";
+	lookup->table[1].flags = GPIO_ACTIVE_HIGH;
+
+	priv->lookup = lookup;
+	gpiod_add_lookup_table(priv->lookup);
+
+	priv->pdev = pdev;
+	priv->ops = &fpp_mgr_ft245_fifo_ops;
+	strncpy(priv->cfg_mode, "fifo", sizeof(priv->cfg_mode));
+
+	priv->nconfig = gpiod_get(dev, "nconfig", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->nconfig)) {
+		ret = PTR_ERR(priv->nconfig);
+		dev_err(dev, "Failed to get nconfig gpio: %d\n", ret);
+		goto err_cfg0;
+	}
+
+	priv->conf_done = gpiod_get(dev, "conf_done", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->conf_done)) {
+		ret = PTR_ERR(priv->conf_done);
+		dev_err(dev, "Failed to get conf_done gpio: %d\n", ret);
+		goto err_cfg1;
+	}
+
+	priv->bulk_buf = devm_kmalloc(dev, BULK_OUT_BUF_SZ,
+				      GFP_KERNEL | GFP_DMA32);
+	if (!priv->bulk_buf) {
+		ret = -ENOMEM;
+		goto err_cfg2;
+	}
+
+	ret = fpga_mgr_register(dev, priv->fpga_mgr_name,
+				&fpp_fpga_mgr_ops, priv);
+	if (ret)
+		goto err_cfg2;
+
+	ret = device_create_file(dev, &dev_attr_cfg_mode);
+	if (ret)
+		dev_warn(dev, "Can't create cfg_mode interface %d\n", ret);
+
+	return 0;
+
+err_cfg2:
+	gpiod_put(priv->conf_done);
+err_cfg1:
+	gpiod_put(priv->nconfig);
+err_cfg0:
+	gpiod_remove_lookup_table(priv->lookup);
+	return ret;
+}
+
+static int fpp_fpga_mgr_remove(struct platform_device *pdev)
+{
+	struct fpga_manager *mgr = platform_get_drvdata(pdev);
+	struct fpp_fpga_mgr_priv *priv = mgr->priv;
+
+	device_remove_file(&pdev->dev, &dev_attr_cfg_mode);
+	fpga_mgr_unregister(&pdev->dev);
+	gpiod_put(priv->conf_done);
+	gpiod_put(priv->nconfig);
+	gpiod_remove_lookup_table(priv->lookup);
+	return 0;
+}
+
+static struct platform_driver fpp_fpga_mgr_driver = {
+	.driver.name	= "ftdi-fifo-fpp-mgr",
+	.probe		= fpp_fpga_mgr_probe,
+	.remove		= fpp_fpga_mgr_remove,
+};
+
+module_platform_driver(fpp_fpga_mgr_driver);
+
+MODULE_ALIAS("platform:ftdi-fifo-fpp-mgr");
+MODULE_AUTHOR("Anatolij Gustschin <agust@denx.de>");
+MODULE_DESCRIPTION("FT232H Bitbang/FT245-FIFO FPP FPGA Manager Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
