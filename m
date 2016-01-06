From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Wed, 6 Jan 2016 22:12:29 +0100
Message-ID: <20160106211229.GC9631@lukather>
References: <1451582246-32373-1-git-send-email-andre.przywara@arm.com>
 <CAEzqOZsE_kDChAbLkwmwjqdDbovv1e0G1tTffhhp25PkwJQ0+Q@mail.gmail.com>
 <568A4972.8030602@arm.com>
 <20160104203059.GG11722@lukather>
 <568BB04B.30100@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPUGW22AKGQEVKD7WEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <568BB04B.30100-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, will.deacon-5wv7dgnIgG8@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Andre,

On Tue, Jan 05, 2016 at 12:00:11PM +0000, Andre Przywara wrote:
> Hi Maxime,
> 
> On 04/01/16 20:30, Maxime Ripard wrote:
> > Hi Andre,
> > 
> > On Mon, Jan 04, 2016 at 10:29:06AM +0000, Andre Przywara wrote:
> >>>> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
> >>>> index e080290..130e7bc 100644
> >>>> --- a/drivers/pinctrl/sunxi/Makefile
> >>>> +++ b/drivers/pinctrl/sunxi/Makefile
> >>>> @@ -12,5 +12,6 @@ obj-$(CONFIG_PINCTRL_SUN7I_A20)               += pinctrl-sun7i-a20.o
> >>>>  obj-$(CONFIG_PINCTRL_SUN8I_A23)                += pinctrl-sun8i-a23.o
> >>>>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)      += pinctrl-sun8i-a23-r.o
> >>>>  obj-$(CONFIG_PINCTRL_SUN8I_A33)                += pinctrl-sun8i-a33.o
> >>>> +obj-$(CONFIG_PINCTRL_A64)              += pinctrl-a64.o
> >>>
> >>> Shouldn't this follow pinctrl config name like other sunXi SOCs?
> >>> This should be PINCTRL_SUN??_A64.
> >>
> >> I never really got the reason we use those sunxi names in addition to
> >> the SoC name in the first place, maybe apart from copying from some
> >> Allwinner code.
> >> Since I decided to not look at Allwinner's BSP at all (if avoidable), I
> >> also thought it would be time to drop that sunxi naming, which looks
> >> redundant to me.
> >> Is there any reason why we would need this (beside having a rather
> >> unique identifier prefix)?
> > 
> > It's mostly historical.
> > 
> > 
> > Back when we started this, There was a few SoCs already out: A10,
> > A10s, A12 and A13, which was very similar to the Cortex-A naming
> > scheme (and I think the Cortex-A12 was also announced at the time).
> > 
> > We couldn't really use the SoC family either, since there was already
> > multiple SoCs that were part of the same family (the A10s, A12 and
> > A13, part of the sun5i family).
> > 
> > In order to avoid any confusion, we chose to go with both to uniquely
> > and without any confusion possible, and we just went on with that
> > naming scheme for consistency.
> 
> I see, thanks for the explanation.
> I was wondering since we now move to a new architecture as well to avoid
> this historic "ballast", but I have no problems with adding "_sun50i_"
> to the identifiers and file names.
> To me as only a casual sunxi user I found it mostly hard to memorize the
> connections between the sunxi numbering and the SoC names (I just know
> that the A20 is sun7i ;-). So for finding a specific dts for instance,
> you have to start with the sunxi number to get it TAB completed ...

I guess it doesn't really matter for arm64, since it seems like
there's a sub-folder per SoC family.

However, having an a12.dtsi in arch/arm/boot/dts will probably bring a
lot of confusion :)

I still think that we should maintain the current compatible scheme
though, in order to keep consistency.

> With that being said: Would you prefer to have a sun50i prefix? I see
> that having just "a64" on itself is not very specific.

I'd say that having a DTSI in arch/arm64/boot/dts/sunxi/a64.dtsi would
not bring a lot of confusion. If you're there, you know what you're
dealing with already.

If you feel like it makes the life easier to new or casual users, go
ahead.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ghzN8eJ9Qlbqn3iT--
