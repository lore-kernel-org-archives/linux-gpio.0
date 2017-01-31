From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Tue, 31 Jan 2017 13:48:57 +0000
Message-ID: <SG2PR06MB1165749A38E25572B7B548D18A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB11651AE84528322CB29B33FF8A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <fd107367-caf5-0817-6a02-352f5af0dbb8@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <fd107367-caf5-0817-6a02-352f5af0dbb8@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On  Tuesday, January 31, 2017, Jacopo Mondi wrote:
> > Since one of the benefits of using devm_kzalloc is that if the probe
> > fails and returns an error, all the memory associated with that device
> > will automatically get freed, you 'might' not need this code to free
> > memory.
> >
> > I say might because I'm not sure if returning an error here will kill
> > the driver or not. But, might be interesting to look into.
> >
>=20
> No, returning an error here would not kill the driver BUT if
> dt_node_to_map fails, dt_free_map is called immediately later [1]
>=20
> So here we maybe should not use device managed memory as it does not brin=
g
> anything, do not free *map as it is freed later in dt_free_map, but
> release fngrps mux_modes and grpins, as we lose reference to them outside
> the scope of this function.
>=20
> Do you agree?

Like you said, there is no benefit one way of the other.

But, doing a grep of the pinctrl directory, devm_kzalloc is used more by
the other drivers than kzalloc, so maybe we just stick with devm_kzalloc

   (baah goes the sheep)


Chris



> -----Original Message-----
> From: jacopo mondi [mailto:jacopo@jmondi.org]
> Sent: Tuesday, January 31, 2017 4:01 AM
> To: Chris Brandt <Chris.Brandt@renesas.com>; Jacopo Mondi
> <jacopo+renesas@jmondi.org>; laurent.pinchart@ideasonboard.com;
> geert+renesas@glider.be; linus.walleij@linaro.org
> Cc: linux-renesas-soc@vger.kernel.org; linux-gpio@vger.kernel.org
> Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core modul=
e
>=20
> Hi Chris,
>=20
> On 30/01/2017 20:19, Chris Brandt wrote:
> > Hi Jacopo,
> >
> > On Wednesday, January 25, 2017, Jacopo Mondi wrote:
> >> +
> >> +	return 0;
> >> +
> >> +free_map:
> >> +	devm_kfree(rz_pinctrl->dev, *map);
> >> +free_fngrps:
> >> +	devm_kfree(rz_pinctrl->dev, fngrps);
> >> +free_pins:
> >> +	devm_kfree(rz_pinctrl->dev, mux_modes);
> >> +	devm_kfree(rz_pinctrl->dev, grpins);
> >> +	return ret;
> >> +}
> >
> > Since one of the benefits of using devm_kzalloc is that if the probe
> > fails and returns an error, all the memory associated with that device
> > will automatically get freed, you 'might' not need this code to free
> > memory.
> >
> > I say might because I'm not sure if returning an error here will kill
> > the driver or not. But, might be interesting to look into.
> >
>=20
> No, returning an error here would not kill the driver BUT if
> dt_node_to_map fails, dt_free_map is called immediately later [1]
>=20
> So here we maybe should not use device managed memory as it does not brin=
g
> anything, do not free *map as it is freed later in dt_free_map, but
> release fngrps mux_modes and grpins, as we lose reference to them outside
> the scope of this function.
>=20
> Do you agree?
>=20
> >
>=20
> >> +#define RZ_PIN_NAME(bank, pin)						\
> >> +	PIN_##bank##_##pin
> >> +
> >> +#define RZ_PIN_DESC(b, p)						\
> >> +	{ .number =3D RZ_PIN_NAME(b, p),					\
> >> +	  .name =3D __stringify(RZ_PIN_NAME(b, p)),			\
> >
> > The hardware manual uses the names "P1_0" for ports, so it might be
> > better to match that format for consistency.
> >
> >
>=20
> Noted
>=20
> Thanks
>     j
>=20
>=20
> [1] http://lxr.free-electrons.com/source/drivers/pinctrl/devicetree.c#L23=
6
>=20
