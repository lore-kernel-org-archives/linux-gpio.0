From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v11 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 20 Oct 2016 15:13:54 +0100
Message-ID: <77ba058a2f5c71c60e8148fadc3f2f4e8d92bc45.1476972764.git.martyn.welch@collabora.co.uk>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Karl Palsson <karlp-PhA6lrgffZtPR4JQBCEnsQ@public.gmane.org>, Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

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

Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
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

V8: - Re-fix for when gpiolib isn't selected.

V9: - Reverted to using cp210x_serial_private.
    - Use gpiochip_add_data rather than devm_gpiochip_add_data.
    - Tweak struct padding.
    - Use common GPIO Mode defines.
    - Use USB_CTRL_GET_TIMEOUT rather than USB_CTRL_SET_TIMEOUT when performing USB reads.
    - Tweak error messages and return values.
    - Add free'ing of priv.
    - Add disconnect and release functions (for correctly removing and releasing gpio).

v10:- Remove extraneous "u" in non-GLIOLIB path.

v11:- Reinstated partnum.
    - Passing struct usb_serial rather than adding to cp210x_serial_private.
    - Move cp210x_serial_private allocation to attach.
    - Allowing gpio_removal in release or disconnect.
    - Adding defines for pin modes.
    - Simplify cp210x_gpio_request logic.

 drivers/usb/serial/cp210x.c | 387 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 384 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 4d6a5c6..32ad3546 100644
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
 
@@ -44,6 +47,9 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
 static int cp210x_tiocmset_port(struct usb_serial_port *port,
 		unsigned int, unsigned int);
 static void cp210x_break_ctl(struct tty_struct *, int);
+static int cp210x_attach(struct usb_serial *);
+static void cp210x_disconnect(struct usb_serial *);
+static void cp210x_release(struct usb_serial *);
 static int cp210x_port_probe(struct usb_serial_port *);
 static int cp210x_port_remove(struct usb_serial_port *);
 static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
@@ -207,6 +213,16 @@ static const struct usb_device_id id_table[] = {
 
 MODULE_DEVICE_TABLE(usb, id_table);
 
+struct cp210x_serial_private {
+#ifdef CONFIG_GPIOLIB
+	struct gpio_chip	gc;
+	u8			config;
+	u8			gpio_mode;
+	u8			gpio_registered;
+#endif
+	u8			partnum;
+};
+
 struct cp210x_port_private {
 	__u8			bInterfaceNumber;
 	bool			has_swapped_line_ctl;
@@ -228,6 +244,9 @@ static struct usb_serial_driver cp210x_device = {
 	.tx_empty		= cp210x_tx_empty,
 	.tiocmget		= cp210x_tiocmget,
 	.tiocmset		= cp210x_tiocmset,
+	.attach			= cp210x_attach,
+	.disconnect		= cp210x_disconnect,
+	.release		= cp210x_release,
 	.port_probe		= cp210x_port_probe,
 	.port_remove		= cp210x_port_remove,
 	.dtr_rts		= cp210x_dtr_rts
@@ -270,6 +289,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CP210X_SET_CHARS	0x19
 #define CP210X_GET_BAUDRATE	0x1D
 #define CP210X_SET_BAUDRATE	0x1E
+#define CP210X_VENDOR_SPECIFIC	0xFF
 
 /* CP210X_IFC_ENABLE */
 #define UART_ENABLE		0x0001
@@ -312,6 +332,21 @@ static struct usb_serial_driver * const serial_drivers[] = {
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
@@ -367,6 +402,60 @@ struct cp210x_flow_ctl {
 #define CP210X_SERIAL_RTS_ACTIVE	1
 #define CP210X_SERIAL_RTS_FLOW_CTL	2
 
+/* CP210X_VENDOR_SPECIFIC, CP210X_GET_DEVICEMODE call reads these 0x2 bytes. */
+struct cp210x_pin_mode {
+	u8	eci;
+	u8	sci;
+} __packed;
+
+#define CP210X_PIN_MODE_MODEM		0
+#define CP210X_PIN_MODE_GPIO		BIT(0)
+
+/*
+ * CP210X_VENDOR_SPECIFIC, CP210X_GET_PORTCONFIG call reads these 0xf bytes.
+ * Structure needs padding due to unused/unspecified bytes.
+ */
+struct cp210x_config {
+	__le16	gpio_mode;
+	u8	__pad0[2];
+	__le16	reset_state;
+	u8	__pad1[4];
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
+#define CP2105_GPIO0_TXLED_MODE		BIT(0)
+#define CP2105_GPIO1_RXLED_MODE		BIT(1)
+#define CP2105_GPIO1_RS485_MODE		BIT(2)
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
@@ -463,6 +552,40 @@ static int cp210x_read_u8_reg(struct usb_serial_port *port, u8 req, u8 *val)
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
+				 USB_CTRL_GET_TIMEOUT);
+	if (result == bufsize) {
+		memcpy(buf, dmabuf, bufsize);
+		result = 0;
+	} else {
+		dev_err(&serial->interface->dev,
+			"failed to get vendor val 0x%04x size %d: %d\n", val,
+			bufsize, result);
+		if (result >= 0)
+			result = -EIO;
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
@@ -531,6 +654,42 @@ static int cp210x_write_u32_reg(struct usb_serial_port *port, u8 req, u32 val)
 	return cp210x_write_reg_block(port, req, &le32_val, sizeof(le32_val));
 }
 
+#ifdef CONFIG_GPIOLIB
+/*
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
+			"failed to set vendor val 0x%04x size %d: %d\n", val,
+			bufsize, result);
+		if (result >= 0)
+			result = -EIO;
+	}
+
+	return result;
+}
+#endif
+
 /*
  * Detect CP2108 GET_LINE_CTL bug and activate workaround.
  * Write a known good value 0x800, read it back.
@@ -1104,10 +1263,188 @@ static void cp210x_break_ctl(struct tty_struct *tty, int break_state)
 	cp210x_write_u16_reg(port, CP210X_SET_BREAK, state);
 }
 
+#ifdef CONFIG_GPIOLIB
+static int cp210x_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usb_serial *serial = gpiochip_get_data(gc);
+	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+
+	switch (offset) {
+	case 0:
+		if (priv->config & CP2105_GPIO0_TXLED_MODE)
+			return -ENODEV;
+		break;
+	case 1:
+		if (priv->config & (CP2105_GPIO1_RXLED_MODE |
+				    CP2105_GPIO1_RS485_MODE))
+			return -ENODEV;
+		break;
+	}
+
+	return 0;
+}
+
+static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct usb_serial *serial = gpiochip_get_data(gc);
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
+	struct usb_serial *serial = gpiochip_get_data(gc);
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
+	struct usb_serial *serial = gpiochip_get_data(gc);
+	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
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
+	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+	struct cp210x_pin_mode mode;
+	struct cp210x_config config;
+	u8 intf_num = cp210x_interface_num(serial);
+	int result;
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
+		if (mode.eci == CP210X_PIN_MODE_MODEM)
+			return 0;
+
+		priv->config = config.eci_cfg;
+		priv->gpio_mode = (u8)((le16_to_cpu(config.gpio_mode) &
+						CP210X_ECI_GPIO_MODE_MASK) >>
+						CP210X_ECI_GPIO_MODE_OFFSET);
+		priv->gc.ngpio = 2;
+	} else if (intf_num == 1) {
+		if (mode.sci == CP210X_PIN_MODE_MODEM)
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
+	result = gpiochip_add_data(&priv->gc, serial);
+	if (!result)
+		priv->gpio_registered = 1;
+
+	return result;
+}
+
+static void cp210x_gpio_remove(struct usb_serial *serial)
+{
+	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+
+	if (priv->gpio_registered) {
+		gpiochip_remove(&priv->gc);
+		priv->gpio_registered = 0;
+	}
+}
+
+#else
+
+static int cp2105_shared_gpio_init(struct usb_serial *serial)
+{
+	return 0;
+}
+
+static void cp210x_gpio_remove(struct usb_serial *serial)
+{
+	/* Nothing to do */
+}
+
+#endif
+
 static int cp210x_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
-	struct usb_host_interface *cur_altsetting;
 	struct cp210x_port_private *port_priv;
 	int ret;
 
@@ -1115,8 +1452,7 @@ static int cp210x_port_probe(struct usb_serial_port *port)
 	if (!port_priv)
 		return -ENOMEM;
 
-	cur_altsetting = serial->interface->cur_altsetting;
-	port_priv->bInterfaceNumber = cur_altsetting->desc.bInterfaceNumber;
+	port_priv->bInterfaceNumber = cp210x_interface_num(serial);
 
 	usb_set_serial_port_data(port, port_priv);
 
@@ -1139,6 +1475,51 @@ static int cp210x_port_remove(struct usb_serial_port *port)
 	return 0;
 }
 
+static int cp210x_attach(struct usb_serial *serial)
+{
+	int result;
+	struct cp210x_serial_private *priv;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+					  CP210X_GET_PARTNUM, &priv->partnum,
+					  sizeof(priv->partnum));
+	if (result < 0)
+		goto err_free_priv;
+
+	usb_set_serial_data(serial, priv);
+
+	if (priv->partnum == CP210X_PARTNUM_CP2105) {
+		result = cp2105_shared_gpio_init(serial);
+		if (result < 0)
+			dev_err(&serial->interface->dev,
+				"GPIO initialisation failed, continuing without GPIO support\n");
+	}
+
+	return 0;
+err_free_priv:
+	kfree(priv);
+
+	return result;
+}
+
+static void cp210x_disconnect(struct usb_serial *serial)
+{
+	cp210x_gpio_remove(serial);
+}
+
+static void cp210x_release(struct usb_serial *serial)
+{
+	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+
+	cp210x_gpio_remove(serial);
+
+	kfree(priv);
+}
+
 module_usb_serial_driver(serial_drivers, id_table);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
