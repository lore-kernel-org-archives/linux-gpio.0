From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Wed, 9 Mar 2016 10:58:05 +0100
Message-ID: <20160309095805.GA1506@katana>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
 <56DDDE6E.6090908@cogentembedded.com>
 <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
 <56DDE5CB.60204@cogentembedded.com>
 <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2016 at 10:00:37PM +0100, Geert Uytterhoeven wrote:
> CC Shawn, Sascha for imx1
>=20
> On Mon, Mar 7, 2016 at 9:34 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 03/07/2016 11:29 PM, Geert Uytterhoeven wrote:
> >
> >>>>> --- a/drivers/pinctrl/sh-pfc/core.c
> >>>>> +++ b/drivers/pinctrl/sh-pfc/core.c
> >>>>> @@ -545,7 +545,9 @@ static int sh_pfc_probe(struct platform_device
> >>>>> *pdev)
> >>>>>                           return ret;
> >>>>>           }
> >>>>>
> >>>>> -       pinctrl_provide_dummies();
> >>>>> +       /* Enable dummy states for those platforms without pinctrl
> >>>>> support */
> >>>>> +       if (!of_have_populated_dt())
> >>>
> >>>
> >>>     I'd considered this condition -- it won't fly on SH where
> >>> CONFIG_OF=3Dn,
> >>> the kernel just won't build IIUC...
> >>
> >>
> >> I haven't tried to compile it yet, but <linux/of.h> does provide a dum=
my
> >> that
> >> returns false.
> >
> >
> >    Oops, indeed. I missed it. :-(
> >    This approach is better then, won't have to fix again whenever SH ge=
ts DT
> > support.
>=20
> Perhaps the of_have_populated_dt() check should be moved inside
> pinctrl_provide_dummies()?

I suggest we pick up this patch now even with stable tag (the irq storm
fixup doesn't work correctly because of this) and consider the
refactoring as a second step?


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW3/OtAAoJEBQN5MwUoCm2vxAP/0W/KNWwH9DLUGqLl1B3z6nq
eKH+9BKlslBkzqMdaf9epB0CwPeyUP8HzBkFA9fVXx7j7ok44jsGM/xbaBi/baew
988MIdLEB6hfCQFFhyJ/eAOeaRfclHOY/bamMxgyraWRE3ZlwU7xYHEVM0R3zM0U
AtzX9NffNhk9fvaIrPdTqTNbrr4uO9+d5J9yCgVz8vSTh5iMkNuvY1rZHT3MxyXq
DjERjNVj9/KYkRkrPq5+P3XqxPNhOvD+uAvk/m8VcETyzOxbNRwd6s07IxF2NiH2
xmB27TS2M7dSnp1Of6aTIbkt2262jENLueQEW0rA7xjRpuGGafPgKjO6VCVSX74U
ivl6JhrhmHiNaNbn6H041R3PTdnPF6J5kHFHRYLvxEosmf0kL14BlXpIwxy+rayk
i3up62QQLQF5X6Gh0R50aZWsw3c6eWlZbBuH4CpcIctaA+dJ9TPZrVsxvxiHyTpQ
FLgKQlebxhQnkmidCe9939JJ4SVSpFKMyRNB1zPGxM8OToh/S5/Eqdkjfb8WVsZY
jO5vNKI2Wi4SN4XX2GbNeT7wrf7djLmj9u4ViUDm9lYeo2LSujZEFDeZH9WSt9Z5
KNQDOkivlj5Ksugln3rFOr345EoeX6/mOmvF0zhsJkBBfxDK8HNURaW15at+OewP
Iy2vPdKwDpZ2GPXl/v5P
=2NTB
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
