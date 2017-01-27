From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC fixes 0/2] FIX: Renesas RZ series pinctrl driver
Date: Fri, 27 Jan 2017 21:09:36 +0000
Message-ID: <SG2PR06MB1165AE0403810D368E508C5F8A760@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:48463 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750839AbdA0VK1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Jan 2017 16:10:27 -0500
In-Reply-To: <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Friday, January 27, 2017, Jacopo Mondi wrote:
> Hello,
>    sorry if I'm sending 2 patches on top of an RFC series with comments
> still pending, but these patches enabled me to properly test pin
> configuration sequence in order to access the internal EEPROM through
> RIIC2 interface on pins 1_4 and 1_5.
>=20
> The outcome is a bugfix to RZ/A1 pincontroller driver which [2/2] applies
> on.
>=20
> When sending v2 of the whole series I'll probably squash these, but if
> someone is testing the RFC series I wanted to make sure he does not waste
> his time with a broken driver.
>=20
> Thanks
>    j
>=20
> Jacopo Mondi (2):
>   arm: dts: genmai: Configure RIIC2 pins
>   pinctrl: rz-pfc: Fix RZ/A1 pin function configuration
>=20
>  arch/arm/boot/dts/r7s72100-genmai.dts |  8 ++++-  drivers/pinctrl/rz-
> pfc/pinctrl-rza1.c | 55 +++++++++++++++++++++++------------
>  2 files changed, 43 insertions(+), 20 deletions(-)


Preliminary testing shows that I2C pin muxing works. Nice job!

Testing:
- RZ/A1H RSK board
- u-boot modified to make sure pins are put back to GPIO-IN
- RIIC ch3 is connected to a I2C port expander that has 3 LEDs attached
- using a heartbeat kernel thread that blinks the LEDs

Of course, more testing is needed to make sure there is no "smoke and mirro=
rs"
going on like there was with the MSTP clock driver ;)


Note that the I2C pin need to be configured at "bi-directional" but there i=
s
no way to specify that from DT, so that has to be added as a parameter.

I am very happy about how easy it is to set the pins up! It almost matches
what I do in our BSP code today, so I didn't even have to look at the HW sc=
hematic.

I'll give Ethernet and SDHI a try. For RSPI, I have to go manually wire up =
a
SPI flash again.


Chris

