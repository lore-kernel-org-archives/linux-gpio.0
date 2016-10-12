From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/1] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Wed, 12 Oct 2016 10:56:28 +0200
Message-ID: <CACRpkdba686rXvcQTTugGLa4ervLycZJbm+Gse4M5s_uYumWjg@mail.gmail.com>
References: <4dd49af853d72f579d9d24286e56be3e61937565.1476106708.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4dd49af853d72f579d9d24286e56be3e61937565.1476106708.git.martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Karl Palsson <karlp-PhA6lrgffZtPR4JQBCEnsQ@public.gmane.org>, Konstantin Shkolnyy <Konstantin.Shkolnyy-S6d6foEdJf7QT0dZR+AlfA@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 10, 2016 at 3:39 PM, Martyn Welch
<martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:

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
(...)
> V7: - Using GPIO private data for GPIO bits.
>     - Adding limited .set_single_ended() and direction support.
>     - Simplifying attach() and removing release() as it's no longer required.

>From a GPIO point of view:
Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
