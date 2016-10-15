From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Sat, 15 Oct 2016 14:01:40 +0200
Message-ID: <20161015120140.GI13900@localhost>
References: <0ecd67ee6d0cfb3c511dcc28e8f9432ca8255e05.1476183758.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0ecd67ee6d0cfb3c511dcc28e8f9432ca8255e05.1476183758.git.martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Karl Palsson <karlp-PhA6lrgffZtPR4JQBCEnsQ@public.gmane.org>, Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

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
> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---

> V7: - Using GPIO private data for GPIO bits.
>     - Adding limited .set_single_ended() and direction support.
>     - Simplifying attach() and removing release() as it's no longer required.
> 
> v8: - Re-fix for when gpiolib isn't selected.

I'll take a closer look at this next week, but I noticed couple of
issues after a quick glance.

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

This memory is never freed, not even in the error paths below.

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
> +					  CP210X_GET_DEVICEMODE, &mode,
> +					  sizeof(mode));
> +	if (result < 0)
> +		return result;
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

Using the devres interface here means that the gpio chip stays
registered for some time even after the USB disconnect callback has
returned. That is broken, since the driver must cease all I/O to the
device as part of disconnect.

Specifically, you need to deregister the gpio chip in a new disconnect
callback.

> +
> +	if (result < 0)
> +		priv->gc.label = NULL;
> +
> +	return result;
> +}

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
