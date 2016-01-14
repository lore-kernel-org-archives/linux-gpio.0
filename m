From: Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>
Subject: RE: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 14 Jan 2016 14:29:06 +0000
Message-ID: <BLUPR0701MB1572C3AEF86A3CEDCC606E6D91CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
References: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
 <BLUPR0701MB1572CDBC6E43EA82429B723491CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
 <5697770F.9040707@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0080.outbound.protection.outlook.com ([157.56.110.80]:45845
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752528AbcANOn1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2016 09:43:27 -0500
In-Reply-To: <5697770F.9040707@collabora.co.uk>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> From: Martyn Welch [mailto:martyn.welch@collabora.co.uk]
> Sent: Thursday, January 14, 2016 04:23
> To: Konstantin Shkolnyy; Johan Hovold; Linus Walleij; Alexandre Courbot
> Cc: Greg Kroah-Hartman; linux-usb@vger.kernel.org; linux-
> gpio@vger.kernel.org
> Subject: Re: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
> 
> On 14/01/16 00:27, Konstantin Shkolnyy wrote:
> > Comments inline, not comprehensive by any measure...
> >
> >> -----Original Message-----
> >> From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
> >> owner@vger.kernel.org] On Behalf Of Martyn Welch
> >> Sent: Wednesday, January 13, 2016 06:31
> >> To: Johan Hovold; Linus Walleij; Alexandre Courbot
> >> Cc: Greg Kroah-Hartman; linux-usb@vger.kernel.org; linux-
> >> gpio@vger.kernel.org; Martyn Welch
> >> Subject: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
> >>
> > ...
> >
> >> +#include <linux/gpio/driver.h>
> >> +#include <linux/bitops.h>
> >
> > Enclose this in CONFIG_GPIOLIB?
> > ...
> 
> Is there any point? I took a look at a few other drivers which
> optionally support GPIO and they don't ifdef the headers.

OK, according to other comment, I need to learn about local ifdef policies. I'm sorry.
To me, knowing *why * a header is included seems beneficial, but obviously there are other considerations.

> I think the contents of the headers will effectively be ignored if not
> used and this won't affect module size.

I think a good linker will throw away anything that is not referenced anyway.
...

> >> +static int cp210x_gpio_get(struct gpio_chip *gc, unsigned gpio)
> >> +{
> >> +	struct cp210x_port_private *port_priv =
> >> +			 container_of(gc, struct cp210x_port_private, gc);
> >> +	struct usb_serial *serial = port_priv->serial;
> >> +	__le32 *buf;
> >> +	int result, i, length;
> >> +	int size = 1;
> >> +	unsigned int data[size];
> >> +
> >> +	/* Number of integers required to contain the array */
> >> +	length = (((size - 1) | 3) + 1) / 4;
> >
> > usb_control_msg can deal with any size of the buffer, so use __le16 and
> remove these length calculations.
> >
> 
> OK. (This is the process used in the other calls. Was wondering why they
> are in the first place, any ideas?)

Johan Hovold previously said he didn't like these functions either. I actually submitted a patch to replace them with simpler ones.
...

> >>   static int cp210x_port_probe(struct usb_serial_port *port)
> >>   {
> >>   	struct usb_serial *serial = port->serial;
> >> @@ -1008,12 +1198,21 @@ static int cp210x_port_probe(struct
> >> usb_serial_port *port)
> >>   	usb_set_serial_port_data(port, port_priv);
> >>
> >>   	ret = cp210x_detect_swapped_line_ctl(port);
> >> -	if (ret) {
> >> -		kfree(port_priv);
> >> -		return ret;
> >> -	}
> >> +	if (ret)
> >> +		goto err_ctl;
> >> +
> >> +#ifdef CONFIG_GPIOLIB
> >> +	ret = cp210x_shared_gpio_init(port);
> >> +	if (ret < 0)
> >> +		goto err_ctl;
> >
> > put kfree and return here
> > ...
> >
> 
> Why not use a shared error path?

I don't have a strong opinion here. Just felt like insulating the code insertion into ifdef CONFIG_GPIOLIB. But you also have a good point...

