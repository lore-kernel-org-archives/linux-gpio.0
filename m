From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 14 Jan 2016 10:23:11 +0000
Message-ID: <5697770F.9040707@collabora.co.uk>
References: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk> <BLUPR0701MB1572CDBC6E43EA82429B723491CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLUPR0701MB1572CDBC6E43EA82429B723491CC0-v5ruerSQ/ojJf3AXQIW3Ok5OhdzP3rhOnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org



On 14/01/16 00:27, Konstantin Shkolnyy wrote:
> Comments inline, not comprehensive by any measure...
>
>> -----Original Message-----
>> From: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-usb-
>> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Martyn Welch
>> Sent: Wednesday, January 13, 2016 06:31
>> To: Johan Hovold; Linus Walleij; Alexandre Courbot
>> Cc: Greg Kroah-Hartman; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
>> gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Martyn Welch
>> Subject: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
>>
> ...
>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/bitops.h>
>
> Enclose this in CONFIG_GPIOLIB?
> ...

Is there any point? I took a look at a few other drivers which 
optionally support GPIO and they don't ifdef the headers.

I think the contents of the headers will effectively be ignored if not 
used and this won't affect module size.

>
>> @@ -201,6 +207,10 @@ MODULE_DEVICE_TABLE(usb, id_table);
>>   struct cp210x_port_private {
>>   	__u8			bInterfaceNumber;
>>   	bool			has_swapped_line_ctl;
>> +#ifdef CONFIG_GPIOLIB
>> +	struct usb_serial	*serial;
>
> If you have port_private (and port), you can always get usb_serial from port->serial, so why store it here?
>

We don't have usb_serial in the gpio functions. Have to do:

struct cp210x_port_private *port_priv =
		 container_of(gc, struct cp210x_port_private, gc);
struct usb_serial *serial = port_priv->serial;

>> +	struct gpio_chip	gc;
>> +#endif
>>   };
>
> ...
>
>>
>>   static struct usb_serial_driver cp210x_device = {
>> @@ -219,6 +229,7 @@ static struct usb_serial_driver cp210x_device = {
>>   	.tx_empty		= cp210x_tx_empty,
>>   	.tiocmget		= cp210x_tiocmget,
>>   	.tiocmset		= cp210x_tiocmset,
>> +	.probe			= cp210x_probe,
>
> Enclose this in CONFIG_GPIOLIB?
> ...
>

Can do, though splattering ifdefs all over the driver isn't particularly 
nice.

I guess the question I have is: Would the preference be to ifdef out all 
extraneous functionality when GPIOLIB isn't enabled or to minimise the 
number of ifdef's at the expense of building in some functionality that 
wasn't then used?

>> +static int cp210x_gpio_get(struct gpio_chip *gc, unsigned gpio)
>> +{
>> +	struct cp210x_port_private *port_priv =
>> +			 container_of(gc, struct cp210x_port_private, gc);
>> +	struct usb_serial *serial = port_priv->serial;
>> +	__le32 *buf;
>> +	int result, i, length;
>> +	int size = 1;
>> +	unsigned int data[size];
>> +
>> +	/* Number of integers required to contain the array */
>> +	length = (((size - 1) | 3) + 1) / 4;
>
> usb_control_msg can deal with any size of the buffer, so use __le16 and remove these length calculations.
>

OK. (This is the process used in the other calls. Was wondering why they 
are in the first place, any ideas?)

>> +
>> +	buf = kcalloc(length, sizeof(__le32), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	/* Issue the request, attempting to read 'size' bytes */
>> +	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev,
>> 0),
>> +				 CP210X_VENDOR_SPECIFIC,
>> +				 REQTYPE_INTERFACE_TO_HOST,
>> CP210X_READ_LATCH,
>> +				 port_priv->bInterfaceNumber, buf, size,
>> +				 USB_CTRL_GET_TIMEOUT);
>> +	if (result != size) {
>
> print err message here and any other time this function fails.
>

OK.

>> +		result = 0;
>> +		goto err;
>> +	}
> ...
>
>> +static int cp210x_shared_gpio_init(struct usb_serial_port *port)
>> +{
>> +	struct usb_serial *serial = port->serial;
>> +	struct cp210x_port_private *port_priv =
>> usb_get_serial_port_data(port);
>> +	__le32 *buf;
>> +	unsigned long tmp;
>
> Wouldn't "chip_features" be better?
>
>> +	int result, mode;
>
> mode is unsigned.

OK.

> ...
>
>>   static int cp210x_port_probe(struct usb_serial_port *port)
>>   {
>>   	struct usb_serial *serial = port->serial;
>> @@ -1008,12 +1198,21 @@ static int cp210x_port_probe(struct
>> usb_serial_port *port)
>>   	usb_set_serial_port_data(port, port_priv);
>>
>>   	ret = cp210x_detect_swapped_line_ctl(port);
>> -	if (ret) {
>> -		kfree(port_priv);
>> -		return ret;
>> -	}
>> +	if (ret)
>> +		goto err_ctl;
>> +
>> +#ifdef CONFIG_GPIOLIB
>> +	ret = cp210x_shared_gpio_init(port);
>> +	if (ret < 0)
>> +		goto err_ctl;
>
> put kfree and return here
> ...
>

Why not use a shared error path?

Martyn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
