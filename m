From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] pinctrl: sunxi: add a missing
 function of A10/A20 pinctrl driver
Date: Mon, 10 Jul 2017 10:44:00 +0200
Message-ID: <20170710084400.wwrfjekv2fkoqvoa@flea>
References: <20170706142822.20296-1-icenowy@aosc.io>
 <20170706142822.20296-2-icenowy@aosc.io>
 <20170706204646.3akr57fo6c2ok4wn@flea>
 <a55741a065b818d8ff3843471da61c0e@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xwgvccwzumpxs32k"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDX5RTFQKGQEBPT2TJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <a55741a065b818d8ff3843471da61c0e-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org


--xwgvccwzumpxs32k
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2017 at 07:21:19AM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-07-07 04:46=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi,
> >=20
> > On Thu, Jul 06, 2017 at 10:28:21PM +0800, Icenowy Zheng wrote:
> > > The PH16 pin has a function with mux id 0x5, which is the DET pin of
> > > the
> > > "sim" (smart card reader) IP block.
> > >=20
> > > This function is missing both in the old A10 and A20 drivers, so it's
> > > not found during the merge of these two drivers.
> > >=20
> > > Add it to the driver. As we now merged A20 pinctrl driver to the A10
> > > one, we need to only fix the A10 driver now.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >=20
> > I'm not sure what you mean there. It's not mentionned in the A10
> > datasheet, and neither in the A20. Where did you get that info from?
>=20
> It's mentioned in all newest datasheets: "A10 Datasheet V1.70.pdf" and
> "A20 Datasheet V1.41 20131230.pdf".

Mentionning that in the commit log would be great.

Where did you find those?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--xwgvccwzumpxs32k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZYz5QAAoJEBx+YmzsjxAgd0MQAK+z1++YYxF8M52D9e6L5PUB
yqx9+ccb+R1VZjxZPDfeHJ2WxUQogMd3JTc1/Q0gwPCeJiFhbkRL7pHfZH4QaHaS
bZRnlhN+WqQy51Akhf4Uoy7mnsVjqxVXblsjZzmKTjIpi5wqRR25WiWVX61Y3j7p
5S6xNcbOX9Ku2//MI5Ta9pF6vgp8a5lkHosY6u28kO+jgB6lDXiHeoUKTZdZEGYX
uVGpbdw9Nlu0MuXvKh84ss691sS2SG+KdTFh+we7MLbW9jjmaHVy6xx4I80xsusC
ZFc0vH0OaKcZV5YEikeTREVXHgGJDhVcRz1OWEV7cxlX/n38Q2/24ahMWXJomfNq
Gn+/M779vInhIQZMijzFbhnqmLGDTPaU/0oslvlWQ12WvPDslO+mLkauMQfIxZYM
vW087YvMK+msI5ulV8FSkFZL0Av5dRotbiUX46UobMt0kfsayVDiSgydN39ox27R
Hil8asZqpW0j+kSSPE3TiI+gD9Tcb0rkqC5861YCJ+pe0DOPqzcDhdTvWmIXcU/d
A0pR/zglN1zXXWE8LdCT+cbcFsUBvHyOQyB/qeYDiAEDxjGzEJudCxZ1QNeSFZEV
nWTZhxpxC2jPcVRNa31t78X7c8PTuzqrnW5UKYt9S1oc1O1TxmFhJhD/jkDPjPHH
mHrJo7EOLPvA9JgIQjO+
=tfWg
-----END PGP SIGNATURE-----

--xwgvccwzumpxs32k--
