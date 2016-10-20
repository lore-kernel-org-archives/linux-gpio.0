From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Thu, 20 Oct 2016 10:49:24 +0200
Message-ID: <20161020084924.GN2765@localhost>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Karl Palsson <karlp-PhA6lrgffZtPR4JQBCEnsQ@public.gmane.org>, Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2016 at 09:13:41AM +0100, Martyn Welch wrote:
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
> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
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
> V8: - Re-fix for when gpiolib isn't selected.
> 
> V9: - Reverted to using cp210x_serial_private.
>     - Use gpiochip_add_data rather than devm_gpiochip_add_data.
>     - Tweak struct padding.
>     - Use common GPIO Mode defines.
>     - Use USB_CTRL_GET_TIMEOUT rather than USB_CTRL_SET_TIMEOUT when performing USB reads.
>     - Tweak error messages and return values.
>     - Add free'ing of priv.
>     - Add disconnect and release functions (for correctly removing and releasing gpio).
> 
> v10:- Remove extraneous "u" in non-GLIOLIB path.
> 
>  drivers/usb/serial/cp210x.c | 408 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 405 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 4d6a5c6..e0573bf 100644
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
> @@ -44,6 +47,9 @@ static int cp210x_tiocmset(struct tty_struct *, unsigned int, unsigned int);
>  static int cp210x_tiocmset_port(struct usb_serial_port *port,
>  		unsigned int, unsigned int);
>  static void cp210x_break_ctl(struct tty_struct *, int);
> +static int cp210x_attach(struct usb_serial *);
> +static void cp210x_disconnect(struct usb_serial *);
> +static void cp210x_release(struct usb_serial *);
>  static int cp210x_port_probe(struct usb_serial_port *);
>  static int cp210x_port_remove(struct usb_serial_port *);
>  static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
> @@ -207,6 +213,15 @@ static const struct usb_device_id id_table[] = {
>  
>  MODULE_DEVICE_TABLE(usb, id_table);
>  
> +#ifdef CONFIG_GPIOLIB
> +struct cp210x_serial_private {
> +	struct usb_serial	*serial;

This should not be needed. Pass the usb_serial struct to gpiolib as
private data instead.

> +	struct gpio_chip	gc;
> +	u8			config;
> +	u8			gpio_mode;
> +};
> +#endif

> +#ifdef CONFIG_GPIOLIB
> +static int cp210x_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct cp210x_serial_private *priv = gpiochip_get_data(gc);
> +	u8 intf_num = cp210x_interface_num(priv->serial);
> +
> +	if (intf_num == 0) {
> +		switch (offset) {
> +		case 0:
> +			if (priv->config & CP2105_GPIO0_TXLED_MODE)
> +				return -ENODEV;
> +			break;
> +		case 1:
> +			if (priv->config & (CP2105_GPIO1_RXLED_MODE |
> +					  CP2105_GPIO1_RS485_MODE))
> +				return -ENODEV;
> +			break;
> +		}
> +	} else if (intf_num == 1) {
> +		switch (offset) {
> +		case 0:
> +			if (priv->config & CP2105_GPIO0_TXLED_MODE)
> +			return -ENODEV;

Odd indentation.

> +		case 1:
> +			if (priv->config & CP2105_GPIO1_RXLED_MODE)
> +				return -ENODEV;
> +			break;
> +		}

Now that you use common defines, aren't you able to just use a single
common switch construct for this (even if rs485-mode will never be set
for interface 1) as I suggested earlier?

> +	} else {
> +		return -ENODEV;
> +	}
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
> +	struct cp210x_serial_private *priv;
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
> +		goto err_free_priv;
> +
> +	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
> +					  CP210X_GET_PORTCONFIG, &config,
> +					  sizeof(config));
> +	if (result < 0)
> +		goto err_free_priv;
> +
> +	/*  2 banks of GPIO - One for the pins taken from each serial port */
> +	if (intf_num == 0) {
> +		if (mode.eci == 0)

Would you mind explaining how mode is used as I asked in my comments to
v8?

> +			return 0;
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
> +		result = -ENODEV;
> +		goto err_free_priv;
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
> +	result = gpiochip_add_data(&priv->gc, priv);

So set the serial data first and then pass struct usb_serial here
instead.

> +	if (result < 0)
> +		goto err_free_priv;
> +
> +	usb_set_serial_data(serial, (void *)priv);

Cast not needed.

> +
> +	return 0;
> +
> +err_free_priv:
> +	kfree(priv);
> +
> +	return result;
> +}
> +
> +static void cp210x_gpio_remove(struct usb_serial *serial)
> +{
> +	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
> +
> +	if (priv)

You should not rely on the private data as a flag for the gpio
implementation (see below).

> +		gpiochip_remove(&priv->gc);
> +}
> +
> +static void cp210x_gpio_release(struct usb_serial *serial)
> +{
> +	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
> +
> +	kfree(priv);

Hmm. This looks odd, but I think I understand why you did it this way.
The interface (serial) private data should be allocated in attach and
freed in release. Now it happens that you currently only use it for gpio
fields, but you should still follow that expected pattern.

Perhaps always store the device type (we'll surely need it at some
point) in the private data, and move the compile guards inside the
struct again. Allocate in attach, free in release. And initialise the
gpio fields above, before registering the gpio chip when needed.

> +}
> +
> +#else
 
> +static int cp210x_attach(struct usb_serial *serial)
> +{
> +	int result;
> +	u8 partnum;
> +
> +	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
> +					  CP210X_GET_PARTNUM, &partnum,
> +					  sizeof(partnum));
> +	if (result < 0)
> +		return result;
> +
> +	if (partnum == CP210X_PARTNUM_CP2105) {
> +		result = cp2105_shared_gpio_init(serial);
> +		if (result < 0)
> +			dev_err(&serial->interface->dev,
> +				"GPIO initialisation failed, continuing without GPIO support\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void cp210x_disconnect(struct usb_serial *serial)
> +{
> +	cp210x_gpio_remove(serial);
> +}
> +
> +static void cp210x_release(struct usb_serial *serial)
> +{

There's another complication here. In the unlikely event of a late probe
error, disconnect will never be called, but release will be if attach
succeeded. Then you need to deregister the gpio chip here as well.

> +	cp210x_gpio_release(serial);
> +}
> +
>  module_usb_serial_driver(serial_drivers, id_table);
>  
>  MODULE_DESCRIPTION(DRIVER_DESC);

Thanks,
Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
