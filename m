From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: Add support for FTDI FT232H devices
Date: Wed, 19 Jul 2017 10:59:34 +0200
Message-ID: <20170719085934.GU29638@localhost>
References: <1499374158-12388-1-git-send-email-agust@denx.de>
 <1499374158-12388-2-git-send-email-agust@denx.de>
 <20170710125210.GK29638@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710125210.GK29638@localhost>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Laight <David.Laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 10, 2017 at 02:52:10PM +0200, Johan Hovold wrote:
> On Thu, Jul 06, 2017 at 10:49:16PM +0200, Anatolij Gustschin wrote:
> > Add USB part with common functions for USB-GPIO/I2C/SPI master
> > adapters. These allow communication with chip's control, transmit
> > and receive endpoints and will be used by various FT232H drivers.
> 
> > +static const struct mfd_cell ftdi_cells[] = {
> > +	{ .name = "ftdi-cbus-gpio", },
> > +	{ .name = "ftdi-mpsse-i2c", },
> > +	{ .name = "ftdi-mpsse-spi", },
> > +	{ .name = "ftdi-fifo-fpp-mgr", },
> > +};
> 
> Correct me if I'm wrong, but aren't these modes really mutually
> exclusive, possibly with exception of cbus-gpio (some pins are at least
> available as GPIOs in MPSSE mode)? Then MFD is not is not the right fit
> here either.

You never replied to this, and I'm afraid there are more issue with this
series.

> And as David Laight already pointed out, your ftdi-fifo-fpp-mgr driver
> seems too application specific for a generic chip like this.

Of which this is one is one of the major.

In short, your driver is much to application specific and is probably
something that needs to be implemented in userspace using libftdi.

Speaking of libftdi, you seem to have copied or borrowed a lot of code
and protocol from libftdi and this should have been mentioned in commit
messages and file headers (not just in a comment to one specific
function).

These chips can be used for a many different applications (also in FIFO
mode) so you cannot tie a driver to it exposing just a specific
interface for programming a certain class of FPGAs.

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
