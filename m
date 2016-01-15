From: Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>
Subject: RE: [PATCH v3] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Fri, 15 Jan 2016 21:59:04 +0000
Message-ID: <BLUPR0701MB1572287BDEEB4368C76C12EE91CD0@BLUPR0701MB1572.namprd07.prod.outlook.com>
References: <1452855064-5395-1-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0086.outbound.protection.outlook.com ([207.46.100.86]:6144
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751777AbcAOV7H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2016 16:59:07 -0500
In-Reply-To: <1452855064-5395-1-git-send-email-martyn.welch@collabora.co.uk>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
> owner@vger.kernel.org] On Behalf Of Martyn Welch
> Sent: Friday, January 15, 2016 04:51
> To: Johan Hovold; Linus Walleij; Alexandre Courbot
> Cc: Greg Kroah-Hartman; linux-usb@vger.kernel.org; linux-
> gpio@vger.kernel.org; Martyn Welch
> Subject: [PATCH v3] USB: serial: cp210x: Adding GPIO support for CP2105
> 
...

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
> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev,
> 0),
> +				 CP210X_VENDOR_SPECIFIC,
> +				 REQTYPE_INTERFACE_TO_HOST,
> CP210X_READ_LATCH,
> +				 port_priv->bInterfaceNumber, buf, 1,
> +				 USB_CTRL_GET_TIMEOUT);
> +	if (result != 1) {
> +		dev_err(&serial->port[port_priv->bInterfaceNumber]->dev,
> +			"failed to get gpio state: %d\n", result);
> +		result = 0;
> +		goto err;

leaking buf

> +	}
> +
> +	result = (*buf >> gpio) & 0x1;
> +
> +	kfree(buf);
> +err:
> +	return result;
> +}
...
