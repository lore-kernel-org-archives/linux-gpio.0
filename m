From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v8 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Wed, 19 Oct 2016 12:53:05 +0200
Message-ID: <20161019105305.GB12413@localhost>
References: <0ecd67ee6d0cfb3c511dcc28e8f9432ca8255e05.1476183758.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36278 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932790AbcJSOjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2016 10:39:54 -0400
Content-Disposition: inline
In-Reply-To: <0ecd67ee6d0cfb3c511dcc28e8f9432ca8255e05.1476183758.git.martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, Karl Palsson <karlp@tweak.net.au>, Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Peter Senna Tschudin <peter.senna@collabora.com>

On Tue, Oct 11, 2016 at 12:04:48PM +0100, Martyn Welch wrote:
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
> V6: - Remove unused define.
>     - Renamed cp210x_dev_private, cp210x_serial_private.
>     - Moved GPIO variables to cp210x_serial_private.
>     - Renamed PARTNUM defines.
>     - Switched to using bitops for GPIO mode bits.
>     - Moved vendor-specific defiles to end of defines.
>     - Added helpers for vendor requests.
>     - Using structs rather than byte arrays for sent and recieved values.
>     - Exposing total number of GPIOs and refusing requests for pins not
>       configured as GPIO, removing gpio_map in process.
>     - Added checks for allocation failures.
>     - Using same label for both banks of GPIO.
>     - Moved GPIO into to attach function.
> 
> V7: - Using GPIO private data for GPIO bits.
>     - Adding limited .set_single_ended() and direction support.
>     - Simplifying attach() and removing release() as it's no longer required.
> 
> v8: - Re-fix for when gpiolib isn't selected.
>  drivers/usb/serial/cp210x.c | 366 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 363 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 4d6a5c6..f996142 100644
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
> @@ -44,6 +47,7 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
>  static int cp210x_tiocmset_port(struct usb_serial_port *port,
>  		unsigned int, unsigned int);
>  static void cp210x_break_ctl(struct tty_struct *, int);
> +static int cp210x_attach(struct usb_serial *);
>  static int cp210x_port_probe(struct usb_serial_port *);
>  static int cp210x_port_remove(struct usb_serial_port *);
>  static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
> @@ -207,6 +211,15 @@ static const struct usb_device_id id_table[] = {
>  
>  MODULE_DEVICE_TABLE(usb, id_table);
>  
> +#ifdef CONFIG_GPIOLIB
> +struct cp210x_gpio_private {
> +	struct usb_serial	*serial;
> +	struct gpio_chip	gc;
> +	u8			config;
> +	u8			gpio_mode;
> +};
> +#endif
> +
>  struct cp210x_port_private {
>  	__u8			bInterfaceNumber;
>  	bool			has_swapped_line_ctl;
> @@ -228,6 +241,7 @@ static struct usb_serial_driver cp210x_device = {
>  	.tx_empty		= cp210x_tx_empty,
>  	.tiocmget		= cp210x_tiocmget,
>  	.tiocmset		= cp210x_tiocmset,
> +	.attach			= cp210x_attach,
>  	.port_probe		= cp210x_port_probe,
>  	.port_remove		= cp210x_port_remove,
>  	.dtr_rts		= cp210x_dtr_rts
> @@ -270,6 +284,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
>  #define CP210X_SET_CHARS	0x19
>  #define CP210X_GET_BAUDRATE	0x1D
>  #define CP210X_SET_BAUDRATE	0x1E
> +#define CP210X_VENDOR_SPECIFIC	0xFF
>  
>  /* CP210X_IFC_ENABLE */
>  #define UART_ENABLE		0x0001
> @@ -312,6 +327,21 @@ static struct usb_serial_driver * const serial_drivers[] = {
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
> +#define CP210X_PARTNUM_CP2101	0x01
> +#define CP210X_PARTNUM_CP2102	0x02
> +#define CP210X_PARTNUM_CP2103	0x03
> +#define CP210X_PARTNUM_CP2104	0x04
> +#define CP210X_PARTNUM_CP2105	0x05
> +#define CP210X_PARTNUM_CP2108	0x08
> +
>  /* CP210X_GET_COMM_STATUS returns these 0x13 bytes */
>  struct cp210x_comm_status {
>  	__le32   ulErrors;
> @@ -367,6 +397,61 @@ struct cp210x_flow_ctl {
>  #define CP210X_SERIAL_RTS_ACTIVE	1
>  #define CP210X_SERIAL_RTS_FLOW_CTL	2
>  
> +/* CP210X_VENDOR_SPECIFIC, CP210X_GET_DEVICEMODE call reads these 0x2 bytes. */
> +struct cp210x_pin_mode {
> +	u8	eci;
> +	u8	sci;
> +} __packed;
> +
> +/*
> + * CP210X_VENDOR_SPECIFIC, CP210X_GET_DEVICEMODE call reads these 0xf bytes.
> + * Structure needs padding due to unused/unspecified bytes.
> + */
> +struct cp210x_config {
> +	__le16	gpio_mode;
> +	__le16	__pad0;

Nit: I'd use u8 arrays for the pad fields.

> +	__le16	reset_state;
> +	__le16	__pad1;
> +	__le16	__pad2;
> +	__le16	suspend_state;
> +	u8	sci_cfg;
> +	u8	eci_cfg;
> +	u8	device_cfg;
> +} __packed;
> +
> +/* GPIO modes */
> +#define CP210X_SCI_GPIO_MODE_OFFSET	9
> +#define CP210X_SCI_GPIO_MODE_MASK	GENMASK(11, 9)
> +
> +#define CP210X_ECI_GPIO_MODE_OFFSET	2
> +#define CP210X_ECI_GPIO_MODE_MASK	GENMASK(3, 2)
> +
> +/* CP2105 port configuration values */
> +#define CP2105_SCI_GPIO0_TXLED_MODE	BIT(0)
> +#define CP2105_SCI_GPIO1_RXLED_MODE	BIT(1)
> +
> +#define CP2105_ECI_GPIO0_TXLED_MODE	BIT(0)
> +#define CP2105_ECI_GPIO1_RXLED_MODE	BIT(1)
> +#define CP2105_ECI_GPIO1_RS485_MODE	BIT(2)
> +
> +/* CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these 0x2 bytes. */
> +struct cp210x_gpio_write {
> +	u8	mask;
> +	u8	state;
> +} __packed;
> +
> +/*
> + * Helper to get interface number when we only have struct usb_serial.
> + */
> +static u8 cp210x_interface_num(struct usb_serial *serial)
> +{
> +	struct usb_host_interface *cur_altsetting;
> +
> +	cur_altsetting = serial->interface->cur_altsetting;
> +
> +	return cur_altsetting->desc.bInterfaceNumber;
> +}
> +
>  /*
>   * Reads a variable-sized block of CP210X_ registers, identified by req.
>   * Returns data into buf in native USB byte order.
> @@ -463,6 +548,40 @@ static int cp210x_read_u8_reg(struct usb_serial_port *port, u8 req, u8 *val)
>  }
>  
>  /*
> + * Reads a variable-sized vendor block of CP210X_ registers, identified by val.
> + * Returns data into buf in native USB byte order.
> + */
> +static int cp210x_read_vendor_block(struct usb_serial *serial, u8 type, u16 val,
> +				    void *buf, int bufsize)
> +{
> +	void *dmabuf;
> +	int result;
> +
> +	dmabuf = kmalloc(bufsize, GFP_KERNEL);
> +	if (!dmabuf)
> +		return -ENOMEM;
> +
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC, type, val,
> +				 cp210x_interface_num(serial), dmabuf, bufsize,
> +				 USB_CTRL_SET_TIMEOUT);

Use USB_CTRL_GET_TIMEOUT to avoid any confusion (same value).

> +	if (result == bufsize) {
> +		memcpy(buf, dmabuf, bufsize);
> +		result = 0;
> +	} else {
> +		dev_err(&serial->interface->dev,
> +			"failed get vendor val 0x%x size %d status: %d\n", val,

s/failed/failed to/

Use 0x%04x for val.

You can drop " status" as that's typically implied for the value after
the colon.

> +			bufsize, result);
> +		if (result >= 0)
> +			result = -EPROTO;

We should be using -EIO here (even if the rest of the driver does not
yet do so) as -EPROTO is used to indicate lower-level hardware issues.

> +	}
> +
> +	kfree(dmabuf);
> +
> +	return result;
> +}
> +
> +/*
>   * Writes any 16-bit CP210X_ register (req) whose value is passed
>   * entirely in the wValue field of the USB request.
>   */
> @@ -531,6 +650,42 @@ static int cp210x_write_u32_reg(struct usb_serial_port *port, u8 req, u32 val)
>  	return cp210x_write_reg_block(port, req, &le32_val, sizeof(le32_val));
>  }
>  
> +#ifdef CONFIG_GPIOLIB
> +/*
> + * Writes a variable-sized vendor block of CP210X_ registers, identified by val.
> + * Data in buf must be in native USB byte order.
> + */
> +static int cp210x_write_vendor_block(struct usb_serial *serial, u8 type,
> +				     u16 val, void *buf, int bufsize)
> +{
> +	void *dmabuf;
> +	int result;
> +
> +	dmabuf = kmemdup(buf, bufsize, GFP_KERNEL);
> +	if (!dmabuf)
> +		return -ENOMEM;
> +
> +	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
> +				 CP210X_VENDOR_SPECIFIC, type, val,
> +				 cp210x_interface_num(serial), dmabuf, bufsize,
> +				 USB_CTRL_SET_TIMEOUT);
> +
> +	kfree(dmabuf);
> +
> +	if (result == bufsize) {
> +		result = 0;
> +	} else {
> +		dev_err(&serial->interface->dev,
> +			"failed set vendor val 0x%x size %d status: %d\n", val,
> +			bufsize, result);
> +		if (result >= 0)
> +			result = -EPROTO;

Same comments as above.

> +	}
> +
> +	return result;
> +}
> +#endif
> +
>  /*
>   * Detect CP2108 GET_LINE_CTL bug and activate workaround.
>   * Write a known good value 0x800, read it back.
> @@ -1104,10 +1259,195 @@ static void cp210x_break_ctl(struct tty_struct *tty, int break_state)
>  	cp210x_write_u16_reg(port, CP210X_SET_BREAK, state);
>  }
>  
> +#ifdef CONFIG_GPIOLIB
> +static int cp210x_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct cp210x_gpio_private *priv = gpiochip_get_data(gc);
> +	u8 intf_num = cp210x_interface_num(priv->serial);
> +
> +	if (intf_num == 0) {
> +		switch (offset) {
> +		case 0:
> +			if (priv->config & CP2105_ECI_GPIO0_TXLED_MODE)
> +				return -ENODEV;
> +			break;
> +		case 1:
> +			if (priv->config & (CP2105_ECI_GPIO1_RXLED_MODE |
> +					  CP2105_ECI_GPIO1_RS485_MODE))
> +				return -ENODEV;
> +			break;
> +		}
> +	} else if (intf_num == 1) {
> +		switch (offset) {
> +		case 0:
> +			if (priv->config & CP2105_SCI_GPIO0_TXLED_MODE)
> +			return -ENODEV;
> +		case 1:
> +			if (priv->config & CP2105_SCI_GPIO1_RXLED_MODE)
> +				return -ENODEV;
> +			break;
> +		}
> +	} else {
> +		return -ENODEV;
> +	}

Now that you shift the configuration bits during setup, would it make
sense to simplify this further and only use three defines:

#define CP2105_GPIO0_TXLED_MODE		BIT(0)
#define CP2105_GPIO1_RXLED_MODE		BIT(1)
#define CP2105_GPIO1_RS485_MODE		BIT(2)

even if RS485 will never be set for interface 1?
	
> +
> +	return 0;
> +}

> +/*
> + * This function is for configuring GPIO using shared pins, where other signals
> + * are made unavailable by configuring the use of GPIO. This is believed to be
> + * only applicable to the cp2105 at this point, the other devices supported by
> + * this driver that provide GPIO do so in a way that does not impact other
> + * signals and are thus expected to have very different initialisation.
> + */
> +static int cp2105_shared_gpio_init(struct usb_serial *serial)
> +{
> +	struct cp210x_gpio_private *priv;
> +	struct cp210x_pin_mode mode;
> +	struct cp210x_config config;
> +	u8 intf_num = cp210x_interface_num(serial);
> +	int result;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
> +					  CP210X_GET_DEVICEMODE, &mode,
> +					  sizeof(mode));
> +	if (result < 0)
> +		return result;

As I mentioned in my "pre-review", you leak priv here and in the error
paths below.

> +
> +	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
> +					  CP210X_GET_PORTCONFIG, &config,
> +					  sizeof(config));
> +	if (result < 0)
> +		return result;
> +
> +	/*  2 banks of GPIO - One for the pins taken from each serial port */
> +	if (intf_num == 0) {
> +		if (mode.eci == 0)
> +			return 0;

Out of curiosity, what values can mode.eci/sci take on? Perhaps you can
add a comment somewhere, the rest you've done a great job at making
self-documenting.

> +
> +		priv->config = config.eci_cfg;
> +		priv->gpio_mode = (u8)((le16_to_cpu(config.gpio_mode) &
> +						CP210X_ECI_GPIO_MODE_MASK) >>
> +						CP210X_ECI_GPIO_MODE_OFFSET);
> +		priv->gc.ngpio = 2;
> +	} else if (intf_num == 1) {
> +		if (mode.sci == 0)
> +			return 0;
> +
> +		priv->config = config.sci_cfg;
> +		priv->gpio_mode = (u8)((le16_to_cpu(config.gpio_mode) &
> +						CP210X_SCI_GPIO_MODE_MASK) >>
> +						CP210X_SCI_GPIO_MODE_OFFSET);
> +		priv->gc.ngpio = 3;
> +	} else {
> +		return -ENODEV;
> +	}
> +
> +	priv->gc.label = "cp210x";
> +	priv->gc.request = cp210x_gpio_request;
> +	priv->gc.get_direction = cp210x_gpio_direction_get;
> +	priv->gc.direction_input = cp210x_gpio_direction_input;
> +	priv->gc.direction_output = cp210x_gpio_direction_output;
> +	priv->gc.get = cp210x_gpio_get;
> +	priv->gc.set = cp210x_gpio_set;
> +	priv->gc.set_single_ended = cp210x_gpio_set_single_ended;
> +	priv->gc.owner = THIS_MODULE;
> +	priv->gc.parent = &serial->interface->dev;
> +	priv->gc.base = -1;
> +	priv->gc.can_sleep = true;
> +
> +	priv->serial = serial;
> +
> +	result = devm_gpiochip_add_data(&serial->interface->dev, &priv->gc,
> +					priv);

As also mentioned in my mail from last weekend, you should not use the
devres interface here for a number of reasons.

First of all, you are currently leaking the priv buffer allocated above.

Using devres also means the gpiochip stays registered for a short time
even after the USB disconnect callback returns. This could potentially
lead to I/O requests post disconnect which is not allowed, and you could
also end up dereferencing the usb-serial struct that might already have
been released.

Just don't use the devres interface, and make sure to deregister the
gpiochip explicitly in a new disconnect callback. Any memory allocated
should be freed in a release callback (matching attach).

It's probably better to use a struct cp210x_serial_private as you did in
an earlier version, and pass the struct usb_serial to gpiochip_add_data
instead.

> +

You can drop the empty line here.

> +	if (result < 0)
> +		priv->gc.label = NULL;

You currently never use this (as you did in prior version).

> +
> +	return result;
> +}

Nice and clean overall. Great job!

Thanks,
Johan
