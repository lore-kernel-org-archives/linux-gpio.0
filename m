From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Sun, 31 Jan 2016 20:57:42 +0100
Message-ID: <20160131195742.GB2957@localhost>
References: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
 <BLUPR0701MB1572CDBC6E43EA82429B723491CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
 <5697770F.9040707@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32853 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933307AbcAaT4k (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Jan 2016 14:56:40 -0500
Content-Disposition: inline
In-Reply-To: <5697770F.9040707@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 14, 2016 at 10:23:11AM +0000, Martyn Welch wrote:
> On 14/01/16 00:27, Konstantin Shkolnyy wrote:

> >>   static struct usb_serial_driver cp210x_device = {
> >> @@ -219,6 +229,7 @@ static struct usb_serial_driver cp210x_device = {
> >>   	.tx_empty		= cp210x_tx_empty,
> >>   	.tiocmget		= cp210x_tiocmget,
> >>   	.tiocmset		= cp210x_tiocmset,
> >> +	.probe			= cp210x_probe,
> >
> > Enclose this in CONFIG_GPIOLIB?
> > ...
> >
> 
> Can do, though splattering ifdefs all over the driver isn't particularly 
> nice.
> 
> I guess the question I have is: Would the preference be to ifdef out all 
> extraneous functionality when GPIOLIB isn't enabled or to minimise the 
> number of ifdef's at the expense of building in some functionality that 
> wasn't then used?

Try to minimise the ifdefs and use dummy inline functions in case
!CONFIG_GPIOLIB. That way you should not need to add more than two
ifdefs (data + code).

Thanks,
Johan
