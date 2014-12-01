From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: iio: dht11 broken
Date: Mon, 1 Dec 2014 15:08:45 +0100
Message-ID: <CACRpkdbSUJMF_1_8aZ+ECHAT+ztsa4jXuSFo_+V9gr1MzsNCcg@mail.gmail.com>
References: <547B4464.9090300@nod.at>
	<E1XvOXs-00014Z-6F@stardust.g4.wien.funkfeuer.at>
	<547C4A26.3070108@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547C4A26.3070108-/L3Ra7n9ekc@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 1, 2014 at 11:59 AM, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org> wrote:
> Am 01.12.2014 um 11:49 schrieb Harald Geyer:

>> Any input from gpiolib people about what the proper fix would be in
>> their opinion, of course is appreciated. I don't think the dht11 driver
>> is doing anything unreasonable per se, so maybe they can clarify how
>> the API is intended to be used?
>
> Your driver sets up a GPIO as IRQ and then you switch the mode to output
> to enable the DHT sensor.
> This is not an API issue, it is an design issue.
> I'm not a hardware expert but AFAIK setting an IRQ pin into output mode can
> lead to undefined behavior.

Well that check is there exactly to prevent madness like this.

IRQs on pins set to output *does* *not* *make* *sense*.

Remove the IRQ before setting the pin to output and vice
versa and everyone will be happier.

Yours,
Linus Walleij
