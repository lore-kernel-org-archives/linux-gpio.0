From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Thu, 5 Jan 2017 23:42:10 +0100
Message-ID: <20170105224210.wfinfucbpkkd44om@lukather>
References: <20161223125001.1176-1-icenowy@aosc.xyz>
 <1280f095-ab03-93f8-14d2-99d13ba1ce55@arm.com>
 <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gto3zne6bxh4246i"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQ4XXPBQKGQEJKPNBZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


--gto3zne6bxh4246i
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2016 at 01:55:44PM +0100, Linus Walleij wrote:
> On Mon, Dec 26, 2016 at 3:33 PM, Andr=C3=A9 Przywara <andre.przywara@arm.=
com> wrote:
>=20
> > So while this patch technically looks correct, I was wondering if we
> > should really explore the possibility of making the whole of sunxi
> > pinctrl DT controlled.
> > I brought this up a while ago, but people weren't overly enthusiastic
> > about it, though their argument weren't really convincing to me[1].
> >
> > So:
> > As this "driver" here is basically a table linking GPIO bit settings
> > (the actual mux value) to names and every pin we care about needs to be
> > enumerated in the DT anyway, why not just add something like:
> > allwinner,pinmux =3D <4>;
> > to each pin(group) in the DT and get rid of this "driver" file here
> > entirely?
>=20
> I'm open to that if you can use pinctrl-single which is in the kernel
> for this purpose only, and is used with both OMAPs and HiSilicon.

I'm not open to that, and I'm getting tired of discussing it over and
over again. Andre, if you want to be convinced again, please read the
last discussion we had on this topic.

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

--gto3zne6bxh4246i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbsvCAAoJEBx+YmzsjxAgUDwQAI9tPh9M6E6EK7OVqSuDdCZd
3YMVM7MyTC6erdY281G1pwHgTUFuj+xf0NJBEAeVk9QOVwEa8hZTaYwI2/SQn0pP
P8XALoUMewCNDS2dOIgeIk9BvAzWr/OsYg4tRDqpRZmoclKe22DyCjnnQwrvA9TX
4Ed+dcP5a0BLBXWlE+/0hnPpXf+6Ss77vjO5TyGP67/E9CkpTR3mjxDlchEkLURQ
2+Lq/FxYloe6UBU3ciZSq//pzQ1Pc6G2OktYQ+o2N0VC/BR4budIBfCaaCnhFLZQ
OrqBeTK/oQVIllm4K6BxOIcu6v2n0GUiJ35wsLt4f+O6gC6is/ENr5AB7TGzxDN4
LAam/iFDRNY/aYkLy3Z1ms3VzFqDNWCjnIZYKHrfpSGQe3AcOLiMJs7kGV7NRWSD
6l+VqMaVPOn1ANZJfKxdMPe2Gv2gZ3edzppxzi1ViQRZcN98wuTDn8B/Tfr5BV3h
Ocbzvvvc7tbwjVlt93QNLgL35DH7CRagK2lFBgUExZObWpnsHdkJYsF8nQsqGhQj
Yan+Klx4yfT6U4Vp25qoCge3H8z046xGBL3zf8SCNAHq03KkG1AHQVE4EdG6gbtv
GYX0Hp6cuAVe3dajH/YMUe36HP9O3VSXp82esILlOgFdxpm0AkDhNAJP+s+r4A30
IfgRZmApg1lnnd/qrw8y
=9/lo
-----END PGP SIGNATURE-----

--gto3zne6bxh4246i--
