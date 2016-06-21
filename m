From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Tue, 21 Jun 2016 22:37:08 +0200
Message-ID: <20160621203707.GB1682@katana>
References: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > On group configuration, bail out if setting one of the individual pins
> > fails. We don't need to roll-back, the pinctrl core will do this for us.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Tested on a Lager and Salvator-X without problems. Needs probably more =
testing
> > on various HW to avoid regressions?
>=20
> Your patch causes the display to fail on r8a7740/armadillo.

I would have been surprised if this patch didn't uncover some hidden
issues.

> 15 =3D PIN_CONFIG_OUTPUT
>=20
> No idea why this is set for all pins of the lcd0_data24_0 group (and not =
for any
> other pin or group on any other SoC).

Me neither. Sadly no bandwith here to dig into it.


--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXaaVzAAoJEBQN5MwUoCm2BlEP/1voXyw7+8ZF9oBEWabB/oaq
1bytH+YDLpPrEhIJtdoqEYdLv8VuyGUQgGXRA6oCiMbLhrAozBGjiIrC4qGemn3r
LbMYqGpT5hyjo+tHggtyf6MVRmzfNoXlpPsu7ExSrTIM8/b0TI1DwtnscQFd5uwz
p+EpeIEPJZj32LZx8ZKIpgQg8LzUzv6U3m4Tgvs9+KjsiGPfVoXl+J9KkeQt+XR+
Jsj9grv74zX+koWQj3tcn9hZPBJzxPU1mX7oeMBniMGI8Ttmxo28u1EnFni4yvl3
d5bDX0dQu3vesdPW/gKt98F3njdiHLyl66uv44oa/3EkOr7u8Y9g+iSJgTDC37LU
6xXpmxQ1XtAFdZqSCxcgwXLTQf+hYM0m66hAFZm9VFYycGtGIfXK+6rpZkobkEDG
PTOzpq9fkroccJxHvFzUgBbv3eE1aGu7LYUWj7Cfy3DpQO3HrrdQb7VUzoRwJ/8V
8cQjyadqG+w9it5Ei9H+Jiw4/Teje7yQdgxdfyspm5glyRNHW31IQD9cxEBgpQ6j
JlPPtE9E13ij/v4ujf2rJto/PsDX6r88vzS4pkDpwaK+271ozB73KS+8xhPUdN26
oaCJZ7xqQ0SiaqWcy8ZZsBhg73NYjIPZC6z4Fau3xRQ99ugjEDS9gXc8USeaRiEm
1IWUca/5jKsGnIfkRUY3
=NoDh
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
