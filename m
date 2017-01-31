From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Tue, 31 Jan 2017 14:08:25 +0000
Message-ID: <SG2PR06MB11653BA310528FDBC90EF4F98A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <3913852.YsQFAgHAs5@avalon>
 <SG2PR06MB11651F027332E4A764567CF68A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <1875374.id8cHbqMxX@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1875374.id8cHbqMxX@avalon>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent (and Jacopo)

On Tuesday, January 31, 2017, Laurent Pinchart wrote:
> On Monday 30 Jan 2017 19:39:33 Chris Brandt wrote:
> > On Monday, January 30, 2017, Laurent Pinchart wrote:
> > >> +	pinctrl: pinctrl@fcfe3000 {
> > >> +		compatible =3D "renesas,rza1-pinctrl";
> > >> +		#address-cells =3D <1>;
> > >> +		#size-cells =3D <0>;
> > >> +
> > >> +		#pinctrl-cells =3D <2>;
> > >> +
> > >> +		reg =3D <0xfcfe3000 0xa30>, /* Pn, ..., PFCAEn */
> > >> +		      <0xfcfe7000 0x230>, /* PIBCn, ..., PIPCn */
> > >
> > > What's the reason for splitting those registers in two sets ? Maybe
> > > you can explain that in the DT bindings documentation that this
> > > patch series is missing ;-)
> >
> > I left this out of my review comments, but even though the chip
> > designers left a BIG HOLE in the memory map of the PFC controller, I
> > don't think it will 'cost' you anything by just mapping the whole area
> > (dead space and
> > all) and getting rid of the "high and low" memory indexing thing that
> > you are doing in the driver.
> > There is nothing mapped in that dead area anyway.
>=20
> For the first two areas, I agree. The third area is a separate pin
> controller for the JTAG port, not multiplexed with the GPIO ports. I even
> wonder whether it should be split in a separate DT node.


I think we should just forget about the JTAG pins completely.
Honestly, they are 2 pins that can only be configured as JTAG or a GPIO inp=
ut
(not even output).
No one is using those pins for anything other than JTAG.

IMHO, adding extra support just for those 2 pins is basically a waste of co=
de.


Chris
