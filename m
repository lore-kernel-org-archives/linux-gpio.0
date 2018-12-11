From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Account for per-bank GPIO regulators
Date: Tue, 11 Dec 2018 18:01:35 +0100
Message-ID: <20181211170135.3e4rjkjmoe6imcsl@flea>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <CAGb2v672oGHpeKEb4HV8ecZro2v-NPC9cV_DKPdNv9dy2OTREQ@mail.gmail.com>
 <20181206154748.45iqfnlirm6blt4k@flea>
 <CAGb2v65wEMd0iCMBD83Sr5fpEkTte6S9-sJyoYLJmGzEOFYJNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5147596880131905508=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v65wEMd0iCMBD83Sr5fpEkTte6S9-sJyoYLJmGzEOFYJNQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org


--===============5147596880131905508==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u4ha7fbmu6qapv4v"
Content-Disposition: inline


--u4ha7fbmu6qapv4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, Dec 07, 2018 at 12:01:18AM +0800, Chen-Yu Tsai wrote:
> On Thu, Dec 6, 2018 at 11:47 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > On Thu, Dec 06, 2018 at 11:28:21PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Dec 6, 2018 at 10:02 PM Maxime Ripard <maxime.ripard@bootlin.=
com> wrote:
> > > > The main interogation I have currently is whether we should always =
try to
> > > > get the regulator for the current branch, or if we should restrict =
it to
> > > > the one available on the SoCs.
> > >
> > > Not sure what you mean here, but we should probably just list the act=
ual
> > > names.
> >
> > The A20 for example doesn't have a VCC-PB regulator, so do we want to
> > try to grab it if we request a PB* pin, or should we just know that
> > somehow and not do it?
>=20
> AFAIK, pin banks that don't have a separate supply are powered collective=
ly
> by VCC-IO, as mentioned below in my previous reply.

Sigh, it was too easy :)

Is VCC-IO supposed to be used for something else in the SoCs (and
therefore could be ignored?) or not?

Otherwise, we could have some hack where if the regulator is missing,
or if it's marked always-on, we just skip it, and if it isn't we emit
a warning. It should cover most cases, while keeping the code quite
simple.

> > > For pre-A20 SoCs (A10/A10s/A13), they aren't even named VCC-Px. Inste=
ad
> > > they are named after the primary function of the pin bank, such as
> > > VCC-CARD, VCC-NAND, VCC-CSI0, VCC-CSI1.
> >
> > I'd really prefer to stick to vcc-pX, that's pretty obvious even for
> > those older SoCs, and we can maintain some consistency that way.
>=20
> IRRC Mark said that supply names should match design names, not what is
> convenient. And then again there's the fallback for those that don't have
> separate rails.

That would require to complicate the logic a bit, to have something
less obvious. I'd really like to avoid it if possible.

> > > For pin banks that don't have per-bank power inputs, you should fall =
back
> > > to VCC-IO, or VCC-RTC in the case of the PL pins.
> > >
> > > So here's the rub: On A33 and later SoCs that are paired with a PMIC,=
 VCC-PL
> > > or VCC-RTC is powered by the RTC regulator of the PMIC, which only ge=
ts
> > > registered when the PMIC regulator driver is probed, which needs the =
RSB
> > > controller, which needs the pin controller and the PL pins...
> >
> > I haven't seen any VCC-P* on the A33, do you have a reference?
>=20
> The A33 has a VCC-PD. This is not listed in the datasheet, but is shown in
> schematics. Other pins would be powered by VCC-IO, with the exception of =
PL,
> which would be power by VCC-RTC. The last bit is just a guess. We should
> probably ask Allwinner, or try to do some tests.

Ack.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--u4ha7fbmu6qapv4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXA/tagAKCRDj7w1vZxhR
xZCcAQCY18jobwTB/KwxPyJuCg0AtOnpY1WitxiYMP3aR2XIEgD+M5Vijf0oHj/Q
im8qsbkU4Jv+1Ccf0FZ7T122uSQeTQ8=
=a9sm
-----END PGP SIGNATURE-----

--u4ha7fbmu6qapv4v--


--===============5147596880131905508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5147596880131905508==--
