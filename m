From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v3] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Mon, 18 Jan 2016 12:19:21 +0000
Message-ID: <569CD849.6020007@collabora.co.uk>
References: <1452855064-5395-1-git-send-email-martyn.welch@collabora.co.uk> <BLUPR0701MB1572287BDEEB4368C76C12EE91CD0@BLUPR0701MB1572.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLUPR0701MB1572287BDEEB4368C76C12EE91CD0-v5ruerSQ/ojJf3AXQIW3Ok5OhdzP3rhOnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org



On 15/01/16 21:59, Konstantin Shkolnyy wrote:
>> From: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-usb-
>> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Martyn Welch
>> Sent: Friday, January 15, 2016 04:51
>> To: Johan Hovold; Linus Walleij; Alexandre Courbot
>> Cc: Greg Kroah-Hartman; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
>> gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Martyn Welch
>> Subject: [PATCH v3] USB: serial: cp210x: Adding GPIO support for CP2105
>>
> ...
>
>> +static int cp210x_gpio_get(struct gpio_chip *gc, unsigned gpio)
>> +{
>> +	struct cp210x_port_private *port_priv =
>> +			 container_of(gc, struct cp210x_port_private, gc);
>> +	struct usb_serial *serial = port_priv->serial;
>> +	u8 *buf;
>> +	int result;
>> +
>> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev,
>> 0),
>> +				 CP210X_VENDOR_SPECIFIC,
>> +				 REQTYPE_INTERFACE_TO_HOST,
>> CP210X_READ_LATCH,
>> +				 port_priv->bInterfaceNumber, buf, 1,
>> +				 USB_CTRL_GET_TIMEOUT);
>> +	if (result != 1) {
>> +		dev_err(&serial->port[port_priv->bInterfaceNumber]->dev,
>> +			"failed to get gpio state: %d\n", result);
>> +		result = 0;
>> +		goto err;
>
> leaking buf
>

Oops. Thanks.

>> +	}
>> +
>> +	result = (*buf >> gpio) & 0x1;
>> +
>> +	kfree(buf);
>> +err:
>> +	return result;
>> +}
> ...
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
