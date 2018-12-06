From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Account for per-bank GPIO regulators
Date: Thu, 6 Dec 2018 16:47:48 +0100
Message-ID: <20181206154748.45iqfnlirm6blt4k@flea>
References: <cover.50931fbda5c95345087740e4c1ef5a57fdd53480.1544104801.git-series.maxime.ripard@bootlin.com>
 <CAGb2v672oGHpeKEb4HV8ecZro2v-NPC9cV_DKPdNv9dy2OTREQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8475203839173336906=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v672oGHpeKEb4HV8ecZro2v-NPC9cV_DKPdNv9dy2OTREQ@mail.gmail.com>
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


--===============8475203839173336906==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3p65rvocvdnl33n"
Content-Disposition: inline


--o3p65rvocvdnl33n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 06, 2018 at 11:28:21PM +0800, Chen-Yu Tsai wrote:
> On Thu, Dec 6, 2018 at 10:02 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > The main interogation I have currently is whether we should always try =
to
> > get the regulator for the current branch, or if we should restrict it to
> > the one available on the SoCs.
>=20
> Not sure what you mean here, but we should probably just list the actual
> names.

The A20 for example doesn't have a VCC-PB regulator, so do we want to
try to grab it if we request a PB* pin, or should we just know that
somehow and not do it?

> For pre-A20 SoCs (A10/A10s/A13), they aren't even named VCC-Px. Instead
> they are named after the primary function of the pin bank, such as
> VCC-CARD, VCC-NAND, VCC-CSI0, VCC-CSI1.

I'd really prefer to stick to vcc-pX, that's pretty obvious even for
those older SoCs, and we can maintain some consistency that way.

> For pin banks that don't have per-bank power inputs, you should fall back
> to VCC-IO, or VCC-RTC in the case of the PL pins.
>=20
> So here's the rub: On A33 and later SoCs that are paired with a PMIC, VCC=
-PL
> or VCC-RTC is powered by the RTC regulator of the PMIC, which only gets
> registered when the PMIC regulator driver is probed, which needs the RSB
> controller, which needs the pin controller and the PL pins...

I haven't seen any VCC-P* on the A33, do you have a reference?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--o3p65rvocvdnl33n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAlEpAAKCRDj7w1vZxhR
xVabAQCqu+dBO94jNhc2W8zf2ladtWH3siBrp4V4DFpbjBkhGQD8CcdzEPiMVR5Q
+sD0X4W8RThkXDBVipKF1IcFb+vF4gE=
=Eecb
-----END PGP SIGNATURE-----

--o3p65rvocvdnl33n--


--===============8475203839173336906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8475203839173336906==--
