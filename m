From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Thu,  6 Jul 2017 22:49:16 +0200
Message-ID: <1499374158-12388-2-git-send-email-agust@denx.de>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499374158-12388-1-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alan Tull <atull@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-gpio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add USB part with common functions for USB-GPIO/I2C/SPI master
adapters. These allow communication with chip's control, transmit
and receive endpoints and will be used by various FT232H drivers.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mfd/Kconfig           |   9 +
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/ftdi-ft232h.c     | 470 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/ftdi/ftdi.h |  71 +++++++
 4 files changed, 551 insertions(+)
 create mode 100644 drivers/mfd/ftdi-ft232h.c
 create mode 100644 include/linux/mfd/ftdi/ftdi.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 94ad2c1..2c4e6f2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -327,6 +327,15 @@ config MFD_EXYNOS_LPASS
 	  Select this option to enable support for Samsung Exynos Low Power
 	  Audio Subsystem.
 
+config MFD_FTDI_FT232H
+	tristate "FTDI FT232H MFD driver"
+	select MFD_CORE
+	depends on USB
+	help
+	  Enable support for the FTDI FT232H USB-GPIO/I2C/SPI/FIFO
+	  Master Adapter. Additional drivers such as CBUS_GPIO, etc.
+	  must be enabled in order to use the functionality of the device.
+
 config MFD_MC13XXX
 	tristate
 	depends on (SPI_MASTER || I2C)
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 080793b..a75163a 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -223,3 +223,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
+obj-$(CONFIG_MFD_FTDI_FT232H)	+= ftdi-ft232h.o
diff --git a/drivers/mfd/ftdi-ft232h.c b/drivers/mfd/ftdi-ft232h.c
new file mode 100644
index 0000000..d5d6d35
--- /dev/null
+++ b/drivers/mfd/ftdi-ft232h.c
@@ -0,0 +1,470 @@
+/*
+ * FTDI FT232H MFD driver
+ *
+ * Copyright (C) 2017 DENX Software Engineering
+ * Anatolij Gustschin <agust@denx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/ftdi/ftdi.h>
+
+struct ftdi_mfd_priv {
+	struct usb_interface	*intf;
+	struct usb_device	*udev;
+	struct mutex		io_mutex; /* sync I/O with disconnect */
+	int			bitbang_enabled;
+	int			index;
+	u8			bulk_in;
+	u8			bulk_out;
+	size_t			bulk_in_sz;
+	void			*bulk_in_buf;
+};
+
+/* Use baudrate calculation from libftdi */
+static int ftdi_to_clkbits(int baudrate, unsigned int clk, int clk_div,
+			   unsigned long *encoded_divisor)
+{
+	static const char frac_code[8] = { 0, 3, 2, 4, 1, 5, 6, 7 };
+	int best_baud = 0;
+	int div, best_div;
+
+	if (baudrate >= clk / clk_div) {
+		*encoded_divisor = 0;
+		best_baud = clk / clk_div;
+	} else if (baudrate >= clk / (clk_div + clk_div / 2)) {
+		*encoded_divisor = 1;
+		best_baud = clk / (clk_div + clk_div / 2);
+	} else if (baudrate >= clk / (2 * clk_div)) {
+		*encoded_divisor = 2;
+		best_baud = clk / (2 * clk_div);
+	} else {
+		/*
+		 * Divide by 16 to have 3 fractional bits and
+		 * one bit for rounding
+		 */
+		div = clk * 16 / clk_div / baudrate;
+		if (div & 1)	/* Decide if to round up or down */
+			best_div = div / 2 + 1;
+		else
+			best_div = div / 2;
+		if (best_div > 0x20000)
+			best_div = 0x1ffff;
+		best_baud = clk * 16 / clk_div / best_div;
+		if (best_baud & 1)	/* Decide if to round up or down */
+			best_baud = best_baud / 2 + 1;
+		else
+			best_baud = best_baud / 2;
+		*encoded_divisor = (best_div >> 3) |
+				   (frac_code[best_div & 0x7] << 14);
+	}
+	return best_baud;
+}
+
+#define H_CLK	120000000
+#define C_CLK	48000000
+static int ftdi_convert_baudrate(struct ftdi_mfd_priv *priv, int baud,
+				 u16 *value, u16 *index)
+{
+	unsigned long encoded_divisor = 0;
+	int best_baud = 0;
+
+	if (baud <= 0)
+		return -EINVAL;
+
+	/*
+	 * On H Devices, use 12000000 baudrate when possible.
+	 * We have a 14 bit divisor, a 1 bit divisor switch (10 or 16),
+	 * three fractional bits and a 120 MHz clock. Assume AN_120
+	 * "Sub-integer divisors between 0 and 2 are not allowed" holds
+	 * for DIV/10 CLK too, so /1, /1.5 and /2 can be handled the same
+	 */
+	if (baud * 10 > H_CLK / 0x3fff) {
+		best_baud = ftdi_to_clkbits(baud, H_CLK, 10, &encoded_divisor);
+		encoded_divisor |= 0x20000;	/* switch on CLK/10 */
+	} else {
+		best_baud = ftdi_to_clkbits(baud, C_CLK, 16, &encoded_divisor);
+	}
+
+	if (best_baud <= 0) {
+		pr_err("Invalid baudrate: %d\n", best_baud);
+		return -EINVAL;
+	}
+
+	/* Check within tolerance (about 5%) */
+	if ((best_baud * 2 < baud) ||
+	    (best_baud < baud
+		? (best_baud * 21 < baud * 20)
+		: (baud * 21 < best_baud * 20))) {
+		pr_err("Unsupported baudrate.\n");
+		return -EINVAL;
+	}
+
+	/* Split into "value" and "index" values */
+	*value = (u16)(encoded_divisor & 0xffff);
+	*index = (u16)(((encoded_divisor >> 8) & 0xff00) | priv->index);
+
+	dev_dbg(&priv->intf->dev, "best baud %d, v/i: %d, %d\n",
+		best_baud, *value, *index);
+	return best_baud;
+}
+
+/**
+ * ftdi_ctrl_xfer - FTDI control endpoint transfer
+ * @pdev: pointer to FTDI MFD platform device
+ * @desc: pointer to descriptor struct for control transfer
+ *
+ * Return:
+ * Return: If successful, the number of bytes transferred. Otherwise,
+ * a negative error number.
+ */
+int ftdi_ctrl_xfer(struct platform_device *pdev, struct ctrl_desc *desc)
+{
+	struct ftdi_mfd_priv *priv;
+	struct usb_device *udev;
+	unsigned int pipe;
+	int ret;
+
+	priv = dev_get_drvdata(pdev->dev.parent);
+	udev = priv->udev;
+
+	mutex_lock(&priv->io_mutex);
+	if (!priv->intf) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	if (!desc->data && desc->size)
+		desc->data = priv->bulk_in_buf;
+
+	if (desc->dir_out)
+		pipe = usb_sndctrlpipe(udev, 0);
+	else
+		pipe = usb_rcvctrlpipe(udev, 0);
+
+	ret = usb_control_msg(udev, pipe, desc->request, desc->requesttype,
+			      desc->value, desc->index, desc->data, desc->size,
+			      desc->timeout);
+	if (ret < 0)
+		dev_err(&udev->dev, "ctrl msg failed: %d\n", ret);
+exit:
+	mutex_unlock(&priv->io_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ftdi_ctrl_xfer);
+
+/**
+ * ftdi_bulk_xfer - FTDI bulk endpoint transfer
+ * @pdev: pointer to FTDI MFD platform device
+ * @desc: pointer to descriptor struct for bulk-in or bulk-out transfer
+ *
+ * Return:
+ * If successful, 0. Otherwise a negative error number. The number of actual
+ * bytes transferred will be stored in the @desc->act_len field of the
+ * descriptor struct.
+ */
+int ftdi_bulk_xfer(struct platform_device *pdev, struct bulk_desc *desc)
+{
+	struct ftdi_mfd_priv *priv = dev_get_drvdata(pdev->dev.parent);
+	struct usb_device *udev = priv->udev;
+	unsigned int pipe;
+	int ret;
+
+	mutex_lock(&priv->io_mutex);
+	if (!priv->intf) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	if (desc->dir_out)
+		pipe = usb_sndbulkpipe(udev, priv->bulk_out);
+	else
+		pipe = usb_rcvbulkpipe(udev, priv->bulk_in);
+
+	ret = usb_bulk_msg(udev, pipe, desc->data, desc->len,
+			   &desc->act_len, desc->timeout);
+	if (ret)
+		dev_err(&udev->dev, "bulk msg failed: %d\n", ret);
+
+exit:
+	mutex_unlock(&priv->io_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ftdi_bulk_xfer);
+
+/**
+ * ftdi_set_baudrate - set the device baud rate
+ * @pdev: pointer to FTDI MFD platform device
+ * @baudrate: baud rate value to set
+ *
+ * Return: If successful, 0. Otherwise a negative error number.
+ */
+int ftdi_set_baudrate(struct platform_device *pdev, int baudrate)
+{
+	struct ftdi_mfd_priv *priv = dev_get_drvdata(pdev->dev.parent);
+	struct ctrl_desc desc;
+	u16 index, value;
+	int ret;
+
+	if (priv->bitbang_enabled)
+		baudrate *= 4;
+
+	ret = ftdi_convert_baudrate(priv, baudrate, &value, &index);
+	if (ret < 0)
+		return ret;
+
+	desc.dir_out = true;
+	desc.request = FTDI_SIO_SET_BAUDRATE_REQUEST;
+	desc.requesttype = USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT;
+	desc.value = value;
+	desc.index = index;
+	desc.data = NULL;
+	desc.size = 0;
+	desc.timeout = USB_CTRL_SET_TIMEOUT;
+
+	ret = ftdi_ctrl_xfer(pdev, &desc);
+	if (ret < 0) {
+		dev_dbg(&pdev->dev, "failed to set baudrate: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ftdi_set_baudrate);
+
+/**
+ * ftdi_read_data - read from FTDI bulk-in endpoint
+ * @pdev: pointer to FTDI MFD platform device
+ * @buf:  pointer to data buffer
+ * @len:  length in bytes of the data to read
+ *
+ * The two modem status bytes transferred in every read will
+ * be removed and will not appear in the data buffer.
+ *
+ * Return:
+ * If successful, the number of data bytes received (can be 0).
+ * Otherwise, a negative error number.
+ */
+int ftdi_read_data(struct platform_device *pdev, void *buf, size_t len)
+{
+	struct ftdi_mfd_priv *priv = dev_get_drvdata(pdev->dev.parent);
+	struct bulk_desc desc;
+	int ret;
+
+	desc.act_len = 0;
+	desc.dir_out = false;
+	desc.data = priv->bulk_in_buf;
+	/* Device sends 2 additional status bytes, read at least len + 2 */
+	desc.len = min_t(size_t, len + 2, priv->bulk_in_sz);
+	desc.timeout = FTDI_USB_READ_TIMEOUT;
+
+	ret = ftdi_bulk_xfer(pdev, &desc);
+	if (ret)
+		return ret;
+
+	/* Only status bytes and no data? */
+	if (desc.act_len <= 2)
+		return 0;
+
+	/* Skip first two status bytes */
+	ret = desc.act_len - 2;
+	memcpy(buf, desc.data + 2, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ftdi_read_data);
+
+/**
+ * ftdi_write_data - write to FTDI bulk-out endpoint
+ * @pdev: pointer to FTDI MFD platform device
+ * @buf:  pointer to data buffer
+ * @len:  length in bytes of the data to send
+ *
+ * Return:
+ * If successful, the number of bytes transferred. Otherwise a negative
+ * error number.
+ */
+int ftdi_write_data(struct platform_device *pdev, const char *buf, size_t len)
+{
+	struct bulk_desc desc;
+	int ret;
+
+	desc.act_len = 0;
+	desc.dir_out = true;
+	desc.data = (char *)buf;
+	desc.len = len;
+	desc.timeout = FTDI_USB_WRITE_TIMEOUT;
+
+	ret = ftdi_bulk_xfer(pdev, &desc);
+	if (ret < 0)
+		return ret;
+
+	return desc.act_len;
+}
+EXPORT_SYMBOL_GPL(ftdi_write_data);
+
+/**
+ * ftdi_set_bitmode - configure bitbang mode
+ * @pdev: pointer to FTDI MFD platform device
+ * @bitmask: line configuration bitmask
+ * @mode: bitbang mode to set
+ *
+ * Return:
+ * If successful, 0. Otherwise a negative error number.
+ */
+int ftdi_set_bitmode(struct platform_device *pdev, unsigned char bitmask,
+		     unsigned char mode)
+{
+	struct ftdi_mfd_priv *priv = dev_get_drvdata(pdev->dev.parent);
+	struct ctrl_desc desc;
+	int ret;
+
+	desc.dir_out = true;
+	desc.data = NULL;
+	desc.request = FTDI_SIO_SET_BITMODE_REQUEST;
+	desc.requesttype = USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT;
+	desc.index = 1;
+	desc.value = (mode << 8) | bitmask;
+	desc.size = 0;
+	desc.timeout = USB_CTRL_SET_TIMEOUT;
+
+	ret = ftdi_ctrl_xfer(pdev, &desc);
+	if (ret < 0)
+		return ret;
+
+	switch (mode) {
+	case BITMODE_BITBANG:
+	case BITMODE_CBUS:
+	case BITMODE_SYNCBB:
+	case BITMODE_SYNCFF:
+		priv->bitbang_enabled = 1;
+		break;
+	case BITMODE_MPSSE:
+	case BITMODE_RESET:
+	default:
+		priv->bitbang_enabled = 0;
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ftdi_set_bitmode);
+
+/**
+ * ftdi_disable_bitbang - disable bitbang mode
+ * @pdev: pointer to FTDI MFD platform device
+ *
+ * Return:
+ * If successful, 0. Otherwise a negative error number.
+ */
+int ftdi_disable_bitbang(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = ftdi_set_bitmode(pdev, 0, BITMODE_RESET);
+	if (ret < 0) {
+		dev_dbg(&pdev->dev, "disable bitbang failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ftdi_disable_bitbang);
+
+static const struct mfd_cell ftdi_cells[] = {
+	{ .name = "ftdi-cbus-gpio", },
+	{ .name = "ftdi-mpsse-i2c", },
+	{ .name = "ftdi-mpsse-spi", },
+	{ .name = "ftdi-fifo-fpp-mgr", },
+};
+
+static int ftdi_mfd_probe(struct usb_interface *intf,
+			  const struct usb_device_id *id)
+{
+	struct ftdi_mfd_priv *priv;
+	struct device *dev = &intf->dev;
+	struct usb_host_interface *iface_desc;
+	struct usb_endpoint_descriptor *endpoint;
+	unsigned int i;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	iface_desc = intf->cur_altsetting;
+
+	for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
+		endpoint = &iface_desc->endpoint[i].desc;
+
+		if (usb_endpoint_is_bulk_out(endpoint))
+			priv->bulk_out = endpoint->bEndpointAddress;
+
+		if (usb_endpoint_is_bulk_in(endpoint)) {
+			priv->bulk_in = endpoint->bEndpointAddress;
+			priv->bulk_in_sz = usb_endpoint_maxp(endpoint);
+		}
+	}
+
+	priv->index = 1;
+	priv->intf = intf;
+
+	mutex_init(&priv->io_mutex);
+	usb_set_intfdata(intf, priv);
+
+	priv->bulk_in_buf = devm_kmalloc(dev, priv->bulk_in_sz,
+					 GFP_KERNEL | GFP_DMA32);
+	if (!priv->bulk_in_buf)
+		return -ENOMEM;
+
+	priv->udev = usb_get_dev(interface_to_usbdev(intf));
+
+	ret = mfd_add_hotplug_devices(dev, ftdi_cells, ARRAY_SIZE(ftdi_cells));
+	if (ret) {
+		usb_put_dev(priv->udev);
+		dev_err(dev, "failed to add mfd devices\n");
+	}
+
+	return ret;
+}
+
+static void ftdi_mfd_disconnect(struct usb_interface *intf)
+{
+	struct ftdi_mfd_priv *priv = usb_get_intfdata(intf);
+
+	mutex_lock(&priv->io_mutex);
+	priv->intf = NULL;
+	mutex_unlock(&priv->io_mutex);
+
+	mfd_remove_devices(&intf->dev);
+	usb_set_intfdata(intf, NULL);
+	usb_put_dev(priv->udev);
+}
+
+static struct usb_device_id ftdi_mfd_table[] = {
+	{ USB_DEVICE(0x0403, 0x6014) },
+	{}
+};
+MODULE_DEVICE_TABLE(usb, ftdi_mfd_table);
+
+static struct usb_driver ftdi_mfd_driver = {
+	.name		= "ftdi-mfd",
+	.id_table	= ftdi_mfd_table,
+	.probe		= ftdi_mfd_probe,
+	.disconnect	= ftdi_mfd_disconnect,
+};
+
+module_usb_driver(ftdi_mfd_driver);
+
+MODULE_ALIAS("ftdi-mfd");
+MODULE_AUTHOR("Anatolij Gustschin <agust@denx.de>");
+MODULE_DESCRIPTION("FTDI FT232H MFD core driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/ftdi/ftdi.h b/include/linux/mfd/ftdi/ftdi.h
new file mode 100644
index 0000000..0fc9317
--- /dev/null
+++ b/include/linux/mfd/ftdi/ftdi.h
@@ -0,0 +1,71 @@
+/*
+ * Common definitions for FTDI FT232H device
+ *
+ * Copyright (C) 2017 DENX Software Engineering
+ * Anatolij Gustschin <agust@denx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef MFD_FTDI_H
+#define MFD_FTDI_H
+
+/* Used FTDI USB Requests */
+#define FTDI_SIO_RESET_REQUEST		0x00
+#define FTDI_SIO_SET_BAUDRATE_REQUEST	0x03
+#define FTDI_SIO_SET_BITMODE_REQUEST	0x0B
+#define FTDI_SIO_READ_PINS_REQUEST	0x0C
+#define FTDI_SIO_READ_EEPROM_REQUEST	0x90
+
+/* For EEPROM I/O mode */
+#define FTDI_MAX_EEPROM_SIZE	256
+#define FTDI_232H_CBUS_IOMODE	0x08
+
+#define FTDI_USB_READ_TIMEOUT	5000
+#define FTDI_USB_WRITE_TIMEOUT	5000
+
+/* MPSSE bitbang modes */
+enum ftdi_mpsse_mode {
+	BITMODE_RESET	= 0x00,	/* switch off bitbang mode */
+	BITMODE_BITBANG	= 0x01,	/* asynchronous bitbang mode */
+	BITMODE_MPSSE	= 0x02,	/* MPSSE mode, on 2232x chips */
+	BITMODE_SYNCBB	= 0x04,	/* synchronous bitbang mode  */
+	BITMODE_MCU	= 0x08,	/* MCU Host Bus Emulation mode */
+				/* CPU-style fifo mode gets set via EEPROM */
+	BITMODE_OPTO	= 0x10,	/* Fast Opto-Isolated Serial Interface Mode */
+	BITMODE_CBUS	= 0x20,	/* Bitbang on CBUS pins, EEPROM config needed */
+	BITMODE_SYNCFF	= 0x40,	/* Single Channel Synchronous FIFO mode */
+	BITMODE_FT1284	= 0x80,	/* FT1284 mode, available on 232H chips */
+};
+
+struct ctrl_desc {
+	bool dir_out;
+	u8 request;
+	u8 requesttype;
+	u16 value;
+	u16 index;
+	void *data;
+	u16 size;
+	int timeout;
+};
+
+struct bulk_desc {
+	bool dir_out;
+	void *data;
+	int len;
+	int act_len;
+	int timeout;
+};
+
+int ftdi_ctrl_xfer(struct platform_device *pdev, struct ctrl_desc *desc);
+int ftdi_bulk_xfer(struct platform_device *pdev, struct bulk_desc *desc);
+int ftdi_read_data(struct platform_device *pdev, void *buf, size_t len);
+int ftdi_write_data(struct platform_device *pdev, const char *buf, size_t len);
+int ftdi_set_baudrate(struct platform_device *pdev, int baudrate);
+int ftdi_set_bitmode(struct platform_device *pdev, unsigned char bitmask,
+		     unsigned char mode);
+int ftdi_disable_bitbang(struct platform_device *pdev);
+
+#endif /* MFD_FTDI_H */
-- 
2.7.4
