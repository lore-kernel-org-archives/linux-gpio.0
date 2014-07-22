From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: misc improvements for gpio
Date: Tue, 22 Jul 2014 18:33:10 +0200
Message-ID: <CACRpkdZhZkB6=_ehVXxWAnvkVYy_KOU84fcGRSRTc9-2X2paqQ@mail.gmail.com>
References: <1405358677-23657-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBR5EXKPAKGQE4IASMGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1405358677-23657-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

I'm waiting for Maxime to look at these patches before merging.

On Mon, Jul 14, 2014 at 7:24 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> These 2 patches are fixes / improvements to the gpio side of the
> sunxi pinctrl driver. They are based on pinctrl/devel (3a19805).
> The patches change the same lines of code, so they are sent together.
>
> Patch 1 adds locking gpio lines when used as external interrupts.
> Similar patches were done by Linus and other maintainers for various
> platforms.

Nice.

> A somewhat related issue is that the sunxi pinctrl driver does not
> block users from requesting an already muxed pin as a gpio line.
> Maybe we should do some locking there as well? Are there any kernel
> interfaces for this? Or do we need to do it in the driver specifically
> for our hardware?
>
> (I had the unfortunate experience of poking GPIOs listed in the fex
> files, not noticing they were used by the uart console.)


The pin control core explicitly allows concurrent muxing to some
certain function and GPIO usage (see Documentation/pinctrl.txt).

This is because some HW may allow you to e.g. "spy" on pins
using it's GPIO registers, or use it from the GPIO subsystem
at the same time some other way.

If this does not apply to your hardware, you can further
restrictions in the driver, for example pinctrl_request_gpio()
can return something negative from the pin control part
of the driver, like -EBUSY.

> AFAIK pinctrl pin numbers are device specific, so I'm wondering if we
> should also number them in terms of offsets, rather than absolute pin
> numbers. It's more of an asthetic change though. Any thoughts?

Usually I say these pin numbers should try to match what is
in the data sheet so it is easy to understand and debug. Sometimes
pins are numbered with letters and stuff so they rather have names
than numbers, then some artificial numbering is applied, whatever
is helpful.

I'm not directly familiar with the sunxi numbering system though...

Yours,
Linus Walleij
