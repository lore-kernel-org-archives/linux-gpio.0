From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v3] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Fri, 15 Jan 2016 10:51:04 +0000
Message-ID: <1452855064-5395-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
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

This patch applies to usb-next, which has a number of changes to the cp210x
driver in it, so I assumed that would be the correct tree to base this on.

V2: - Doesn't break build when gpiolib isn't selected.

V3: - Tracking GPIO state so pins no longer get their state changed should
      the pin be in open-drain mode and be pulled down externally whilst
      another pin is set.
    - Reworked buffers and moved to byte accesses to remove the
      questionable buffer size logic and byte swapping.
    - Added error reporting.
    - Removed incorrect/pointless comments.
    - Renamed tmp variable to make use clearer.

 drivers/usb/serial/cp210x.c | 196 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 191 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 8d839d3..4f6bd0a 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -23,6 +23,8 @@
 #include <linux/usb.h>
 #include <linux/uaccess.h>
 #include <linux/usb/serial.h>
+#include <linux/gpio/driver.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC "Silicon Labs CP210x RS232 serial adaptor driver"
 
@@ -44,10 +46,13 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
 static int cp210x_tiocmset_port(struct usb_serial_port *port,
 		unsigned int, unsigned int);
 static void cp210x_break_ctl(struct tty_struct *, int);
+static int cp210x_probe(struct usb_serial *, const struct usb_device_id *);
 static int cp210x_port_probe(struct usb_serial_port *);
 static int cp210x_port_remove(struct usb_serial_port *);
 static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
 
+#define CP210X_FEATURE_HAS_SHARED_GPIO		BIT(0)
+
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x045B, 0x0053) }, /* Renesas RX610 RX-Stick */
 	{ USB_DEVICE(0x0471, 0x066A) }, /* AKTAKOM ACE-1001 cable */
@@ -132,7 +137,8 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x10C4, 0x8A2A) }, /* HubZ dual ZigBee and Z-Wave dongle */
 	{ USB_DEVICE(0x10C4, 0xEA60) }, /* Silicon Labs factory default */
 	{ USB_DEVICE(0x10C4, 0xEA61) }, /* Silicon Labs factory default */
-	{ USB_DEVICE(0x10C4, 0xEA70) }, /* Silicon Labs factory default */
+	{ USB_DEVICE(0x10C4, 0xEA70),	/* Silicon Labs factory default */
+	  .driver_info = CP210X_FEATURE_HAS_SHARED_GPIO },
 	{ USB_DEVICE(0x10C4, 0xEA71) }, /* Infinity GPS-MIC-1 Radio Monophone */
 	{ USB_DEVICE(0x10C4, 0xF001) }, /* Elan Digital Systems USBscope50 */
 	{ USB_DEVICE(0x10C4, 0xF002) }, /* Elan Digital Systems USBwave12 */
@@ -200,6 +206,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
 struct cp210x_port_private {
 	__u8			bInterfaceNumber;
 	bool			has_swapped_line_ctl;
+#ifdef CONFIG_GPIOLIB
+	struct usb_serial	*serial;
+	struct gpio_chip	gc;
+	unsigned int		output_state;
+#endif
 };
 
 static struct usb_serial_driver cp210x_device = {
@@ -218,6 +229,7 @@ static struct usb_serial_driver cp210x_device = {
 	.tx_empty		= cp210x_tx_empty,
 	.tiocmget		= cp210x_tiocmget,
 	.tiocmset		= cp210x_tiocmset,
+	.probe			= cp210x_probe,
 	.port_probe		= cp210x_port_probe,
 	.port_remove		= cp210x_port_remove,
 	.dtr_rts		= cp210x_dtr_rts
@@ -260,6 +272,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CP210X_SET_CHARS	0x19
 #define CP210X_GET_BAUDRATE	0x1D
 #define CP210X_SET_BAUDRATE	0x1E
+#define CP210X_VENDOR_SPECIFIC	0xFF
 
 /* CP210X_IFC_ENABLE */
 #define UART_ENABLE		0x0001
@@ -302,6 +315,11 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CONTROL_WRITE_DTR	0x0100
 #define CONTROL_WRITE_RTS	0x0200
 
+/* CP210X_VENDOR_SPECIFIC values */
+#define CP210X_GET_DEVICEMODE	0x3711
+#define CP210X_WRITE_LATCH	0x37E1
+#define CP210X_READ_LATCH	0x00C2
+
 /* CP210X_GET_COMM_STATUS returns these 0x13 bytes */
 struct cp210x_comm_status {
 	__le32   ulErrors;
@@ -990,6 +1008,151 @@ static void cp210x_break_ctl(struct tty_struct *tty, int break_state)
 	cp210x_set_config(port, CP210X_SET_BREAK, &state, 2);
 }
 
+#ifdef CONFIG_GPIOLIB
+static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned gpio)
+{
+	return 0;
+}
+
+static int cp210x_gpio_get(struct gpio_chip *gc, unsigned gpio)
+{
+	struct cp210x_port_private *port_priv =
+			 container_of(gc, struct cp210x_port_private, gc);
+	struct usb_serial *serial = port_priv->serial;
+	u8 *buf;
+	int result;
+
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
+				 CP210X_VENDOR_SPECIFIC,
+				 REQTYPE_INTERFACE_TO_HOST, CP210X_READ_LATCH,
+				 port_priv->bInterfaceNumber, buf, 1,
+				 USB_CTRL_GET_TIMEOUT);
+	if (result != 1) {
+		dev_err(&serial->port[port_priv->bInterfaceNumber]->dev,
+			"failed to get gpio state: %d\n", result);
+		result = 0;
+		goto err;
+	}
+
+	result = (*buf >> gpio) & 0x1;
+
+	kfree(buf);
+err:
+	return result;
+}
+
+static void cp210x_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
+{
+	struct cp210x_port_private *port_priv =
+			 container_of(gc, struct cp210x_port_private, gc);
+	struct usb_serial *serial = port_priv->serial;
+
+	int result;
+	u8 *buf;
+
+	buf = kcalloc(2, sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return;
+
+	if (value == 0)
+		port_priv->output_state &= ~BIT(gpio);
+	else
+		port_priv->output_state |= BIT(gpio);
+
+	buf[1] = port_priv->output_state;
+
+	buf[0] = 0xFF;
+
+	result = usb_control_msg(serial->dev,
+				 usb_sndctrlpipe(serial->dev, 0),
+				 CP210X_VENDOR_SPECIFIC,
+				 REQTYPE_HOST_TO_INTERFACE, CP210X_WRITE_LATCH,
+				 port_priv->bInterfaceNumber, buf, 2,
+				 USB_CTRL_SET_TIMEOUT);
+
+	if (result != 2) {
+		dev_err(&serial->port[port_priv->bInterfaceNumber]->dev,
+			"failed to set gpio state: %d\n", result);
+		goto err;
+	}
+err:
+	kfree(buf);
+}
+
+static int cp210x_shared_gpio_init(struct usb_serial_port *port)
+{
+	struct usb_serial *serial = port->serial;
+	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+	u8 *buf;
+	unsigned long chip_features;
+	int result, i;
+
+	chip_features = (unsigned long)usb_get_serial_data(serial);
+
+	if ((chip_features & CP210X_FEATURE_HAS_SHARED_GPIO) == 0)
+		return 0;
+
+	buf = kcalloc(2, sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
+				 CP210X_VENDOR_SPECIFIC, REQTYPE_DEVICE_TO_HOST,
+				 CP210X_GET_DEVICEMODE,
+				 port_priv->bInterfaceNumber, buf,
+				 2, USB_CTRL_GET_TIMEOUT);
+
+	if (result != 2) {
+		dev_err(&port->dev, "failed to get device mode: %d\n", result);
+		if (result > 0)
+			result = -EPROTO;
+
+		goto err;
+	}
+
+	/*  2 banks of GPIO - One for the pins taken from each serial port */
+	if (port_priv->bInterfaceNumber == 0 && (buf[0] & 0xFF) != 0) {
+		port_priv->gc.label = "cp210x_eci";
+		port_priv->gc.ngpio = 2;
+	} else if (port_priv->bInterfaceNumber == 1 &&
+		   (buf[1] & 0xFF) != 0) {
+		port_priv->gc.label = "cp210x_sci";
+		port_priv->gc.ngpio = 3;
+	} else {
+		result = 0;
+		goto err;
+	}
+
+	port_priv->gc.get_direction = cp210x_gpio_direction_get;
+	port_priv->gc.get = cp210x_gpio_get;
+	port_priv->gc.set = cp210x_gpio_set;
+	port_priv->gc.owner = THIS_MODULE;
+	port_priv->gc.dev = &serial->dev->dev;
+	port_priv->gc.base = -1;
+
+	port_priv->serial = serial;
+
+	/*
+	 * Need to track the state of the output pins, the read function
+	 * returns value seen on the pin, not the value being currently
+	 * driven. The default is to initialise to high state.
+	 */
+	for (i = 0; i < port_priv->gc.ngpio; i++)
+		port_priv->output_state |= BIT(i);
+
+	result = gpiochip_add(&port_priv->gc);
+
+err:
+	kfree(buf);
+
+	return result;
+}
+#endif
+
 static int cp210x_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
@@ -1007,12 +1170,21 @@ static int cp210x_port_probe(struct usb_serial_port *port)
 	usb_set_serial_port_data(port, port_priv);
 
 	ret = cp210x_detect_swapped_line_ctl(port);
-	if (ret) {
-		kfree(port_priv);
-		return ret;
-	}
+	if (ret)
+		goto err_ctl;
+
+#ifdef CONFIG_GPIOLIB
+	ret = cp210x_shared_gpio_init(port);
+	if (ret < 0)
+		goto err_ctl;
+#endif
 
 	return 0;
+
+err_ctl:
+	kfree(port_priv);
+
+	return ret;
 }
 
 static int cp210x_port_remove(struct usb_serial_port *port)
@@ -1020,11 +1192,25 @@ static int cp210x_port_remove(struct usb_serial_port *port)
 	struct cp210x_port_private *port_priv;
 
 	port_priv = usb_get_serial_port_data(port);
+
+#ifdef CONFIG_GPIOLIB
+	if (port_priv->gc.label)
+		gpiochip_remove(&port_priv->gc);
+#endif
+
 	kfree(port_priv);
 
 	return 0;
 }
 
+static int cp210x_probe(struct usb_serial *serial,
+			const struct usb_device_id *id)
+{
+	usb_set_serial_data(serial, (void *)id->driver_info);
+
+	return 0;
+}
+
 module_usb_serial_driver(serial_drivers, id_table);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
