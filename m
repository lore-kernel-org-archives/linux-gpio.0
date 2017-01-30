From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC fixes 0/2] FIX: Renesas RZ series pinctrl driver
Date: Mon, 30 Jan 2017 16:29:29 +0000
Message-ID: <SG2PR06MB116503FA052D0C2A96D5CE3B8A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165AE0403810D368E508C5F8A760@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <a8578e24-e142-aad6-a170-d682ee3b24d2@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <a8578e24-e142-aad6-a170-d682ee3b24d2@jmondi.org>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Monday, January 30, 2017, Jacopo Mondi wrote:
> > Note that the I2C pin need to be configured at "bi-directional" but
> > there is no way to specify that from DT, so that has to be added as a
> parameter.
>=20
> That's something I would like to discuss quite soon.
> One general thing I would like is having the so-called "additional
> parameters" part of the SoC driver module, as my gut feeling is that
> different PFC hw requires different configuration options.

In the API I used for the current RZ/A1 BSP, I used an extra parameter
to pass in any non-normal settings.


> In example, the RZ/A1 SoC requires the input/output direction of the pin
> to be specified even when the alternate function is supposed to drive it
> (in order to enable/disable input buffer). The same applies to bi-
> directional port control as you pointed out in your example (bi-
> directional enables input buffer, but that's a consequence of how hw work=
s
> there).
>=20
> I'm almost sure the same won't be required by all existing and forth-
> coming Renesas SoCs with a pin-based PFC hardware, but maybe other
> parameters I cannot think of right now will have to be specified instead.

I would guess for one reason or another, there is always some exception
in the hardware manual when it comes to pins settings. Meaning, there are
restrictions in the I/O pad circuits that the HW designers find it easier
to tell the SW guys to deal with it instead of trying to make it 'automatic=
'
in HW.
So...you'll always have the need for an extra parameter.


> If we want to keep the configuration flags SoC-specific, the most easy wa=
y
> to pass them down from core module to SoC module would be compressing the
> alternate function number and other configurations in a single u32.
>=20
> In that case the dts will look like:
>=20
> renesasa,rz-pins =3D <BANK PORT (ALTERNATE_FUNC_# | IO_MODE | DIRECTION)>=
;
>=20
> We could even add a parameter to separate ALTERNATE_FUNCTION from the
> additional configurations, but I don't see any advantage in doing this at
> the moment.

As I said, I made "additional configs" a separate parameter, but combining
it with ALTERNATE_FUNC_# is fine with me. I have not seen an SoC that allow=
ed
any more than 8 different functions per pin, so you have lots of bits
in u32 in order to set flags bits.

However, as already mentioned by Geert, "ALTERNATE_FUNC_#" is too long of
a name. Just "ALT_#" is fine.

    renesasa,rz-pins =3D <BANK PORT (ALT_# | IO_MODE | DIRECTION)>;

Geert's suggestion was to just use the actual number (1-8), ALT_# might mak=
e
it easier to decode if you are combining multiple things into a single u32.

There is one more idea....but I heist to suggest it.
You just pass in the port and alternate function number, and you do a looku=
p
table for settings such as bi-direction or port direction register.
You only put into the table the pin settings that are "not normal".

The benefit is that the user doesn't have to know what pins needs what spec=
ial
tweak/flag/setting....but of course it start to make the driver more comple=
x.



Chris
