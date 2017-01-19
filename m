From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Thu, 19 Jan 2017 18:29:59 +0100
Message-ID: <20170119172959.pyulsvak4wpqor2x@lukather>
References: <20161223125001.1176-1-icenowy@aosc.xyz>
 <1280f095-ab03-93f8-14d2-99d13ba1ce55@arm.com>
 <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
 <20170105224210.wfinfucbpkkd44om@lukather>
 <38fe3491-457a-f0c5-54fb-9defdcd45045@arm.com>
 <20170116163124.c5gusyd3j3goivnf@lukather>
 <87a535d3-1170-c388-ce7d-4921e69f4cab@arm.com>
 <CACRpkdaTVY7Of5bKyk81xA2kUnZVMQ8LnWEJosg7Ns3s5nAEYQ@mail.gmail.com>
 <128701484831509@web34m.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4s32kf5zsmmdqtdf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBGPPQPCAKGQEUB6FORY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <128701484831509-mf8Frdr2Tdlxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


--4s32kf5zsmmdqtdf
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 09:11:49PM +0800, Icenowy Zheng wrote:
> 19.01.2017, 17:23, "Linus Walleij" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > On Wed, Jan 18, 2017 at 10:44 AM, Andre Przywara <andre.przywara-AbSShOkvfpQ@public.gmane.org=
m> wrote:
> >
> >> =C2=A0Any future SoCs could then just use that compatible and would de=
scribe
> >> =C2=A0the SoC details in the DT, like it's meant to be and like we do =
already,
> >> =C2=A0but extended by putting the mux value in there as well.
> >> =C2=A0So the only kernel contribution would then be the DT, really, (.=
..)
> >
> > Your different positions have existed since the inception of the
> > pinctrl subsystem:
> >
> > - One camp (myself included) wanted to describe the hardware mostly
> > =C2=A0=C2=A0in the driver: functions, groups etc are tables in the driv=
er file.
> >
> > - Another camp (OMAP included) think that the device tree should take
> > =C2=A0=C2=A0store most things: groups functions, etc.
> >
> > What we know for sure should be described in DT is how different
> > IP blocks are connected in an SoC (e.g. interrupts, clocks, DMA
> > channels, regulators) and on the of course outside of the SoC, on
> > the board.
> >
> > The question here is whether the way a hardware has instantiated
> > a certain IP block when doing physical compilation in their
> > Verilog, VHDL or SystemC files, is something that should be
> > described in DT.
> >
> > Many companies have developed tools to
> > extract this data from their hardware design files and provide
> > it to developers as a blob och incomprehensible data, such was
> > the situation for OMAP for example. So to them it made most
> > sense to implement pinctrl-single, just parsing that data into
> > DTS(I) files.
> >
> > Other companies (such as STMicroelectronics) instead put a
> > team of people to write a datasheet with a special chapter
> > on how pins etc are connected, and programmers are given
> > this datasheet and need to again type in the data and define
> > groups etc.
> >
> > Whether parametrization of a HW block should be done in the
> > driver file from the compatible string or with custom attributes
> > in the node is not a simple answer to the question. OF is vague
> > on this kind of things: both solutions exist.
> >
> > Allwinner and Qualcomm authors faced a situation such as that
> > they were given a code dump and no datasheet and no data
> > tables either. That creates an especially complicated situation
> > where none of the above scenarios apply.
>=20
> Allwinner do give user manual about the pin controller, and they're
> used when we write the pinctrl-sunxi driver.

That has not always been true for all the SoCs, and it's still not the
case, even for newer SoCs.

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

--4s32kf5zsmmdqtdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgPeTAAoJEBx+YmzsjxAgKWcQAJpb2jSv5mTF4QdIvYcFdXcq
ZNkvvIYMggxxTrD9vbw9nSfcJXgblUUfklxCYzIAHOHdMB7kDO5TKJaWbF2iWDdI
bLJqYbtT20XjogclEXuO4s5r7xC3G1yCW4ok+XsvTTTMQNi2OfoAxpkHHyIBZoED
9mAnLTHpZdlVjwpZrunIohFFh/KJF5y9GWWxYmrs5/CrPLeUBYH65z92H63Sfye1
FzLsm44wa+2eFQaV1ZFchfX1TZKgwU/sCZNP8lT8J4Xa1lrxqhXHTi0oFlIPSbfq
jHLW9EQCcNQPuq6TZcyJ/k8r7DdhImtvyHSowtewULPTPOlTWDTbtWRbDNJpl72d
Q5iPoQv6rprHTbM+960gmecSMCxudbyf0v4DiLqEL8KT13uAKp/wVXSHqev0evS+
oqdwLaBaoW4FXHT1CuOHVUb44k6AjRGN6l4SjtZjDoAhup1SM5Z8hcKKYT4UV3bH
TmR2CFCR3YjbbrimhLPrIJP6jTtwlr0fKV+NipIYw/41fDFGA8TWc13r00MQM7gW
yDjrak4NldCSo1LL0KflmC4QeKZO/p/L3sEvUIkqr5GFeXDeasJT6NZrmk4m95cD
gEaftsuiImXbIfxb49dfzaq3Or4Vb0x6CYoKZ/PKYKrXkMI4/RWg8FORtIk+Q9Ad
hv4qxUmhL38cwu6MjEaF
=ghd8
-----END PGP SIGNATURE-----

--4s32kf5zsmmdqtdf--
