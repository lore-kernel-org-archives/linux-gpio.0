From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH 1/2] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Mon, 16 Jan 2017 17:31:24 +0100
Message-ID: <20170116163124.c5gusyd3j3goivnf@lukather>
References: <20161223125001.1176-1-icenowy@aosc.xyz>
 <1280f095-ab03-93f8-14d2-99d13ba1ce55@arm.com>
 <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
 <20170105224210.wfinfucbpkkd44om@lukather>
 <38fe3491-457a-f0c5-54fb-9defdcd45045@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3877456150275335401=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <38fe3491-457a-f0c5-54fb-9defdcd45045@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: ext Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org


--===============3877456150275335401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bxzghxtkpw7us5q3"
Content-Disposition: inline


--bxzghxtkpw7us5q3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2017 at 12:16:00AM +0000, Andr=E9 Przywara wrote:
> On 05/01/17 22:42, Maxime Ripard wrote:
> > On Fri, Dec 30, 2016 at 01:55:44PM +0100, Linus Walleij wrote:
> >> On Mon, Dec 26, 2016 at 3:33 PM, Andr=E9 Przywara <andre.przywara@arm.=
com> wrote:
> >>
> >>> So while this patch technically looks correct, I was wondering if we
> >>> should really explore the possibility of making the whole of sunxi
> >>> pinctrl DT controlled.
> >>> I brought this up a while ago, but people weren't overly enthusiastic
> >>> about it, though their argument weren't really convincing to me[1].
> >>>
> >>> So:
> >>> As this "driver" here is basically a table linking GPIO bit settings
> >>> (the actual mux value) to names and every pin we care about needs to =
be
> >>> enumerated in the DT anyway, why not just add something like:
> >>> allwinner,pinmux =3D <4>;
> >>> to each pin(group) in the DT and get rid of this "driver" file here
> >>> entirely?
> >>
> >> I'm open to that if you can use pinctrl-single which is in the kernel
> >> for this purpose only, and is used with both OMAPs and HiSilicon.
> >=20
> > I'm not open to that, and I'm getting tired of discussing it over and
> > over again. Andre, if you want to be convinced again, please read the
> > last discussion we had on this topic.
>=20
> As I said: It didn't convince me back then. And frankly we didn't really
> discuss it back then, I just refrained from entering a discussion
> against _two_ maintainers at this time, since my capacity on this kind
> of email threads is really very limited - especially for something that
> is a hobby to me.

This is also (mostly) a hobby to me, which is exactly why I prefer to
work on something actually useful, rather than just discussing this
over and over again. Just like I don't want (myself, or anyone,
really, since we're all in the same boat) to have to maintain two
separate pinctrl drivers.

We're having a documented, simple, pinctrl binding, using the generic
bindings now (that almost everyone else is using now, or is very close
to), and we can leverage as much documentation and code from that. Why
would we want to create and maintain a new driver with a new binding,
that will need to be documented again, learned by everyone, and will
lead only to confusion across the people who just want to have their
board supported?

And imagine the kind of mess we would be in if everyone getting a bit
involved in the support of one platform at one point wanted to trash
one big part of its infrastructure and start all over again because he
likes it better this way.

I'm sorry, but this is also our jobs as maintainers to prevent all
these kind of issues, and to maintain consistency. Switching to one
binding to another breaks that consistency on many level, both in
pinctrl and in the platform support itself. So sorry, but that's not
going to happen.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bxzghxtkpw7us5q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfPVYAAoJEBx+YmzsjxAgcekP/RPKm1QB/a/lRFYPmDHSW4V/
Lj6FC+gzeehtmfUuXSb7wElWCsWaCbFhBad4zL1j86gBdScyl9RcwPKwek7D8TbB
0ls3EGBCjtZAwqR9v15U2vAJ62UdzbW4e7k7Ev0u/raOgUPxAcStoh8Uv4I8WGdy
YKTeYU9pnhxBsCbrH8TLlJM9Unn0Rs3W26C/Pc4+lw+016YgPWVdQDoXJQywhRq/
ZNsRpckFT7qsMImIWGB2bV4yTFNsok4ggMCLdVRB1Up7fszbo3ZXHgeu46adPX1m
mectfMnhCFHeW6TgDIzfOo9/ELWeXe2XsLYTeHK0oAG8SGJzYj2grWTpLYr78wFD
8JuuWxSiFri1TN6ptU6oQeBXDf3K6iSuDMmNrPZ761IT6U449PO3bdJodsua0us/
eq2U49J2QzoK7Pela9zJtRX+0HiOlsErfyyHuwKw39VGOLOgLE6pNcreDzvgxfAj
ZGMPyA+ORsieZIuUarCGwuKTq5f+fPMVm9OpCI14tD1xCGquQgpSKnLuTTypo9bi
E9G8ubLFA9h13TVvUwI3vXe0/fJyhR6L/Rl1Gl3CJg0Rwtdr60fi1SKIl9RO41iG
ekz32vQivdd/liiH4JbrHbLnT7wqVBzxBdcCzmwNLT1scFkMx+s5aXg6ZrBx4mUL
dKIfu1K1O+X5z6gla7iG
=s/ZF
-----END PGP SIGNATURE-----

--bxzghxtkpw7us5q3--


--===============3877456150275335401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3877456150275335401==--
