From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: More GPIO madness on iMX6 - and the crappy ARM port of Linux
Date: Fri, 17 Jan 2014 22:53:31 +0100
Message-ID: <CACRpkdYvZaXL6OWUXB2a3=rstsWRe4btvuXx9hzgnXZttaYezw@mail.gmail.com>
References: <20140117184731.GE15937@n2100.arm.linux.org.uk>
	<52D98712.3070103@wwwdotorg.org>
	<20140117202015.GE25911@pengutronix.de>
	<20140117204342.GG15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:55787 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbaAQVxe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2014 16:53:34 -0500
Received: by mail-oa0-f46.google.com with SMTP id n16so2212799oag.5
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2014 13:53:33 -0800 (PST)
In-Reply-To: <20140117204342.GG15937@n2100.arm.linux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>

[CC:ing the comaintainer and linux-gpio for generic questions...]

On Fri, Jan 17, 2014 at 9:43 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jan 17, 2014 at 09:20:15PM +0100, Uwe Kleine-K=F6nig wrote:

>>  e) add a flag to all gpio-chips signalling which case gpio_get_valu=
e
>>     implements (i.e: return
>>       - the actual value on the pad; or
>>       - zero.
>>     ). This is not orthogonal to b) - d)
>>
>> > > 2. What should be reported in /sys/kernel/debug/gpio for an outp=
ut?
>> It should report the same thing as gpio_get_value in 1.
>
> There's another solution here.  /sys/kernel/debug/gpio is there to al=
low
> us to see the state of the GPIOs, right?  Well, if the asked-for outp=
ut
> value can be different from the read-back output value, how about fix=
ing
> this so that the _debug_ can report back what the desired output stat=
e
> as well as the current input state.
>
> This would mean that this file becomes something like:
>
>  gpio-86  (usb_otg_vbus        ) dir:out out:hi in:lo
>
> which makes it clear that either the pad is being asked to output a h=
igh
> level, but for some reason reading the input side is returning low st=
ate.
> It also lets you see what was asked of the output, and what was (in
> theory) written to the output.

I really like the looks of this. That kind of helpful stuff is exactly
what the debugfs files shall be used for.

> It may _also_ be a good idea to do (e) - have a per-gpiochip flag whi=
ch
> indicates the behaviour here, and omit the "out:" or "in:" as appropr=
iate.

That also seems like a good idea.

> Finally, consider that some drivers should be provided this informati=
on.
> For example, the bitbanging I2C driver needs this for:
>
>         scllo(adap);
>         sda =3D getsda(adap);
>         scl =3D (adap->getscl =3D=3D NULL) ? 0 : getscl(adap);
>         if (scl) {
>                 printk(KERN_WARNING "%s: SCL stuck high!\n", name);
>                 goto bailout;
>         }
>         if (!sda) {
>                 printk(KERN_WARNING "%s: SDA unexpected low "
>                        "while pulling SCL low!\n", name);
>                 goto bailout;
>         }
>
>         sclhi(adap);
>         sda =3D getsda(adap);
>         scl =3D (adap->getscl =3D=3D NULL) ? 1 : getscl(adap);
>         if (!scl) {
>                 printk(KERN_WARNING "%s: SCL stuck low!\n", name);
>                 goto bailout;
>         }
>         if (!sda) {
>                 printk(KERN_WARNING "%s: SDA unexpected low "
>                        "while pulling SCL high!\n", name);
>                 goto bailout;
>         }
>
> Now, if getscl() always returns zero when scllo() is called (because =
the
> pin is set as an output) the test is pretty useless - it turns into a
> verification that yes, the hardware does return zero from the pad reg=
ister
> when the pin is set as an output.

If we can come up with a good API for it this seems useful as
well. The bit-banged I2C is a perfectly valid usecase.

I guess we could discuss adding that to the new gpiod API so
we get some traction around that and start to clean things up properly.
I'd really prefer not to see it in the legacy API.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
