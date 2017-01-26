From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Thu, 26 Jan 2017 02:57:54 +0000
Message-ID: <SG2PR06MB11653912C75B587A742FB0518A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:62478 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752453AbdAZC57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 21:57:59 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

Thanks for the patches.

On Wednesday, January 25, 2017, Jacopo Mondi wrote:
> Right now, the only "SoC" module support implemented is for RZ/A1H (Genma=
i
> and GR-Peach boards).

I'm going to give it a try on the RZ/A1 RSK board.


> I have tested the correctness of mux settings printing out register value=
s,
> and enabling/disabling the SCIF2 module connected to serial debug
> interface.

I can give it a try on things like Eth, I2C, SPI, SDHI, MMC.


> One note on the current DT ABI:
> right now a pin configuration is specified in DTS using utility macros
> defined in the (currently undocumented) arch/arm/boot/dts/include/dt-
> bindings/pinctrl/pinctrl-renesas-rz.h header file.
> Each pin configuration is a triplet of u32 in the form of
>=20
> <BANK PIN ALTERNATE_FUNC_#>
>=20
> It should be fairly easy adding additional parameters to configure what
> was missing in the original group-based PFC driver for RZ devices (I'm
> thinking of IO mode control, input buffer configuration, bi-directional
> configuration etc).

SDHI is one that will need another parameter. Half the pins need Bidirectio=
n
(PBDC) enabled, and the other half need PBDC disabled.
SDHI data pins are PBDC=3D1, the others are PBDC=3D0.


> The series makes use of newly introduced pin[ctrl|mux]_generic functions,
> currently only available in Linus Walleij's linux-pinctrl.git tree.

Hmmm, I was hoping to 'easily' back port this to 4.9.
I guess if it's the best way forward, then maybe I can back port those new
generic functions for the LTSI tree.


Chris

