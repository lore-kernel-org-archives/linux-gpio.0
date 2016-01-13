From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Wed, 13 Jan 2016 10:52:08 +0000
Message-ID: <56962C58.10301@collabora.co.uk>
References: <1452681107-32468-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39893 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933063AbcAMKwM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 05:52:12 -0500
In-Reply-To: <1452681107-32468-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org

Guess I *really* should have remembered to add the GPIO maintainers and 
mailing list to the original submission. (Damn you get_maintainers.pl 
for allowing me to be so lazy...)

Martyn

On 13/01/16 10:31, Martyn Welch wrote:
> This patch adds support for the GPIO found on the CP2105. Unlike the GPIO
> provided by some of the other devices supported by the cp210x driver, the
> GPIO on the CP2015 is muxed on pins otherwise used for serial control
> lines. The GPIO have been configured in 2 separate banks as the choice to
> configure the pins for GPIO is made separately for pins shared with each
> of the 2 serial ports this device provides, though the choice is made for
> all pins associated with that port in one go. The choice of whether to use
> the pins for GPIO or serial is made by adding configuration to a one-time
> programable PROM in the chip and can not be changed at runtime. The device
> defaults to GPIO.
>
> This device supports either push-pull or open-drain modes, it doesn't
> provide an explicit input mode, though the state of the GPIO can be read
> when used in open-drain mode. Like with pin use, the mode is configured in
> the one-time programable PROM and can't be changed at runtime.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
>
> This patch applies to usb-next, which has a number of changes to the cp210x
> driver in it, so I assumed that would be the correct tree to base this on.
>
>   drivers/usb/serial/cp210x.c | 211 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 207 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 8d839d3..3c1c22b 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -23,6 +23,8 @@
>   #include <linux/usb.h>
>   #include <linux/uaccess.h>
>   #include <linux/usb/serial.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/bitops.h>
>
>   #define DRIVER_DESC "Silicon Labs CP210x RS232 serial adaptor driver"
>
> @@ -44,10 +46,13 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
>   static int cp210x_tiocmset_port(struct usb_serial_port *port,
>   		unsigned int, unsigned int);
>   static void cp210x_break_ctl(struct tty_struct *, int);
> +static int cp210x_probe(struct usb_serial *, const struct usb_device_id *);
>   static int cp210x_port_probe(struct usb_serial_port *);
>   static int cp210x_port_remove(struct usb_serial_port *);
>   static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
>
> +#define CP210X_FEATURE_HAS_SHARED_GPIO		BIT(0)
> +
>   static const struct usb_device_id id_table[] = {
>   	{ USB_DEVICE(0x045B, 0x0053) }, /* Renesas RX610 RX-Stick */
>   	{ USB_DEVICE(0x0471, 0x066A) }, /* AKTAKOM ACE-1001 cable */
> @@ -132,7 +137,8 @@ static const struct usb_device_id id_table[] = {
>   	{ USB_DEVICE(0x10C4, 0x8A2A) }, /* HubZ dual ZigBee and Z-Wave dongle */
>   	{ USB_DEVICE(0x10C4, 0xEA60) }, /* Silicon Labs factory default */
>   	{ USB_DEVICE(0x10C4, 0xEA61) }, /* Silicon Labs factory default */
> -	{ USB_DEVICE(0x10C4, 0xEA70) }, /* Silicon Labs factory default */
> +	{ USB_DEVICE(0x10C4, 0xEA70),	/* Silicon Labs factory default */
> +	  .driver_info = CP210X_FEATURE_HAS_SHARED_GPIO },
>   	{ USB_DEVICE(0x10C4, 0xEA71) }, /* Infinity GPS-MIC-1 Radio Monophone */
>   	{ USB_DEVICE(0x10C4, 0xF001) }, /* Elan Digital Systems USBscope50 */
>   	{ USB_DEVICE(0x10C4, 0xF002) }, /* Elan Digital Systems USBwave12 */
> @@ -200,6 +206,8 @@ MODULE_DEVICE_TABLE(usb, id_table);
>   struct cp210x_port_private {
>   	__u8			bInterfaceNumber;
>   	bool			has_swapped_line_ctl;
> +	struct usb_serial	*serial;
> +	struct gpio_chip	gc;
>   };
>
>   static struct usb_serial_driver cp210x_device = {
> @@ -218,6 +226,7 @@ static struct usb_serial_driver cp210x_device = {
>   	.tx_empty		= cp210x_tx_empty,
>   	.tiocmget		= cp210x_tiocmget,
>   	.tiocmset		= cp210x_tiocmset,
> +	.probe			= cp210x_probe,
>   	.port_probe		= cp210x_port_probe,
>   	.port_remove		= cp210x_port_remove,
>   	.dtr_rts		= cp210x_dtr_rts
> @@ -260,6 +269,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
>   #define CP210X_SET_CHARS	0x19
>   #define CP210X_GET_BAUDRATE	0x1D
>   #define CP210X_SET_BAUDRATE	0x1E
> +#define CP210X_VENDOR_SPECIFIC	0xFF
>
>   /* CP210X_IFC_ENABLE */
>   #define UART_ENABLE		0x0001
> @@ -302,6 +312,11 @@ static struct usb_serial_driver * const serial_drivers[] = {
>   #define CONTROL_WRITE_DTR	0x0100
>   #define CONTROL_WRITE_RTS	0x0200
>
> +/* CP210X_VENDOR_SPECIFIC values */
> +#define CP210X_GET_DEVICEMODE	0x3711
> +#define CP210X_WRITE_LATCH	0x37E1
> +#define CP210X_READ_LATCH	0x00C2
> +
>   /* CP210X_GET_COMM_STATUS returns these 0x13 bytes */
>   struct cp210x_comm_status {
>   	__le32   ulErrors;
> @@ -990,11 +1005,175 @@ static void cp210x_break_ctl(struct tty_struct *tty, int break_state)
>   	cp210x_set_config(port, CP210X_SET_BREAK, &state, 2);
>   }
>
> +static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned gpio)
> +{
> +	return 0;
> +}
> +
> +static int cp210x_gpio_get(struct gpio_chip *gc, unsigned gpio)
> +{
> +	struct cp210x_port_private *port_priv =
> +			 container_of(gc, struct cp210x_port_private, gc);
> +	struct usb_serial *serial = port_priv->serial;
> +	__le32 *buf;
> +	int result, i, length;
> +	int size = 1;
> +	unsigned int data[size];
> +
> +	/* Number of integers required to contain the array */
> +	length = (((size - 1) | 3) + 1) / 4;
> +
> +	buf = kcalloc(length, sizeof(__le32), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* Issue the request, attempting to read 'size' bytes */
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_INTERFACE_TO_HOST, CP210X_READ_LATCH,
> +				 port_priv->bInterfaceNumber, buf, size,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != size) {
> +		result = 0;
> +		goto err;
> +	}
> +
> +	/* Convert data into an array of integers */
> +	for (i = 0; i < length; i++)
> +		data[i] = le32_to_cpu(buf[i]);
> +
> +	result = (data[0] >> gpio) & 0x1;
> +
> +	kfree(buf);
> +err:
> +	return result;
> +}
> +
> +static void cp210x_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
> +{
> +	struct cp210x_port_private *port_priv =
> +			 container_of(gc, struct cp210x_port_private, gc);
> +	struct usb_serial *serial = port_priv->serial;
> +
> +	int result, i, length;
> +	unsigned int data[1];
> +	__le32 *buf;
> +	int size = 2;
> +
> +	/* Number of integers required to contain the array */
> +	length = (((size - 1) | 3) + 1) / 4;
> +
> +	buf = kcalloc(length, sizeof(__le32), GFP_KERNEL);
> +	if (!buf) {
> +		WARN_ON("Unable to alloc memory to perform set");
> +		return;
> +	}
> +
> +	/* Issue the request, attempting to read 'size' bytes */
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_INTERFACE_TO_HOST, CP210X_READ_LATCH,
> +				 port_priv->bInterfaceNumber, buf, 1,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != 1) {
> +		WARN_ON("Failed to read data over usb");
> +		goto err;
> +	}
> +
> +	/* Convert data into an array of integers */
> +	for (i = 0; i < length; i++)
> +		data[i] = le32_to_cpu(buf[i]);
> +
> +	if (value == 0)
> +		data[0] &= ~BIT(gpio);
> +	else
> +		data[0] |= BIT(gpio);
> +
> +	data[0] = data[0] << 8;
> +
> +	data[0] |= 0x00FF;
> +
> +	/* Array of integers into bytes */
> +	for (i = 0; i < length; i++)
> +		buf[i] = cpu_to_le32(data[i]);
> +
> +	result = usb_control_msg(serial->dev,
> +				 usb_sndctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_HOST_TO_INTERFACE, CP210X_WRITE_LATCH,
> +				 port_priv->bInterfaceNumber, buf, size,
> +				 USB_CTRL_SET_TIMEOUT);
> +
> +	if (result != size) {
> +		WARN_ON("Failed to read data over usb");
> +		goto err;
> +	}
> +err:
> +	kfree(buf);
> +}
> +
> +static int cp210x_shared_gpio_init(struct usb_serial_port *port)
> +{
> +	struct usb_serial *serial = port->serial;
> +	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> +	__le32 *buf;
> +	int result, mode;
> +
> +	buf = kzalloc(sizeof(buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* Issue the request, attempting to read 'size' bytes */
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC, REQTYPE_DEVICE_TO_HOST,
> +				 CP210X_GET_DEVICEMODE,
> +				 port_priv->bInterfaceNumber, buf,
> +				 2, USB_CTRL_GET_TIMEOUT);
> +
> +	if (result != 2) {
> +		dev_err(&port->dev, "failed to get device mode: %d\n", result);
> +		if (result > 0)
> +			result = -EPROTO;
> +
> +		goto err;
> +	}
> +
> +	mode = le32_to_cpu(*buf);
> +
> +	/*  2 banks of GPIO - One for the pins taken from each serial port */
> +	if (port_priv->bInterfaceNumber == 0 && (mode & 0xFF) != 0) {
> +		port_priv->gc.label = "cp210x_eci";
> +		port_priv->gc.ngpio = 2;
> +	} else if (port_priv->bInterfaceNumber == 1 &&
> +		   ((mode >> 8) & 0xFF) != 0) {
> +		port_priv->gc.label = "cp210x_sci";
> +		port_priv->gc.ngpio = 3;
> +	} else {
> +		result = 0;
> +		goto err;
> +	}
> +
> +	port_priv->gc.get_direction = cp210x_gpio_direction_get;
> +	port_priv->gc.get = cp210x_gpio_get;
> +	port_priv->gc.set = cp210x_gpio_set;
> +	port_priv->gc.owner = THIS_MODULE;
> +	port_priv->gc.dev = &serial->dev->dev;
> +	port_priv->gc.base = -1;
> +
> +	result = gpiochip_add(&port_priv->gc);
> +
> +err:
> +	kfree(buf);
> +
> +	return result;
> +}
> +
>   static int cp210x_port_probe(struct usb_serial_port *port)
>   {
>   	struct usb_serial *serial = port->serial;
>   	struct usb_host_interface *cur_altsetting;
>   	struct cp210x_port_private *port_priv;
> +	unsigned long tmp;
>   	int ret;
>
>   	port_priv = kzalloc(sizeof(*port_priv), GFP_KERNEL);
> @@ -1003,16 +1182,28 @@ static int cp210x_port_probe(struct usb_serial_port *port)
>
>   	cur_altsetting = serial->interface->cur_altsetting;
>   	port_priv->bInterfaceNumber = cur_altsetting->desc.bInterfaceNumber;
> +	port_priv->serial = serial;
>
>   	usb_set_serial_port_data(port, port_priv);
>
>   	ret = cp210x_detect_swapped_line_ctl(port);
> -	if (ret) {
> -		kfree(port_priv);
> -		return ret;
> +	if (ret)
> +		goto err_ctl;
> +
> +	tmp = (unsigned long)usb_get_serial_data(serial);
> +
> +	if (tmp & CP210X_FEATURE_HAS_SHARED_GPIO) {
> +		ret = cp210x_shared_gpio_init(port);
> +		if (ret < 0)
> +			goto err_ctl;
>   	}
>
>   	return 0;
> +
> +err_ctl:
> +	kfree(port_priv);
> +
> +	return ret;
>   }
>
>   static int cp210x_port_remove(struct usb_serial_port *port)
> @@ -1020,11 +1211,23 @@ static int cp210x_port_remove(struct usb_serial_port *port)
>   	struct cp210x_port_private *port_priv;
>
>   	port_priv = usb_get_serial_port_data(port);
> +
> +	if (port_priv->gc.label)
> +		gpiochip_remove(&port_priv->gc);
> +
>   	kfree(port_priv);
>
>   	return 0;
>   }
>
> +static int cp210x_probe(struct usb_serial *serial,
> +			const struct usb_device_id *id)
> +{
> +	usb_set_serial_data(serial, (void *)id->driver_info);
> +
> +	return 0;
> +}
> +
>   module_usb_serial_driver(serial_drivers, id_table);
>
>   MODULE_DESCRIPTION(DRIVER_DESC);
>
