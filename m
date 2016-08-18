From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [RESEND PATCH v5 1/1] USB: serial: cp210x: Adding GPIO support
 for CP2105
Date: Thu, 18 Aug 2016 09:52:22 +0100
Message-ID: <f258f097-dd9a-7c6e-15d6-d72bb13c361a@collabora.co.uk>
References: <cover.1469182892.git.martyn.welch@collabora.co.uk>
 <48345361784d4f2f9b81bf41d34ff17510bd4d80.1469182892.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56179 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752761AbcHRIw0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2016 04:52:26 -0400
In-Reply-To: <48345361784d4f2f9b81bf41d34ff17510bd4d80.1469182892.git.martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Johan, back in May you said:

I have three patches in my queue that didn't make the cut due to lack
off time on my side. They're at the top of the list.

Sorry about the delay.

Yet I've heard nothing since. Is there something wrong with this patch?

Martyn

On 22/07/16 11:33, Martyn Welch wrote:
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
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>
> V2: - Doesn't break build when gpiolib isn't selected.
>
> V3: - Tracking GPIO state so pins no longer get their state changed should
>       the pin be in open-drain mode and be pulled down externally whilst
>       another pin is set.
>     - Reworked buffers and moved to byte accesses to remove the
>       questionable buffer size logic and byte swapping.
>     - Added error reporting.
>     - Removed incorrect/pointless comments.
>     - Renamed tmp variable to make use clearer.
>
> V4: - Fixed memory leak in cp210x_gpio_get error path.
>
> V5: - Determining shared GPIO based on device type.
>     - Reordered vendor specific values by value.
>     - Use interface device for gpio messages.
>     - Remove unnecessary empty lines.
>     - Using kzalloc rather than kcalloc.
>     - Added locking to port_priv->output_state.
>     - Added dummy cp2105_shared_gpio_init for !CONFIG_GPIOLIB.
>     - Removed unnecessary masking on u8.
>     - Added support for use of GPIO pin as RS485 traffic indication or
>       activity LEDs.
>     - Use correct dev for GPIO device.
>     - Set can_sleep.
>     - Roll in initial configuration state support.
>     - Print error message & continue if GPIO fails.
>     - Simplified ifdef'ing.
>
>  drivers/usb/serial/cp210x.c | 351 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 348 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 4d6a5c6..b3153b8 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -23,6 +23,9 @@
>  #include <linux/usb.h>
>  #include <linux/uaccess.h>
>  #include <linux/usb/serial.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/bitops.h>
> +#include <linux/mutex.h>
>
>  #define DRIVER_DESC "Silicon Labs CP210x RS232 serial adaptor driver"
>
> @@ -44,10 +47,14 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
>  static int cp210x_tiocmset_port(struct usb_serial_port *port,
>  		unsigned int, unsigned int);
>  static void cp210x_break_ctl(struct tty_struct *, int);
> +static int cp210x_attach(struct usb_serial *);
> +static void cp210x_release(struct usb_serial *);
>  static int cp210x_port_probe(struct usb_serial_port *);
>  static int cp210x_port_remove(struct usb_serial_port *);
>  static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
>
> +#define CP210X_FEATURE_HAS_SHARED_GPIO		BIT(0)
> +
>  static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(0x045B, 0x0053) }, /* Renesas RX610 RX-Stick */
>  	{ USB_DEVICE(0x0471, 0x066A) }, /* AKTAKOM ACE-1001 cable */
> @@ -207,9 +214,20 @@ static const struct usb_device_id id_table[] = {
>
>  MODULE_DEVICE_TABLE(usb, id_table);
>
> +struct cp210x_dev_private {
> +	u8	partnum;
> +};
> +
>  struct cp210x_port_private {
>  	__u8			bInterfaceNumber;
>  	bool			has_swapped_line_ctl;
> +#ifdef CONFIG_GPIOLIB
> +	struct usb_serial	*serial;
> +	struct gpio_chip	gc;
> +	struct mutex		output_lock;
> +	unsigned int		output_state;
> +	unsigned int		*gpio_map;
> +#endif
>  };
>
>  static struct usb_serial_driver cp210x_device = {
> @@ -228,6 +246,8 @@ static struct usb_serial_driver cp210x_device = {
>  	.tx_empty		= cp210x_tx_empty,
>  	.tiocmget		= cp210x_tiocmget,
>  	.tiocmset		= cp210x_tiocmset,
> +	.attach			= cp210x_attach,
> +	.release		= cp210x_release,
>  	.port_probe		= cp210x_port_probe,
>  	.port_remove		= cp210x_port_remove,
>  	.dtr_rts		= cp210x_dtr_rts
> @@ -270,6 +290,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
>  #define CP210X_SET_CHARS	0x19
>  #define CP210X_GET_BAUDRATE	0x1D
>  #define CP210X_SET_BAUDRATE	0x1E
> +#define CP210X_VENDOR_SPECIFIC	0xFF
>
>  /* CP210X_IFC_ENABLE */
>  #define UART_ENABLE		0x0001
> @@ -312,6 +333,30 @@ static struct usb_serial_driver * const serial_drivers[] = {
>  #define CONTROL_WRITE_DTR	0x0100
>  #define CONTROL_WRITE_RTS	0x0200
>
> +/* CP210X_VENDOR_SPECIFIC values */
> +#define CP210X_READ_LATCH	0x00C2
> +#define CP210X_GET_PARTNUM	0x370B
> +#define CP210X_GET_PORTCONFIG	0x370C
> +#define CP210X_GET_DEVICEMODE	0x3711
> +#define CP210X_WRITE_LATCH	0x37E1
> +
> +/* Part number definitions */
> +#define CP2101_PARTNUM		0x01
> +#define CP2102_PARTNUM		0x02
> +#define CP2103_PARTNUM		0x03
> +#define CP2104_PARTNUM		0x04
> +#define CP2105_PARTNUM		0x05
> +#define CP2108_PARTNUM		0x08
> +
> +/* CP2105 port configuration values */
> +#define CP2105_SCI_GPIO0_TXLED_MODE	0x01
> +#define CP2105_SCI_GPIO1_RXLED_MODE	0x02
> +
> +
> +#define CP2105_ECI_GPIO0_TXLED_MODE	0x01
> +#define CP2105_ECI_GPIO1_RXLED_MODE	0x02
> +#define CP2105_ECI_GPIO1_RS485_MODE	0x04
> +
>  /* CP210X_GET_COMM_STATUS returns these 0x13 bytes */
>  struct cp210x_comm_status {
>  	__le32   ulErrors;
> @@ -1104,11 +1149,263 @@ static void cp210x_break_ctl(struct tty_struct *tty, int break_state)
>  	cp210x_write_u16_reg(port, CP210X_SET_BREAK, state);
>  }
>
> +#ifdef CONFIG_GPIOLIB
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
> +	u8 *buf;
> +	int result;
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_INTERFACE_TO_HOST, CP210X_READ_LATCH,
> +				 port_priv->bInterfaceNumber, buf, 1,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != 1) {
> +		dev_err(&serial->interface->dev,
> +			"failed to get gpio state: %d\n", result);
> +		result = 0;
> +		goto err;
> +	}
> +
> +	result = (*buf >> port_priv->gpio_map[gpio]) & 0x1;
> +
> +err:
> +	kfree(buf);
> +
> +	return result;
> +}
> +
> +static void cp210x_gpio_set(struct gpio_chip *gc, unsigned gpio, int value)
> +{
> +	struct cp210x_port_private *port_priv =
> +			 container_of(gc, struct cp210x_port_private, gc);
> +	struct usb_serial *serial = port_priv->serial;
> +	int result;
> +	u8 *buf;
> +
> +	buf = kzalloc(sizeof(*buf) * 2, GFP_KERNEL);
> +	if (!buf)
> +		return;
> +
> +	mutex_lock(&port_priv->output_lock);
> +
> +	if (value == 0)
> +		port_priv->output_state &= ~BIT(port_priv->gpio_map[gpio]);
> +	else
> +		port_priv->output_state |= BIT(port_priv->gpio_map[gpio]);
> +
> +	mutex_unlock(&port_priv->output_lock);
> +
> +	buf[1] = port_priv->output_state;
> +	buf[0] = 0xFF;
> +
> +	result = usb_control_msg(serial->dev,
> +				 usb_sndctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_HOST_TO_INTERFACE, CP210X_WRITE_LATCH,
> +				 port_priv->bInterfaceNumber, buf, 2,
> +				 USB_CTRL_SET_TIMEOUT);
> +	if (result != 2) {
> +		dev_err(&serial->interface->dev,
> +			"failed to set gpio state: %d\n", result);
> +	}
> +
> +	kfree(buf);
> +}
> +
> +/*
> + * This function is for configuring GPIO using shared pins, where other signals
> + * are made unavailable by configuring the use of GPIO. This is believed to be
> + * only applicable to the cp2105 at this point, the other devices supported by
> + * this driver that provide GPIO do so in a way that does not impact other
> + * signals and are thus expected to have very different initialisation.
> + */
> +static int cp2105_shared_gpio_init(struct usb_serial_port *port)
> +{
> +	struct usb_serial *serial = port->serial;
> +	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> +	u8 *mode;
> +	u8 *config;
> +	int result;
> +	int i;
> +
> +	mode = kzalloc(sizeof(*mode) * 2, GFP_KERNEL);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	config = kzalloc(sizeof(*config) * 15, GFP_KERNEL);
> +	if (!config) {
> +		result = -ENOMEM;
> +		goto err1;
> +	}
> +
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC, REQTYPE_DEVICE_TO_HOST,
> +				 CP210X_GET_DEVICEMODE,
> +				 port_priv->bInterfaceNumber, mode,
> +				 2, USB_CTRL_GET_TIMEOUT);
> +	if (result != 2) {
> +		dev_err(&port->dev, "failed to get device mode: %d\n", result);
> +		if (result > 0)
> +			result = -EPROTO;
> +
> +		goto err2;
> +	}
> +
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC, REQTYPE_DEVICE_TO_HOST,
> +				 CP210X_GET_PORTCONFIG,
> +				 port_priv->bInterfaceNumber, config, 15,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != 15) {
> +		dev_err(&port->dev, "failed to get port config: %d\n", result);
> +		if (result > 0)
> +			result = -EPROTO;
> +
> +		goto err2;
> +	}
> +
> +	/*  2 banks of GPIO - One for the pins taken from each serial port */
> +	if (port_priv->bInterfaceNumber == 0) {
> +		if (mode[0] == 0) {
> +			result = 0;
> +			goto err2;
> +		}
> +
> +		port_priv->gc.label = "cp210x_eci";
> +		port_priv->gc.ngpio = 2;
> +		port_priv->gpio_map = kzalloc(sizeof(*port_priv->gpio_map) *
> +					      port_priv->gc.ngpio,
> +					      GFP_KERNEL);
> +
> +		i = 0;
> +
> +		if (config[13] & CP2105_ECI_GPIO0_TXLED_MODE) {
> +			port_priv->gc.ngpio -= 1;
> +		} else {
> +			port_priv->gpio_map[i] = 0;
> +			i++;
> +		}
> +
> +		if (config[13] & (CP2105_ECI_GPIO1_RXLED_MODE |
> +				  CP2105_ECI_GPIO1_RS485_MODE)) {
> +			port_priv->gc.ngpio -= 1;
> +		} else {
> +			port_priv->gpio_map[i] = 1;
> +			i++;
> +		}
> +
> +		if (port_priv->gc.ngpio == 0) {
> +			result = 0;
> +			goto err2;
> +		}
> +	} else if (port_priv->bInterfaceNumber == 1) {
> +		if (mode[1] == 0) {
> +			result = 0;
> +			goto err2;
> +		}
> +
> +		port_priv->gc.label = "cp210x_sci";
> +		port_priv->gc.ngpio = 3;
> +		port_priv->gpio_map = kzalloc(sizeof(*port_priv->gpio_map) *
> +					      port_priv->gc.ngpio,
> +					      GFP_KERNEL);
> +
> +		i = 0;
> +
> +		if (config[12] & CP2105_SCI_GPIO0_TXLED_MODE) {
> +			port_priv->gc.ngpio -= 1;
> +		} else {
> +			port_priv->gpio_map[i] = 0;
> +			i++;
> +		}
> +
> +		if (config[12] & CP2105_SCI_GPIO1_RXLED_MODE) {
> +			port_priv->gc.ngpio -= 1;
> +		} else {
> +			port_priv->gpio_map[i] = 1;
> +			i++;
> +		}
> +
> +		port_priv->gpio_map[i] = 2;
> +	} else {
> +		result = -ENODEV;
> +		goto err2;
> +	}
> +
> +	port_priv->gc.get_direction = cp210x_gpio_direction_get;
> +	port_priv->gc.get = cp210x_gpio_get;
> +	port_priv->gc.set = cp210x_gpio_set;
> +	port_priv->gc.owner = THIS_MODULE;
> +	port_priv->gc.parent = &serial->interface->dev;
> +	port_priv->gc.base = -1;
> +	port_priv->gc.can_sleep = true;
> +
> +	port_priv->serial = serial;
> +
> +	/*
> +	 * Need to track the state of the output pins, the read function
> +	 * returns value seen on the pin, not the value being currently
> +	 * driven.
> +	 */
> +	if (port_priv->bInterfaceNumber == 0)
> +		port_priv->output_state = (config[4] >> 2) & 0x3;
> +	else
> +		port_priv->output_state = (config[5] >> 1) & 0x7;
> +
> +	mutex_init(&port_priv->output_lock);
> +
> +	result = gpiochip_add(&port_priv->gc);
> +
> +err2:
> +	kfree(config);
> +err1:
> +	kfree(mode);
> +
> +	return result;
> +}
> +
> +void cp210x_shared_gpio_remove(struct usb_serial_port *port)
> +{
> +	struct cp210x_port_private *port_priv;
> +
> +	port_priv = usb_get_serial_port_data(port);
> +
> +	if (port_priv->gc.label)
> +		gpiochip_remove(&port_priv->gc);
> +}
> +
> +#else
> +
> +static int cp2105_shared_gpio_init(struct usb_serial_port *port)
> +{
> +	return 0;
> +}
> +
> +void cp210x_shared_gpio_remove(struct usb_serial_port *port)
> +{
> +	/* Nothing to do */
> +}
> +#endif
> +
>  static int cp210x_port_probe(struct usb_serial_port *port)
>  {
>  	struct usb_serial *serial = port->serial;
>  	struct usb_host_interface *cur_altsetting;
>  	struct cp210x_port_private *port_priv;
> +	struct cp210x_dev_private *dev_priv = usb_get_serial_data(serial);
>  	int ret;
>
>  	port_priv = kzalloc(sizeof(*port_priv), GFP_KERNEL);
> @@ -1121,12 +1418,22 @@ static int cp210x_port_probe(struct usb_serial_port *port)
>  	usb_set_serial_port_data(port, port_priv);
>
>  	ret = cp210x_detect_swapped_line_ctl(port);
> -	if (ret) {
> -		kfree(port_priv);
> -		return ret;
> +	if (ret)
> +		goto err_ctl;
> +
> +	if (dev_priv->partnum == CP2105_PARTNUM) {
> +		ret = cp2105_shared_gpio_init(port);
> +		if (ret < 0)
> +			dev_err(&port->dev,
> +				"GPIO initialisation failed, continuing without GPIO support\n");
>  	}
>
>  	return 0;
> +
> +err_ctl:
> +	kfree(port_priv);
> +
> +	return ret;
>  }
>
>  static int cp210x_port_remove(struct usb_serial_port *port)
> @@ -1134,11 +1441,49 @@ static int cp210x_port_remove(struct usb_serial_port *port)
>  	struct cp210x_port_private *port_priv;
>
>  	port_priv = usb_get_serial_port_data(port);
> +
> +	cp210x_shared_gpio_remove(port);
> +
>  	kfree(port_priv);
>
>  	return 0;
>  }
>
> +static int cp210x_attach(struct usb_serial *serial)
> +{
> +	struct cp210x_dev_private *priv;
> +	int result;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC, REQTYPE_DEVICE_TO_HOST,
> +				 CP210X_GET_PARTNUM, 0, &priv->partnum, 1,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != 1) {
> +		dev_err(&serial->interface->dev, "failed to get model: %d\n",
> +			result);
> +		goto err;
> +	}
> +
> +	usb_set_serial_data(serial, (void *)priv);
> +
> +	return 0;
> +err:
> +	kfree(priv);
> +
> +	return result;
> +}
> +
> +static void cp210x_release(struct usb_serial *serial)
> +{
> +	struct cp210x_dev_private *priv = usb_get_serial_data(serial);
> +
> +	kfree(priv);
> +}
> +
>  module_usb_serial_driver(serial_drivers, id_table);
>
>  MODULE_DESCRIPTION(DRIVER_DESC);
>
