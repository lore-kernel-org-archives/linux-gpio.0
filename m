From: Matt Weber <matthew.weber@rockwellcollins.com>
Subject: [PATCH 1/1] gpio: add support for tle8110
Date: Thu,  6 Apr 2017 23:03:32 -0500
Message-ID: <1491537812-17078-1-git-send-email-matthew.weber@rockwellcollins.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ch3vs02.rockwellcollins.com ([205.175.226.29]:4350 "EHLO
        ch3vs02.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751660AbdDGEOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 00:14:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Matt Weber <matthew.weber@rockwellcollins.com>

A GPIO driver for Infineon TLE8110EE low-side switch.
This provides GPIO interface supporting inputs and outputs.
The driver also exposes the control/diagnostics of this
device through /dev/spi interfacing.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .../devicetree/bindings/gpio/gpio-tle8110.txt      | 122 ++++
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tle8110.c                        | 754 +++++++++++++++++++++
 4 files changed, 886 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tle8110.txt
 create mode 100644 drivers/gpio/gpio-tle8110.c

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tle8110.txt b/Documentation/devicetree/bindings/gpio/gpio-tle8110.txt
new file mode 100644
index 0000000..dd09efc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tle8110.txt
@@ -0,0 +1,122 @@
+
+TLE8110 GPIO driver
+
+GPIO driver for TLE8110 device (via SPI framework API).
+
+Overview
+---------------------
+
+Infineon TLE8110 is a SPI based 10-channel smart switch. It has 10 input
+ports and 10 output ports. All 10 parallel pins are routed to each output
+channel. Default assignment of input pin1 to output pin1, input pin2 to
+output pin2... and input pin10 to output pin10.
+The output channels can also be controlled by SPI.
+
+Each output channel can be configured in `Serial Mode`, `Input Mode` or `AND Mode`.
+
+* Serial Mode +
+In this mode, related output channel is set according to the content of OUTx register.
+OUTx register can be written by SPI commands. Software can control the output channel
+in this mode.
+* Input Mode +
+In this mode, related output channel is set according to INx(input pin).
+* AND Mode +
+In this mode, related output channel is set if OUTx(content of OUTx regsiter) & INx(input pin)
+are both set
+
+This TLE8110 Driver registers a `gpiochip` per device and creates sysfs entries with
+label `tle8110-gpio`.
+
+
+Smart switch command access
+-------------------------------------
+
+Apart from `gpiochip` sysfs interface, tle8110 driver also create sysfs entries
+`input_status_show`, `short_diag` and `tle8110_cmd_res` to read the status, run short diagnostic
+and run raw tle8110 commands respectively. These files are created under spi bus devices.
+
+For example,
+
+----
+/sys/bus/spi/devices/spi32766.1
+/sys/bus/spi/devices/spi32766.2
+----
+
+* input_status_show
+This attribute shows input pin status. Driver runs CMD_RINx(0x0708) on tle8110 and displays
+channel status starting from pin1 though pin10 from left to right
+
+	# cat /sys/bus/spi/devices/spi32766.1/input_status_show
+	1 0 0 0 0 0 0 0 0 0
+
+* short_diag
+This attribute shows diagnostic information from all 10 channels. Driver runs CMD_RSD(0x0701)
+on tle8110 and gets diagnostic information from it.
+
+	# cat /sys/bus/spi/devices/spi32766.1/short_diag
+	N F F F F F F F F F
+
+`N` Normal Operation
+`F` Diagnosis Error. Need to read registers `DCC_DRA(0x1500)` and `DCC_DRB(0x1600)` for detailed
+diagnosis
+
+*  tle8110_cmd_res
+This attribute can be used to run tle8110 commands and read reponses. User can run commands like
+`CMD_RSDS(0x0702)`, `CMD_RPC(0x0704)`, `CMD_CSDS(0x0710)`, `DCC_DRA(0x1500)`, `DCC_DRB(0x1600)`,
+`DCC_DRACL(0x1100)`, `DCC_DRACL(0x1200)`, `DCC_DMSCL(0x1800)`, `DCC_DMS1(0x1B00)`, `DCC_DMS2(0X1D00)`,
+`DCC_DMS3(0x1E00)` and `CMD_PMx(0x7000)`.
+
+Run command:
+
+	# echo 0x1500 > /sys/bus/spi/devices/spi32766.1/tle8110_cmd_res
+
+Read response:
+
+	# cat /sys/bus/spi/devices/spi32766.1/tle8110_cmd_res
+	0x1557
+
+
+
+Device Tree Properties:
+--------------------------------------------------
+- compatible :		Should be "tle8110"
+
+- reg :		SPI chip select number
+
+- spi-max-frequency :	Max frequency supported by device
+
+- gpio-base :		Optional base number
+			(will be automatically assigned if -1)
+			If this property is not provided in the node,
+			driver will use default value.
+			If this property is assigned as 2's complement representation of
+			-ve value(example -1 is 0xffffffff in 2's complement),
+			driver will use default value. Recommended value=0xffffffff
+
+Example instantiation:
+
+
+dspi1: dspi@2110000 {
+	compatible = "fsl,ls1021a-v1.0-dspi";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x0 0x2110000 0x0 0x10000>;
+	interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+	clock-names = "dspi";
+	clocks = <&platform_clk 1>;
+	spi-num-chipselects = <5>;
+	big-endian;
+	status = "disabled";
+	bus-num = <0>;
+	status = "okay";
+
+	tle8110@1 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "tle8110";
+		reg = <1>;
+		spi-max-frequency = <1000000>;
+		spi-cpha;
+		gpio-base = <0xffffffff>;
+	};
+};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 63ceed2..1637ed8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1214,6 +1214,15 @@ config GPIO_PISOSR
 	  GPIO driver for SPI compatible parallel-in/serial-out shift
 	  registers. These are input only devices.
 
+config GPIO_TLE8110
+        tristate "TLE8110EE (Infineon) SPI based low-side switch"
+        depends on SYSFS
+        help
+          GPIO driver for Infineon TLE8110EE low-side switch.
+	  This provides GPIO interface supporting inputs and outputs.
+	  This driver also exposes the control/diagnostics
+	  of this device through /dev/spi interfacing.
+
 endmenu
 
 menu "SPI or I2C GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 095598e..115a3c5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_GPIO_TB10X)	+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)	+= gpio-tc3589x.o
 obj-$(CONFIG_GPIO_TEGRA)	+= gpio-tegra.o
 obj-$(CONFIG_GPIO_TIMBERDALE)	+= gpio-timberdale.o
+obj-$(CONFIG_GPIO_TLE8110)	+= gpio-tle8110.o
 obj-$(CONFIG_GPIO_PALMAS)	+= gpio-palmas.o
 obj-$(CONFIG_GPIO_TPIC2810)	+= gpio-tpic2810.o
 obj-$(CONFIG_GPIO_TPS65086)	+= gpio-tps65086.o
diff --git a/drivers/gpio/gpio-tle8110.c b/drivers/gpio/gpio-tle8110.c
new file mode 100644
index 0000000..a416e83
--- /dev/null
+++ b/drivers/gpio/gpio-tle8110.c
@@ -0,0 +1,754 @@
+/*
+ * Support for Infineon TLE8110EE IO driver
+ *
+ * Copyright 2017 Rockwell Collins
+ *
+ * April 3 2017  Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
+ *               Matt Weber <matthew.weber@rockwellcollins.com>
+ *
+ * based on TLE62x0 SPI driver
+ *
+ * Copyright (c) 2007 Simtec Electronics
+ *    Ben Dooks, <ben@simtec.co.uk>
+ */
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#ifdef CONFIG_OF
+#include <linux/of.h>
+#include <linux/of_device.h>
+#endif
+
+#include <linux/spi/spi.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+#include <linux/types.h>
+#include <linux/version.h>
+
+
+#define TLE8110_GPIO_COUNT_MAX  10
+#define TLE8110_GPIO_INIT_STATE 0
+#define TLE8110_CMD_LEN		2
+#define TLE8110_CH_MASK		0x3FF
+
+#define DIAG_NORMAL		0
+#define DIAG_FAILURE		1
+
+#define IN_LOW		0
+#define IN_HIGH		1
+
+/* For ISAx and ISBx command channel modes. default all Channels ISx[1:0] = 10B
+ * 0x: Serial Mode - The Channel is set ON/OFF by OUTx
+ * 10: INPUT Mode - CHx ON/OFF according INx
+ * 11: AND operate Mode INx with OUTx -> CHx ON if OUTx & INx =1
+ */
+#define SER_MODE_OUT	1
+#define SER_MODE_IN	2
+#define SER_MODE_AND	3
+
+/* NOP - no operation.
+ * A frame with .0000h. will be returned
+ */
+#define CMD_NOP		0x0700	/* 0000 0111 0000 0000b */
+
+/* CMD_RSD - Command: Return Short Diagnosis */
+#define CMD_RSD		0x0701	/* 0000 0111 0000 0001b */
+
+/* CMD_RSDS - Command: Return Short Diagnosis and Device */
+#define CMD_RSDS	0x0702	/* 0000 0111 0000 0010b */
+
+/* CMD_RPC - Command: Return Pattern Check */
+#define CMD_RPC		0x0704	/* 0000 0111 0000 0100b */
+
+/* CMD_RINx - Command: Return Input Pin INx -Status */
+#define CMD_RINx	0x0708	/* 0000 0111 0000 1000b */
+
+/* CMD_CSDS - Command: Clear Short Diagnosis and Device Status */
+#define CMD_CSDS	0x0710	/* 0000 0111 0001 0000b */
+
+/* Read out Diagnosis Register A. Return the contents in the next SPI Frame */
+#define DCC_DRA		0x1500	/* 0001 0101 0000 0000b */
+
+/* Read out Diagnosis Register B. Return the contents in the next SPI Frame */
+#define DCC_DRB		0x1600	/* 0001 0110 0000 0000b */
+
+/* Clear the contents of the Diagnosis Register A */
+#define DCC_DRACL	0x1100	/* 0001 0001 0000 0000b */
+
+/* Clear the contents of the Diagnosis Register B */
+#define DCC_DRBCL	0x1200	/* 0001 0010 0000 0000b */
+
+/* DMSCL/OPSx - Diagnosis Mode Set, Clear / Output Pins Set
+ * This needs to be or-ed with fisrt 8-bits for OPSx
+ */
+#define DCC_DMSCL	0x1800	/* 0001 1000 0000 0000b. */
+
+/* DMS1/OPSx - Diagnosis Mode Set, Register1 / Output Pins Set
+ * This needs to be or-ed with fisrt 8-bits for OPSx
+ */
+#define DCC_DMS1	0x1B00	/* 0001 1011 0000 0000b. */
+
+/* DMS2/OPSx - Diagnosis Mode Set, Register2 / Output Pins Set
+ * This needs to be or-ed with fisrt 8-bits for OPSx
+ */
+#define DCC_DMS2	0x1D00	/* 0001 1101 0000 0000b. */
+
+/* DMS3/OPSx - Diagnosis Mode Set, Register3 / Output Pins Set
+ * This needs to be or-ed with fisrt 8-bits for OPSx
+ */
+#define DCC_DMS3	0x1E00	/* 0001 1110 0000 0000b. */
+
+/* This needs to be or-ed with lower 10-bits for OUTx pin number.
+ * Reset value(Lower 12-bit) = 0xC00
+ */
+#define OUTx		0x2C00	/* 0010 1100 0000 0000b. */
+
+/* Input Serial Mode Register Bank A. Lower 12-bits(2-bits/ch) corresponds to
+ * ch6-1 mode. Def = 0xAAA
+ */
+#define ISAx		0x5AAA	/* 0101 0000 0000 0000b. */
+
+/* Input Serial Mode Register Bank B. Lower 8-bits(2-bits/ch) corresponds to
+ * ch10-7 mode. Def = 0xAA
+ */
+#define ISBx		0x60AA	/* 0110 0000 0000 0000b. */
+
+/* Parallel Mode */
+#define CMD_PMx		0x7000
+
+
+struct tle8110_state {
+	struct spi_device *spi;
+	struct gpio_chip gpiochip;
+	struct mutex lock;
+	u32 gpio_state;
+	u32 ser_mode_a;
+	u32 ser_mode_b;
+	u8 tx_buff[4];
+	u8 rx_buff[4];
+	u16 last_rx;
+};
+
+/**
+ * tle8110_write_cmd - send SPI write command
+ * @st: tle8110_state tle8110 private data
+ * @cmd: command to write on SPI bus
+ *
+ * Return: int
+ */
+static inline int tle8110_write_cmd(struct tle8110_state *st, unsigned int cmd)
+{
+	unsigned char *buff = st->tx_buff;
+
+	buff[0] = (cmd >> 8) & 0xff;
+	buff[1] = cmd & 0xff;
+	return spi_write(st->spi, buff, TLE8110_CMD_LEN);
+}
+
+/**
+ * tle8110_write16_read16 - send SPI read command and receive response
+ * @st: tle8110_state tle8110 private data
+ * Return: int
+ *
+ * This function sends 16-bit command and receives 16-bit response. Response
+ * received is not current command's response it is the response of previous
+ * command
+ */
+static inline int tle8110_write16_read16(struct tle8110_state *st,
+					 unsigned int cmd)
+{
+	unsigned char *txbuff = st->tx_buff;
+	struct spi_transfer xfer = {
+		.tx_buf = txbuff,
+		.rx_buf = st->rx_buff,
+		.len = TLE8110_CMD_LEN,
+	};
+	struct spi_message msg;
+	int status;
+
+	txbuff[0] = (u8) ((cmd >> 8) & 0xff);
+	txbuff[1] = (u8) (cmd & 0xff);
+	txbuff[2] = 0x00;
+	txbuff[3] = 0x00;
+	spi_message_init(&msg);
+	spi_message_add_tail(&xfer, &msg);
+	status = spi_sync(st->spi, &msg);
+	return status;
+}
+
+/**
+ * tle8110_read_res - send SPI read command and receive response
+ * @st: tle8110_state tle8110 private data
+ *
+ * Return: int
+ */
+static inline int tle8110_read_res(struct tle8110_state *st)
+{
+	unsigned char *txbuff = st->tx_buff;
+	struct spi_transfer xfer = {
+		.tx_buf = txbuff,
+		.rx_buf = st->rx_buff,
+		.len = TLE8110_CMD_LEN,
+	};
+	struct spi_message msg;
+	int status;
+
+	txbuff[0] = (u8) ((CMD_NOP >> 8) & 0xff);
+	txbuff[1] = (u8) (CMD_NOP & 0xff);
+	txbuff[2] = 0x00;
+	txbuff[3] = 0x00;
+	spi_message_init(&msg);
+	spi_message_add_tail(&xfer, &msg);
+	status = spi_sync(st->spi, &msg);
+	return status;
+}
+
+/**
+ * decode_fault - decodes a bit and return "N" for
+ *		  normal pin and "F" for faulty pin
+ * @fault_code: int value for a single pin
+ *
+ * Return: char string
+ */
+static char *decode_fault(unsigned int fault_code)
+{
+	fault_code &= 1;
+
+	switch (fault_code) {
+	case DIAG_NORMAL:
+		return "N";
+	case DIAG_FAILURE:
+		return "F";
+	default:
+		return "?";
+	}
+}
+
+/**
+ * decode_input - decodes a bit and return "0" for
+ *		  OFF pin and "1" for ON pin
+ * @fault_code: int value for a single pin
+ *
+ * Return: char string
+ */
+static char *decode_input(unsigned int in_status)
+{
+	in_status &= 1;
+
+	switch (in_status) {
+	case IN_LOW:
+		return "0";
+	case IN_HIGH:
+		return "1";
+	default:
+		return "?";
+	}
+}
+
+/**
+ * tle8110_set_test_cmd - Send SPI command from user space
+ * @dev: struct device instance
+ * @attr: struct device_attribute
+ * @buf: buffer for string o/p
+ *
+ * Return:  length of string buffer
+ */
+static ssize_t tle8110_set_cmd_tx(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tle8110_state *st = dev_get_drvdata(dev);
+	u8 *buff = st->rx_buff;
+	int ret;
+	u16 cmd = 0;
+
+	ret = kstrtou16(buf, 16, &cmd);
+	if (ret)
+		return ret;
+	mutex_lock(&st->lock);
+	ret = tle8110_write_cmd(st, cmd);
+	if (ret < 0) {
+		dev_err(dev, "tle8110_write_cmd() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+	/* Read Status */
+	ret = tle8110_write16_read16(st, CMD_NOP);
+	if (ret < 0) {
+		dev_err(dev, "tle8110_read_resp() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+	st->last_rx = (u16) (buff[0] << 8) | buff[1];
+
+	mutex_unlock(&st->lock);
+	return (ssize_t) count;
+}
+
+/**
+ * tle8110_show_test_cmd_res - Show test cmd response
+ * @dev: struct device instance
+ * @attr: struct device_attribute
+ * @buf: buffer for string o/p
+ *
+ * Return:  length of string buffer
+ */
+static ssize_t tle8110_show_cmd_rx(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct tle8110_state *st = dev_get_drvdata(dev);
+	u16 rx;
+
+	mutex_lock(&st->lock);
+	rx = st->last_rx;
+	mutex_unlock(&st->lock);
+	return sprintf(buf, "0x%04x\n", rx);
+}
+
+static DEVICE_ATTR(tle8110_cmd_res, S_IRUGO | S_IWUSR, tle8110_show_cmd_rx,
+		   tle8110_set_cmd_tx);
+
+/**
+ * tle8110_short_diag - Send command for short diagnosis and get response
+ * @dev: struct device instance
+ * @attr: struct device_attribute
+ * @buf: buffer for string o/p
+ *
+ * Return:  length of string buffer
+ */
+static ssize_t tle8110_short_diag(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct tle8110_state *st = dev_get_drvdata(dev);
+	char *bp = buf;
+	u8 *buff = st->rx_buff;
+	unsigned int fault = 0;
+	int ptr;
+	int ret;
+
+	mutex_lock(&st->lock);
+	/* CMD_RSD - Command: Return Short Diagnosis */
+	ret = tle8110_write_cmd(st, CMD_RSD);
+	if (ret < 0) {
+		dev_err(dev, "tle8110_write_cmd() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+	/* Read Short Diagnosis */
+	ret = tle8110_read_res(st);
+	if (ret < 0) {
+		dev_err(dev, "tle8110_read_resp() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+	st->last_rx = (u16) (buff[0] << 8) | buff[1];
+	for (ptr = 0; ptr < (st->gpiochip.ngpio * 2) / 8; ptr += 1) {
+		fault <<= 8;
+		fault |= ((unsigned long)buff[ptr]);
+	}
+	for (ptr = 0; ptr < st->gpiochip.ngpio; ptr++)
+		bp += sprintf(bp, "%s ", decode_fault(fault >> ptr));
+	*bp++ = '\n';
+	mutex_unlock(&st->lock);
+	return bp - buf;
+}
+
+static DEVICE_ATTR(short_diag, S_IRUGO, tle8110_short_diag, NULL);
+
+/**
+ * tle8110_input_status_show - Show input pin status
+ * @dev: struct device instance
+ * @attr: struct device_attribute
+ * @buf: buffer for string o/p
+ *
+ * Return:  length of string buffer
+ */
+static ssize_t tle8110_input_status_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct tle8110_state *st = dev_get_drvdata(dev);
+	char *bp = buf;
+	u8 *buff = st->rx_buff;
+	unsigned long status = 0;
+	int ptr;
+	int ret;
+
+	mutex_lock(&st->lock);
+
+	/* CMD_RSD - Command: Return Input Status */
+	ret = tle8110_write_cmd(st, CMD_RINx);
+	if (ret < 0) {
+		dev_err(dev, "tle8110_write_cmd() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+
+	/* Read Short Diagnosis */
+	ret = tle8110_read_res(st);
+	if (ret < 0) {
+		dev_err(dev, "tle8110_read_resp() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+
+	for (ptr = 0; ptr < (st->gpiochip.ngpio * 2) / 8; ptr += 1) {
+		status <<= 8;
+		status |= ((unsigned long)buff[ptr]);
+	}
+
+	st->last_rx = (u16) (buff[0] << 8) | buff[1];
+	for (ptr = 0; ptr < st->gpiochip.ngpio; ptr++)
+		bp += sprintf(bp, "%s ", decode_input(status >> ptr));
+
+	*bp++ = '\n';
+
+	mutex_unlock(&st->lock);
+	return bp - buf;
+}
+
+static DEVICE_ATTR(input_status_show, S_IRUGO, tle8110_input_status_show, NULL);
+
+/**
+ * tle8110_serial_mode - Form serial mode command
+ * @ser_mode_cmd: current mode setting
+ * @gpio_num: gpio pin number
+ * @mode: 2-bit mode value
+ *
+ * Return: serial mode command
+ */
+static unsigned int tle8110_serial_mode(unsigned int ser_mode_cmd,
+					unsigned int bit_num, unsigned int mode)
+{
+	/* Remember - 2-bits/channel */
+	mode &= 3;
+	if (mode & 1)
+		ser_mode_cmd |= BIT(bit_num * 2);
+	else
+		ser_mode_cmd &= ~BIT(bit_num * 2);
+
+	if ((mode >> 1) & 1)
+		ser_mode_cmd |= BIT(bit_num * 2 + 1);
+	else
+		ser_mode_cmd &= ~BIT(bit_num * 2 + 1);
+
+	return ser_mode_cmd;
+}
+
+/**
+ * tle8110_gpio_direction_input - set gpio pin as input
+ * @chip: gpio_chip instance
+ * @offset: gpio pin number
+ *
+ * Return: 0 on success, -1 on error
+ */
+
+static int tle8110_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int gpio_num)
+{
+	int ret = 0;
+	struct tle8110_state *st = gpiochip_get_data(chip);
+	struct device *p_dev = chip->parent;
+
+	if (gpio_num >= TLE8110_GPIO_COUNT_MAX) {
+		dev_dbg(p_dev, "gpio pin number out of range\n");
+		return -EINVAL;
+	}
+	mutex_lock(&st->lock);
+	/* ISAx = ch6-1 ; ISBx = ch10-7. */
+	if (gpio_num < 6) {
+		st->ser_mode_a =
+		    tle8110_serial_mode(st->ser_mode_a, gpio_num, SER_MODE_IN);
+		ret = tle8110_write_cmd(st, st->ser_mode_a);
+		if (ret < 0) {
+			dev_err(p_dev, "tle8110_write_cmd() returned %d\n",
+				ret);
+			mutex_unlock(&st->lock);
+			return ret;
+		}
+	} else {
+		st->ser_mode_b =
+		    tle8110_serial_mode(st->ser_mode_b, gpio_num - 6,
+					SER_MODE_IN);
+		ret = tle8110_write_cmd(st, st->ser_mode_b);
+		if (ret < 0) {
+			dev_err(p_dev, "tle8110_write_cmd() returned %d\n",
+				ret);
+			mutex_unlock(&st->lock);
+			return ret;
+		}
+	}
+	mutex_unlock(&st->lock);
+	return ret;
+}
+
+/**
+ * tle8110_gpio_direction_output - set gpio pin as output
+ * @chip: gpio_chip instance
+ * @offset: gpio pin number
+ *
+ * Return: 0 on success, -1 on error
+ */
+
+static int tle8110_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned int gpio_num, int value)
+{
+	int ret = 0;
+	struct tle8110_state *st = gpiochip_get_data(chip);
+	struct device *p_dev = chip->parent;
+
+	if (gpio_num >= TLE8110_GPIO_COUNT_MAX) {
+		dev_err(p_dev, "gpio pin number out of range\n");
+		return -EINVAL;
+	}
+	mutex_lock(&st->lock);
+	/* ISAx = ch6-1 ; ISBx = ch10-7. */
+	if (gpio_num < 6) {
+		st->ser_mode_a = tle8110_serial_mode(st->ser_mode_a,
+						     gpio_num, SER_MODE_OUT);
+		ret = tle8110_write_cmd(st, st->ser_mode_a);
+		if (ret < 0) {
+			dev_err(p_dev, "tle8110_write_cmd() returned %d\n",
+				ret);
+			mutex_unlock(&st->lock);
+			return ret;
+		}
+	} else {
+		st->ser_mode_b = tle8110_serial_mode(st->ser_mode_b,
+						     gpio_num - 6,
+						     SER_MODE_OUT);
+		ret = tle8110_write_cmd(st, st->ser_mode_b);
+		if (ret < 0) {
+			dev_err(p_dev, "tle8110_write_cmd() returned %d\n",
+				ret);
+			mutex_unlock(&st->lock);
+			return ret;
+		}
+	}
+	mutex_unlock(&st->lock);
+	return ret;
+}
+
+/**
+ * tle8110_gpio_get - Read gpio input pin
+ * @chip: gpio_chip instance
+ * @offset: gpio pin number
+ *
+ * Return: gpio input pin value
+ */
+
+static int tle8110_gpio_get(struct gpio_chip *chip, unsigned int gpio_num)
+{
+	struct tle8110_state *st = gpiochip_get_data(chip);
+	struct device *p_dev = chip->parent;
+	u8 *rxbuff = st->rx_buff;
+	int value;
+	int ret;
+
+	if (gpio_num >= TLE8110_GPIO_COUNT_MAX) {
+		dev_err(p_dev, "gpio pin number out of range\n");
+		return -EINVAL;
+	}
+	mutex_lock(&st->lock);
+
+	/* CMD_RSD - Command: Return Input Status */
+	ret = tle8110_write_cmd(st, CMD_RINx);
+	if (ret < 0) {
+		dev_err(p_dev, "tle8110_write_cmd() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+
+	/* Read Short Diagnosis */
+	ret = tle8110_read_res(st);
+	if (ret < 0) {
+		dev_err(p_dev, "tle8110_read_resp() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return ret;
+	}
+
+	st->last_rx = (u16) (rxbuff[0] << 8) | rxbuff[1];	/* MSB First */
+	st->gpio_state = (unsigned long)(st->last_rx & 0x3ff);
+	value = (st->gpio_state >> gpio_num) & 1;
+	mutex_unlock(&st->lock);
+
+	return value;
+
+}
+
+/**
+ * tle8110_gpio_set - set/clear gpio output pin
+ * @chip: gpio_chip instance
+ * @offset: gpio pin number
+ * @value: 0 or 1
+ *
+ * Return: void
+ */
+
+static void tle8110_gpio_set(struct gpio_chip *chip, unsigned int gpio_num,
+			     int value)
+{
+	int ret;
+	struct tle8110_state *st = gpiochip_get_data(chip);
+	struct device *p_dev = chip->parent;
+
+	if (gpio_num >= TLE8110_GPIO_COUNT_MAX) {
+		dev_err(p_dev, "gpio pin number out of range\n");
+		return;
+	}
+	dev_dbg(p_dev, "setting gpio %d to %u\n", gpio_num, value);
+	mutex_lock(&st->lock);
+	if (value)
+		st->gpio_state |= BIT(gpio_num);
+	else
+		st->gpio_state &= ~BIT(gpio_num);
+
+	st->gpio_state &= TLE8110_CH_MASK;
+	ret = tle8110_write_cmd(st, OUTx | st->gpio_state);
+	if (ret < 0) {
+		dev_err(p_dev, "tle8110_write_cmd() returned %d\n", ret);
+		mutex_unlock(&st->lock);
+		return;
+	}
+	mutex_unlock(&st->lock);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id tle8110_of_table[] = {
+	{.compatible = "tle8110"},
+	{ /* Sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, tle8110_of_table);
+#endif
+
+/**
+ * tle8110_probe - Probe function
+ * @spi: struct spi_device
+ *
+ * Return:  0 on success. error value on failure
+ */
+static int tle8110_probe(struct spi_device *spi)
+{
+	struct tle8110_state *st;
+	int ret;
+#ifdef CONFIG_OF_GPIO
+	const struct of_device_id *of_id;
+#endif
+
+	st = devm_kzalloc(&spi->dev, sizeof(struct tle8110_state), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	st->spi = spi;
+
+	/* Default ser mode for bankA/B;keep track through-out life-time */
+	st->ser_mode_a = ISAx;
+	st->ser_mode_b = ISBx;
+
+	st->gpiochip.label = "tle8110-gpio";
+	st->gpiochip.parent = &spi->dev;
+	st->gpiochip.owner = THIS_MODULE;
+	st->gpiochip.ngpio = TLE8110_GPIO_COUNT_MAX;
+	st->gpiochip.base = -1;
+	st->gpiochip.direction_input = tle8110_gpio_direction_input;
+	st->gpiochip.direction_output = tle8110_gpio_direction_output;
+	st->gpiochip.get = tle8110_gpio_get;
+	st->gpiochip.set = tle8110_gpio_set;
+	st->gpiochip.can_sleep = 1;
+
+#ifdef CONFIG_OF_GPIO
+	st->gpiochip.of_node = spi->dev.of_node;
+
+	of_id = of_match_device(tle8110_of_table, &spi->dev);
+	if (!of_id) {
+		dev_err(&spi->dev,
+			"device tree entry not matched, using defaults\n");
+	}
+
+	ret = of_property_read_s32(st->gpiochip.of_node,
+		"gpio-base",
+		&st->gpiochip.base);
+	if (ret < 0) {
+		dev_err(&spi->dev,
+			"gpio-base property not found, using default gpio-base\n");
+	}
+#endif
+
+	ret = gpiochip_add(&st->gpiochip);
+	if (ret) {
+		dev_err(&spi->dev, "Failed adding gpiochip\n");
+		goto err_short_diag;
+	}
+
+	mutex_init(&st->lock);
+
+	ret = device_create_file(&spi->dev, &dev_attr_short_diag);
+	if (ret) {
+		dev_err(&spi->dev, "cannot create short_diag attribute\n");
+		goto err_short_diag;
+	}
+
+	ret = device_create_file(&spi->dev, &dev_attr_input_status_show);
+	if (ret) {
+		dev_err(&spi->dev,
+			"cannot create input_status_show attribute\n");
+		goto err_status;
+	}
+
+	ret = device_create_file(&spi->dev, &dev_attr_tle8110_cmd_res);
+	if (ret) {
+		dev_err(&spi->dev, "cannot create dev_attr_tle8110_cmd_res\n");
+		goto err_status1;
+	}
+
+	spi_set_drvdata(spi, st);
+
+	return 0;
+
+err_status1:
+	device_remove_file(&spi->dev, &dev_attr_input_status_show);
+err_status:
+	device_remove_file(&spi->dev, &dev_attr_short_diag);
+
+err_short_diag:
+	gpiochip_remove(&st->gpiochip);
+	return ret;
+}
+
+/**
+ * tle8110_remove - Remove function
+ * @spi: struct spi_device
+ *
+ * Return:  0 on success.
+ */
+static int tle8110_remove(struct spi_device *spi)
+{
+	struct tle8110_state *st = spi_get_drvdata(spi);
+
+	device_remove_file(&spi->dev, &dev_attr_input_status_show);
+	device_remove_file(&spi->dev, &dev_attr_short_diag);
+	device_remove_file(&spi->dev, &dev_attr_tle8110_cmd_res);
+	gpiochip_remove(&st->gpiochip);
+	return 0;
+}
+
+static struct spi_driver tle8110_driver = {
+	.driver = {
+		   .name = "tle8110",
+		   .owner = THIS_MODULE,
+#ifdef CONFIG_OF
+		   .of_match_table = tle8110_of_table,
+#endif
+		   },
+	.probe = tle8110_probe,
+	.remove = tle8110_remove,
+};
+
+module_spi_driver(tle8110_driver);
+
+MODULE_AUTHOR("Sanjay Tandel");
+MODULE_DESCRIPTION("TLE8110 GPIO driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("gpio:tle8110");
-- 
1.9.1

