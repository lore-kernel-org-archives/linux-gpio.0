From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: Introduce VIN_DATA_PIN_GROUP_VER
Date: Tue, 30 Oct 2018 08:34:44 +0100
Message-ID: <20181030073444.GE15991@w540>
References: <1540836824-4636-1-git-send-email-jacopo+renesas@jmondi.org>
 <1540836824-4636-2-git-send-email-jacopo+renesas@jmondi.org>
 <1822236810.335136.1540871186977@webmail.strato.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sT9gWZPUZYhvPS56"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1822236810.335136.1540871186977@webmail.strato.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulrich Hecht <uli@fpond.eu>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, horms@verge.net.au, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--sT9gWZPUZYhvPS56
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Uli,

On Tue, Oct 30, 2018 at 04:46:26AM +0100, Ulrich Hecht wrote:
>
> > On October 29, 2018 at 7:13 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> >
> >
> > VIN data groups may appear on different sets of pins, usually named
> > "vinX_data_[a|b]". The existing VIN_DATA_PIN_GROUP() does not support appending
> > the 'a' or 'b' suffix, leading to the definition of groups names not consistent
> > with the ones defined using SH_PFC_PIN_GROUP() macro.
> >
> > Fix this by adding a macro that supports appending suffixes when required.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/pinctrl/sh-pfc/sh_pfc.h | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> > index 458ae0a..2930e9a 100644
> > --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> > +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> > @@ -54,17 +54,27 @@ struct sh_pfc_pin_group {
> >
> >  /*
> >   * Using union vin_data saves memory occupied by the VIN data pins.
> > - * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups
> > - * in this case.
> > + *
> > + * VIN_DATA_PIN_GROUP() is  a macro  used  to describe the VIN pin groups,
>
> Maybe fix the odd spacing, while you're at it?

Ups, I have missed it.

Thanks, I'll wait for more feedbacks and add your tag to the next
version.

Thanks
  j

>
> > + * while VIN_DATA_PIN_GROUP_VER() is used when the same pin group can appear
> > + * on different sets of pins.
> >   */
> > -#define VIN_DATA_PIN_GROUP(n, s)				\
> > -	{							\
> > -		.name = #n#s,					\
> > +#define __VIN_DATA_PIN_GROUP(n, s)				\
> >  		.pins = n##_pins.data##s,			\
> >  		.mux = n##_mux.data##s,				\
> >  		.nr_pins = ARRAY_SIZE(n##_pins.data##s),	\
> >  	}
> >
> > +#define VIN_DATA_PIN_GROUP(n, s)				\
> > +	{							\
> > +		.name = #n#s,					\
> > +		__VIN_DATA_PIN_GROUP(n, s)
> > +
> > +#define VIN_DATA_PIN_GROUP_VER(n, v, s)				\
> > +	{							\
> > +		.name = #n#s"_"#v,				\
> > +		__VIN_DATA_PIN_GROUP(n##_##v, s)
> > +
> >  union vin_data {
> >  	unsigned int data24[24];
> >  	unsigned int data20[20];
> > --
> > 2.7.4
> >
>
> With or without the whitespace fix:
>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
>
> CU
> Uli

--sT9gWZPUZYhvPS56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb2AmUAAoJEHI0Bo8WoVY8TFQQAIsZnPDnlNBvl+MeaWF+O0QP
85Ej7Az3Evfmz/ZMQTrNUyLbdhRMmmrYxnnURldaJA2WVZgvmQbWWGDjRLdppg2E
tMoAXnbyBqVOsb26aQjIlHil+J2Qh95fFqv/u3gXQm9k2GRDG4/eUVsvFMSHbev3
T3FXOpLIPdx6C6XHdAy1tMgnkzlGzIDKFoDRvUt/2s0MIdcTO9UNyIAmFUjlc+gq
YIKDJK8JjJxKuSZY2o9SeHk6Fh5F9FQv2JLl8xIZzFbV6yoYUPoB5qht+0NAObot
HD+NxlMlFCFP/lvBgPRgAzREhwvzKrvRhD8UMydGPy9R4Y+AQ2Qf32Bgw+VnZnho
9uceAQ6yYzA477/7llFKfnO/429DmiPhjuiT/POBEyXtAPGOwV7RkzYBQdDVyjPi
gjEEk4LDwpxAuHhG0MMgW3xLDCbl9G8R0lZTuoDZMX6LJOycZuHn+6yb4hFDr3/X
2mGtXp2Y6cX9nsMSTEZMM6YJ5iNBdkNza0r7Jc/IuL+fLh88ihfnUdGcP7kEOArO
EhO9r4vVydMGofYV1bGs36oTkjWzvhovxjLz8wR55TiWIX+Ipk/ZhywKXtstdgKk
Rc49j4jwzK3gPqtct8K6Nw4+bKWpyUiNsH50MrYKO6GRc63Gpk2mzuFUlxVzNCpr
78LjLBmbMlfvtXs/JC9u
=/rtT
-----END PGP SIGNATURE-----

--sT9gWZPUZYhvPS56--
