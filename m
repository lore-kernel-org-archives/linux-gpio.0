From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v3 3/3] ARM: dts: r9a06g032: Add pinctrl node
Date: Wed, 19 Sep 2018 09:18:41 +0000
Message-ID: <TY1PR01MB17690D4C023EB9B4A5164A2AF51C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20180917163609.30457-1-phil.edworthy@renesas.com>
 <20180917163609.30457-4-phil.edworthy@renesas.com>
 <20180919091524.rgbk4m6ht34idkpd@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919091524.rgbk4m6ht34idkpd@verge.net.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Simon,

On 19 September 2018 10:15 Simon Horman wrote:
> On Mon, Sep 17, 2018 at 05:36:09PM +0100, Phil Edworthy wrote:
> > This provides a pinctrl driver for the Renesas R9A06G032 SoC
> >
> > Based on a patch originally written by Michel Pollet at Renesas.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>=20
> Thanks Phil, I will defer this patch pending acceptance of the bindings.
> Please continue to repost this patch with updates to the bindings or
> otherwise ping me once they have been accepted.
Thanks, however I will send a new version of this patch to remove the
clock-names prop as it is not needed.

Thanks
Phil


> > ---
> > v3:
> >  - No changes.
> > v2:
> >  - Add "renesas,rzn1-pinctrl" compatible fallback string
> >  - Register size corrected.
> > ---
> >  arch/arm/boot/dts/r9a06g032.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r9a06g032.dtsi
> > b/arch/arm/boot/dts/r9a06g032.dtsi
> > index eaf94976ed6d..2322268bc862 100644
> > --- a/arch/arm/boot/dts/r9a06g032.dtsi
> > +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> > @@ -165,6 +165,14 @@
> >  			status =3D "disabled";
> >  		};
> >
> > +		pinctrl: pin-controller@40067000 {
> > +			compatible =3D "renesas,r9a06g032-pinctrl",
> "renesas,rzn1-pinctrl";
> > +			reg =3D <0x40067000 0x1000>, <0x51000000 0x480>;
> > +			clocks =3D <&sysctrl R9A06G032_HCLK_PINCONFIG>;
> > +			clock-names =3D "bus";
> > +			status =3D "okay";
> > +		};
> > +
> >  		gic: gic@44101000 {
> >  			compatible =3D "arm,cortex-a7-gic", "arm,gic-400";
> >  			interrupt-controller;
> > --
> > 2.17.1
> >
