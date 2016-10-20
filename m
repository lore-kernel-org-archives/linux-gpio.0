From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v10 1/1] USB: serial: cp210x: Adding GPIO support for
 CP2105
Date: Thu, 20 Oct 2016 14:31:36 +0100
Message-ID: <20161020133136.GW355@hermes.home>
References: <33cb529dad5c28a135e9e21460582c3cc4e6d4b5.1476950450.git.martyn.welch@collabora.co.uk>
 <20161020084924.GN2765@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020084924.GN2765@localhost>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Karl Palsson <karlp-PhA6lrgffZtPR4JQBCEnsQ@public.gmane.org>, Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2016 at 10:49:24AM +0200, Johan Hovold wrote:
> On Thu, Oct 20, 2016 at 09:13:41AM +0100, Martyn Welch wrote:
> > +	/*  2 banks of GPIO - One for the pins taken from each serial port */
> > +	if (intf_num == 0) {
> > +		if (mode.eci == 0)
> 
> Would you mind explaining how mode is used as I asked in my comments to
> v8?
> 

These are set to 0 if in "modem mode" or 1 if in "gpio mode". I will add
these as defines to make this clear.

Martyn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
