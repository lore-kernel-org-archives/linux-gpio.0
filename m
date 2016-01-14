From: Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>
Subject: RE: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 14 Jan 2016 00:27:25 +0000
Message-ID: <BLUPR0701MB1572CDBC6E43EA82429B723491CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
References: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0080.outbound.protection.outlook.com ([157.56.110.80]:52736
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750871AbcANA12 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 19:27:28 -0500
In-Reply-To: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Comments inline, not comprehensive by any measure...

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
> owner@vger.kernel.org] On Behalf Of Martyn Welch
> Sent: Wednesday, January 13, 2016 06:31
> To: Johan Hovold; Linus Walleij; Alexandre Courbot
> Cc: Greg Kroah-Hartman; linux-usb@vger.kernel.org; linux-
> gpio@vger.kernel.org; Martyn Welch
> Subject: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
> 
...

> +#include <linux/gpio/driver.h>
> +#include <linux/bitops.h>

Enclose this in CONFIG_GPIOLIB?
...

> @@ -201,6 +207,10 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  struct cp210x_port_private {
>  	__u8			bInterfaceNumber;
>  	bool			has_swapped_line_ctl;
> +#ifdef CONFIG_GPIOLIB
> +	struct usb_serial	*serial;

If you have port_private (and port), you can always get usb_serial from port->serial, so why store it here?

> +	struct gpio_chip	gc;
> +#endif
>  };

...

> 
>  static struct usb_serial_driver cp210x_device = {
> @@ -219,6 +229,7 @@ static struct usb_serial_driver cp210x_device = {
>  	.tx_empty		= cp210x_tx_empty,
>  	.tiocmget		= cp210x_tiocmget,
>  	.tiocmset		= cp210x_tiocmset,
> +	.probe			= cp210x_probe,

Enclose this in CONFIG_GPIOLIB?
...

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

usb_control_msg can deal with any size of the buffer, so use __le16 and remove these length calculations.

> +
> +	buf = kcalloc(length, sizeof(__le32), GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	/* Issue the request, attempting to read 'size' bytes */
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev,
> 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_INTERFACE_TO_HOST,
> CP210X_READ_LATCH,
> +				 port_priv->bInterfaceNumber, buf, size,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != size) {

print err message here and any other time this function fails.

> +		result = 0;
> +		goto err;
> +	}
...

> +static int cp210x_shared_gpio_init(struct usb_serial_port *port)
> +{
> +	struct usb_serial *serial = port->serial;
> +	struct cp210x_port_private *port_priv =
> usb_get_serial_port_data(port);
> +	__le32 *buf;
> +	unsigned long tmp;

Wouldn't "chip_features" be better?

> +	int result, mode;

mode is unsigned.
...

>  static int cp210x_port_probe(struct usb_serial_port *port)
>  {
>  	struct usb_serial *serial = port->serial;
> @@ -1008,12 +1198,21 @@ static int cp210x_port_probe(struct
> usb_serial_port *port)
>  	usb_set_serial_port_data(port, port_priv);
> 
>  	ret = cp210x_detect_swapped_line_ctl(port);
> -	if (ret) {
> -		kfree(port_priv);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_ctl;
> +
> +#ifdef CONFIG_GPIOLIB
> +	ret = cp210x_shared_gpio_init(port);
> +	if (ret < 0)
> +		goto err_ctl;

put kfree and return here
...

