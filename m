From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Sun, 28 Feb 2016 13:26:17 +0100
Message-ID: <20160228122617.GC10265@localhost>
References: <1453126477-23735-1-git-send-email-martyn.welch@collabora.co.uk>
 <20160131195405.GA2957@localhost>
 <56AF52E0.2080507@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56AF52E0.2080507-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 01, 2016 at 12:43:12PM +0000, Martyn Welch wrote:
> On 31/01/16 19:54, Johan Hovold wrote:
> > On Mon, Jan 18, 2016 at 02:14:37PM +0000, Martyn Welch wrote:
> >> This patch adds support for the GPIO found on the CP2105. Unlike the GPIO
> >> provided by some of the other devices supported by the cp210x driver, the
> >> GPIO on the CP2015 is muxed on pins otherwise used for serial control
> >> lines. The GPIO have been configured in 2 separate banks as the choice to
> >> configure the pins for GPIO is made separately for pins shared with each
> >> of the 2 serial ports this device provides, though the choice is made for
> >> all pins associated with that port in one go. The choice of whether to use
> >> the pins for GPIO or serial is made by adding configuration to a one-time
> >> programable PROM in the chip and can not be changed at runtime. The device
> >> defaults to GPIO.
> >>
> >> This device supports either push-pull or open-drain modes, it doesn't
> >> provide an explicit input mode, though the state of the GPIO can be read
> >> when used in open-drain mode. Like with pin use, the mode is configured in
> >> the one-time programable PROM and can't be changed at runtime.
> >>
> >> Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> >> ---

> >>   static int cp210x_port_probe(struct usb_serial_port *port)
> >>   {
> >>   	struct usb_serial *serial = port->serial;
> >> @@ -1007,12 +1170,21 @@ static int cp210x_port_probe(struct usb_serial_port *port)
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
> > Do you really want to fail probe if the gpios cannot be initialised?
> > Seems this could risk breaking some currently working systems.
> >
> 
> I can print and error message and continue if you prefer?

Yeah, that's probably better.

Thanks,
Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
