From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [PATCH v7 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Mon, 10 Oct 2016 14:39:41 +0100
Message-ID: <4dd49af853d72f579d9d24286e56be3e61937565.1476106708.git.martyn.welch@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43299 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752548AbcJJNjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 09:39:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>, Martyn Welch <martyn.welch@collabora.co.uk>

This patch adds support for the GPIO found on the CP2105. Unlike the GPIO
provided by some of the other devices supported by the cp210x driver, the
GPIO on the CP2015 is muxed on pins otherwise used for serial control
lines. The GPIO have been configured in 2 separate banks as the choice to
configure the pins for GPIO is made separately for pins shared with each
of the 2 serial ports this device provides, though the choice is made for
all pins associated with that port in one go. The choice of whether to use
the pins for GPIO or serial is made by adding configuration to a one-time
programable PROM in the chip and can not be changed at runtime. The device
defaults to GPIO.

This device supports either push-pull or open-drain modes, it doesn't
provide an explicit input mode, though the state of the GPIO can be read
when used in open-drain mode. Like with pin use, the mode is configured in
the one-time programable PROM and can't be changed at runtime.

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---

V2: - Doesn't break build when gpiolib isn't selected.

V3: - Tracking GPIO state so pins no longer get their state changed should
      the pin be in open-drain mode and be pulled down externally whilst
      another pin is set.
    - Reworked buffers and moved to byte accesses to remove the
      questionable buffer size logic and byte swapping.
    - Added error reporting.
    - Removed incorrect/pointless comments.
    - Renamed tmp variable to make use clearer.

V4: - Fixed memory leak in cp210x_gpio_get error path.

V5: - Determining shared GPIO based on device type.
    - Reordered vendor specific values by value.
    - Use interface device for gpio messages.
    - Remove unnecessary empty lines.
    - Using kzalloc rather than kcalloc.
    - Added locking to port_priv->output_state.
    - Added dummy cp2105_shared_gpio_init for !CONFIG_GPIOLIB.
    - Removed unnecessary masking on u8.
    - Added support for use of GPIO pin as RS485 traffic indication or
      activity LEDs.
    - Use correct dev for GPIO device.
    - Set can_sleep.
    - Roll in initial configuration state support.
    - Print error message & continue if GPIO fails.
    - Simplified ifdef'ing.

V6: - Remove unused define.
    - Renamed cp210x_dev_private, cp210x_serial_private.
    - Moved GPIO variables to cp210x_serial_private.
    - Renamed PARTNUM defines.
    - Switched to using bitops for GPIO mode bits.
    - Moved vendor-specific defiles to end of defines.
    - Added helpers for vendor requests.
    - Using structs rather than byte arrays for sent and recieved values.
    - Exposing total number of GPIOs and refusing requests for pins not
      configured as GPIO, removing gpio_map in process.
    - Added checks for allocation failures.
    - Using same label for both banks of GPIO.
    - Moved GPIO into to attach function.

V7: - Using GPIO private data for GPIO bits.
    - Adding limited .set_single_ended() and direction support.
    - Simplifying attach() and removing release() as it's no longer required.

 drivers/usb/serial/cp210x.c | 362 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 359 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 4d6a5c6..b82c4ab 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -23,6 +23,9 @@
 #include <linux/usb.h>
 #include <linux/uaccess.h>
 #include <linux/usb/serial.h>
+#include <linux/gpio/driver.h>
+#include <linux/bitops.h>
+#include <linux/mutex.h>
 
 #define DRIVER_DESC "Silicon Labs CP210x RS232 serial adaptor driver"
 
@@ -44,6 +47,7 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
 static int cp210x_tiocmset_port(struct usb_serial_port *port,
 		unsigned int, unsigned int);
 static void cp210x_break_ctl(struct tty_struct *, int);
+static int cp210x_attach(struct usb_serial *);
 static int cp210x_port_probe(struct usb_serial_port *);
 static int cp210x_port_remove(struct usb_serial_port *);
 static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
@@ -207,6 +211,13 @@ static const struct usb_device_id id_table[] = {
 
 MODULE_DEVICE_TABLE(usb, id_table);
 
+struct cp210x_gpio_private {
+	struct usb_serial	*serial;
+	struct gpio_chip	gc;
+	u8			config;
+	u8			gpio_mode;
+};
+
 struct cp210x_port_private {
 	__u8			bInterfaceNumber;
 	bool			has_swapped_line_ctl;
@@ -228,6 +239,7 @@ static struct usb_serial_driver cp210x_device = {
 	.tx_empty		= cp210x_tx_empty,
 	.tiocmget		= cp210x_tiocmget,
 	.tiocmset		= cp210x_tiocmset,
+	.attach			= cp210x_attach,
 	.port_probe		= cp210x_port_probe,
 	.port_remove		= cp210x_port_remove,
 	.dtr_rts		= cp210x_dtr_rts
@@ -270,6 +282,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CP210X_SET_CHARS	0x19
 #define CP210X_GET_BAUDRATE	0x1D
 #define CP210X_SET_BAUDRATE	0x1E
+#define CP210X_VENDOR_SPECIFIC	0xFF
 
 /* CP210X_IFC_ENABLE */
 #define UART_ENABLE		0x0001
@@ -312,6 +325,21 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CONTROL_WRITE_DTR	0x0100
 #define CONTROL_WRITE_RTS	0x0200
 
+/* CP210X_VENDOR_SPECIFIC values */
+#define CP210X_READ_LATCH	0x00C2
+#define CP210X_GET_PARTNUM	0x370B
+#define CP210X_GET_PORTCONFIG	0x370C
+#define CP210X_GET_DEVICEMODE	0x3711
+#define CP210X_WRITE_LATCH	0x37E1
+
+/* Part number definitions */
+#define CP210X_PARTNUM_CP2101	0x01
+#define CP210X_PARTNUM_CP2102	0x02
+#define CP210X_PARTNUM_CP2103	0x03
+#define CP210X_PARTNUM_CP2104	0x04
+#define CP210X_PARTNUM_CP2105	0x05
+#define CP210X_PARTNUM_CP2108	0x08
+
 /* CP210X_GET_COMM_STATUS returns these 0x13 bytes */
 struct cp210x_comm_status {
 	__le32   ulErrors;
@@ -367,6 +395,61 @@ struct cp210x_flow_ctl {
 #define CP210X_SERIAL_RTS_ACTIVE	1
 #define CP210X_SERIAL_RTS_FLOW_CTL	2
 
+/* CP210X_VENDOR_SPECIFIC, CP210X_GET_DEVICEMODE call reads these 0x2 bytes. */
+struct cp210x_pin_mode {
+	u8	eci;
+	u8	sci;
+} __packed;
+
+/*
+ * CP210X_VENDOR_SPECIFIC, CP210X_GET_DEVICEMODE call reads these 0xf bytes.
+ * Structure needs padding due to unused/unspecified bytes.
+ */
+struct cp210x_config {
+	__le16	gpio_mode;
+	__le16	__pad0;
+	__le16	reset_state;
+	__le16	__pad1;
+	__le16	__pad2;
+	__le16	suspend_state;
+	u8	sci_cfg;
+	u8	eci_cfg;
+	u8	device_cfg;
+} __packed;
+
+/* GPIO modes */
+#define CP210X_SCI_GPIO_MODE_OFFSET	9
+#define CP210X_SCI_GPIO_MODE_MASK	GENMASK(11, 9)
+
+#define CP210X_ECI_GPIO_MODE_OFFSET	2
+#define CP210X_ECI_GPIO_MODE_MASK	GENMASK(3, 2)
+
+/* CP2105 port configuration values */
+#define CP2105_SCI_GPIO0_TXLED_MODE	BIT(0)
+#define CP2105_SCI_GPIO1_RXLED_MODE	BIT(1)
+
+#define CP2105_ECI_GPIO0_TXLED_MODE	BIT(0)
+#define CP2105_ECI_GPIO1_RXLED_MODE	BIT(1)
+#define CP2105_ECI_GPIO1_RS485_MODE	BIT(2)
+
+/* CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these 0x2 bytes. */
+struct cp210x_gpio_write {
+	u8	mask;
+	u8	state;
+} __packed;
+
+/*
+ * Helper to get interface number when we only have struct usb_serial.
+ */
+static u8 cp210x_interface_num(struct usb_serial *serial)
+{
+	struct usb_host_interface *cur_altsetting;
+
+	cur_altsetting = serial->interface->cur_altsetting;
+
+	return cur_altsetting->desc.bInterfaceNumber;
+}
+
 /*
  * Reads a variable-sized block of CP210X_ registers, identified by req.
  * Returns data into buf in native USB byte order.
@@ -463,6 +546,40 @@ static int cp210x_read_u8_reg(struct usb_serial_port *port, u8 req, u8 *val)
 }
 
 /*
+ * Reads a variable-sized vendor block of CP210X_ registers, identified by val.
+ * Returns data into buf in native USB byte order.
+ */
+static int cp210x_read_vendor_block(struct usb_serial *serial, u8 type, u16 val,
+				    void *buf, int bufsize)
+{
+	void *dmabuf;
+	int result;
+
+	dmabuf = kmalloc(bufsize, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
+				 CP210X_VENDOR_SPECIFIC, type, val,
+				 cp210x_interface_num(serial), dmabuf, bufsize,
+				 USB_CTRL_SET_TIMEOUT);
+	if (result == bufsize) {
+		memcpy(buf, dmabuf, bufsize);
+		result = 0;
+	} else {
+		dev_err(&serial->interface->dev,
+			"failed get vendor val 0x%x size %d status: %d\n", val,
+			bufsize, result);
+		if (result >= 0)
+			result = -EPROTO;
+	}
+
+	kfree(dmabuf);
+
+	return result;
+}
+
+/*
  * Writes any 16-bit CP210X_ register (req) whose value is passed
  * entirely in the wValue field of the USB request.
  */
@@ -532,6 +649,40 @@ static int cp210x_write_u32_reg(struct usb_serial_port *port, u8 req, u32 val)
 }
 
 /*
+ * Writes a variable-sized vendor block of CP210X_ registers, identified by val.
+ * Data in buf must be in native USB byte order.
+ */
+static int cp210x_write_vendor_block(struct usb_serial *serial, u8 type,
+				     u16 val, void *buf, int bufsize)
+{
+	void *dmabuf;
+	int result;
+
+	dmabuf = kmemdup(buf, bufsize, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
+				 CP210X_VENDOR_SPECIFIC, type, val,
+				 cp210x_interface_num(serial), dmabuf, bufsize,
+				 USB_CTRL_SET_TIMEOUT);
+
+	kfree(dmabuf);
+
+	if (result == bufsize) {
+		result = 0;
+	} else {
+		dev_err(&serial->interface->dev,
+			"failed set vendor val 0x%x size %d status: %d\n", val,
+			bufsize, result);
+		if (result >= 0)
+			result = -EPROTO;
+	}
+
+	return result;
+}
+
+/*
  * Detect CP2108 GET_LINE_CTL bug and activate workaround.
  * Write a known good value 0x800, read it back.
  * If it comes back swapped the bug is detected.
@@ -1104,10 +1255,195 @@ static void cp210x_break_ctl(struct tty_struct *tty, int break_state)
 	cp210x_write_u16_reg(port, CP210X_SET_BREAK, state);
 }
 
+#ifdef CONFIG_GPIOLIB
+static int cp210x_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct cp210x_gpio_private *priv = gpiochip_get_data(gc);
+	u8 intf_num = cp210x_interface_num(priv->serial);
+
+	if (intf_num == 0) {
+		switch (offset) {
+		case 0:
+			if (priv->config & CP2105_ECI_GPIO0_TXLED_MODE)
+				return -ENODEV;
+			break;
+		case 1:
+			if (priv->config & (CP2105_ECI_GPIO1_RXLED_MODE |
+					  CP2105_ECI_GPIO1_RS485_MODE))
+				return -ENODEV;
+			break;
+		}
+	} else if (intf_num == 1) {
+		switch (offset) {
+		case 0:
+			if (priv->config & CP2105_SCI_GPIO0_TXLED_MODE)
+			return -ENODEV;
+		case 1:
+			if (priv->config & CP2105_SCI_GPIO1_RXLED_MODE)
+				return -ENODEV;
+			break;
+		}
+	} else {
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct cp210x_gpio_private *priv = gpiochip_get_data(gc);
+	struct usb_serial *serial = priv->serial;
+	int result;
+	u8 buf;
+
+	result = cp210x_read_vendor_block(serial, REQTYPE_INTERFACE_TO_HOST,
+					  CP210X_READ_LATCH, &buf, sizeof(buf));
+	if (result < 0)
+		return result;
+
+	return !!(buf & BIT(gpio));
+}
+
+static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	struct cp210x_gpio_private *priv = gpiochip_get_data(gc);
+	struct usb_serial *serial = priv->serial;
+	struct cp210x_gpio_write buf;
+
+	if (value == 1)
+		buf.state = BIT(gpio);
+	else
+		buf.state = 0;
+
+	buf.mask = BIT(gpio);
+
+	cp210x_write_vendor_block(serial, REQTYPE_HOST_TO_INTERFACE,
+				  CP210X_WRITE_LATCH, &buf, sizeof(buf));
+}
+
+static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	/* Hardware does not support an input mode */
+	return 0;
+}
+
+static int cp210x_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	/* Hardware does not support an input mode */
+	return -ENOTSUPP;
+}
+
+static int cp210x_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
+					int value)
+{
+	return 0;
+}
+
+static int cp210x_gpio_set_single_ended(struct gpio_chip *gc, unsigned int gpio,
+					enum single_ended_mode mode)
+{
+	struct cp210x_gpio_private *priv = gpiochip_get_data(gc);
+
+	/* Succeed only if in correct mode (this can't be set at runtime) */
+	if ((mode == LINE_MODE_PUSH_PULL) && (priv->gpio_mode & BIT(gpio)))
+		return 0;
+
+	if ((mode == LINE_MODE_OPEN_DRAIN) && !(priv->gpio_mode & BIT(gpio)))
+		return 0;
+
+	return -ENOTSUPP;
+}
+
+/*
+ * This function is for configuring GPIO using shared pins, where other signals
+ * are made unavailable by configuring the use of GPIO. This is believed to be
+ * only applicable to the cp2105 at this point, the other devices supported by
+ * this driver that provide GPIO do so in a way that does not impact other
+ * signals and are thus expected to have very different initialisation.
+ */
+static int cp2105_shared_gpio_init(struct usb_serial *serial)
+{
+	struct cp210x_gpio_private *priv;
+	struct cp210x_pin_mode mode;
+	struct cp210x_config config;
+	u8 intf_num = cp210x_interface_num(serial);
+	int result;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+					  CP210X_GET_DEVICEMODE, &mode,
+					  sizeof(mode));
+	if (result < 0)
+		return result;
+
+	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+					  CP210X_GET_PORTCONFIG, &config,
+					  sizeof(config));
+	if (result < 0)
+		return result;
+
+	/*  2 banks of GPIO - One for the pins taken from each serial port */
+	if (intf_num == 0) {
+		if (mode.eci == 0)
+			return 0;
+
+		priv->config = config.eci_cfg;
+		priv->gpio_mode = (u8)((le16_to_cpu(config.gpio_mode) &
+						CP210X_ECI_GPIO_MODE_MASK) >>
+						CP210X_ECI_GPIO_MODE_OFFSET);
+		priv->gc.ngpio = 2;
+	} else if (intf_num == 1) {
+		if (mode.sci == 0)
+			return 0;
+
+		priv->config = config.sci_cfg;
+		priv->gpio_mode = (u8)((le16_to_cpu(config.gpio_mode) &
+						CP210X_SCI_GPIO_MODE_MASK) >>
+						CP210X_SCI_GPIO_MODE_OFFSET);
+		priv->gc.ngpio = 3;
+	} else {
+		return -ENODEV;
+	}
+
+	priv->gc.label = "cp210x";
+	priv->gc.request = cp210x_gpio_request;
+	priv->gc.get_direction = cp210x_gpio_direction_get;
+	priv->gc.direction_input = cp210x_gpio_direction_input;
+	priv->gc.direction_output = cp210x_gpio_direction_output;
+	priv->gc.get = cp210x_gpio_get;
+	priv->gc.set = cp210x_gpio_set;
+	priv->gc.set_single_ended = cp210x_gpio_set_single_ended;
+	priv->gc.owner = THIS_MODULE;
+	priv->gc.parent = &serial->interface->dev;
+	priv->gc.base = -1;
+	priv->gc.can_sleep = true;
+
+	priv->serial = serial;
+
+	result = devm_gpiochip_add_data(&serial->interface->dev, &priv->gc,
+					priv);
+
+	if (result < 0)
+		priv->gc.label = NULL;
+
+	return result;
+}
+
+#else
+
+static int cp2105_shared_gpio_init(struct usb_serial *serial)
+{
+	return 0;
+}
+#endif
+
 static int cp210x_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
-	struct usb_host_interface *cur_altsetting;
 	struct cp210x_port_private *port_priv;
 	int ret;
 
@@ -1115,8 +1451,7 @@ static int cp210x_port_probe(struct usb_serial_port *port)
 	if (!port_priv)
 		return -ENOMEM;
 
-	cur_altsetting = serial->interface->cur_altsetting;
-	port_priv->bInterfaceNumber = cur_altsetting->desc.bInterfaceNumber;
+	port_priv->bInterfaceNumber = cp210x_interface_num(serial);
 
 	usb_set_serial_port_data(port, port_priv);
 
@@ -1139,6 +1474,27 @@ static int cp210x_port_remove(struct usb_serial_port *port)
 	return 0;
 }
 
+static int cp210x_attach(struct usb_serial *serial)
+{
+	int result;
+	u8 partnum;
+
+	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+					  CP210X_GET_PARTNUM, &partnum,
+					  sizeof(partnum));
+	if (result < 0)
+		return result;
+
+	if (partnum == CP210X_PARTNUM_CP2105) {
+		result = cp2105_shared_gpio_init(serial);
+		if (result < 0)
+			dev_err(&serial->interface->dev,
+				"GPIO initialisation failed, continuing without GPIO support\n");
+	}
+
+	return 0;
+}
+
 module_usb_serial_driver(serial_drivers, id_table);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
1.8.3.1

