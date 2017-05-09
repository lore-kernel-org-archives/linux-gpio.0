From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH/RFC 0/4] sh: sh7722/sh7757i/sh7264/sh7269: Fix pinctrl
 registration
Date: Tue, 9 May 2017 15:53:31 +0000
Message-ID: <HK2PR0601MB1393F1581E1650E06A5B78C0F5EF0@HK2PR0601MB1393.apcprd06.prod.outlook.com>
References: <1494339117-31221-1-git-send-email-geert+renesas@glider.be>
 <2601530.Ncn6bLinC5@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2601530.Ncn6bLinC5@avalon>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Magnus Damm <magnus.damm@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for the patches, sorry I can't test these either... It's been quite =
a few
years since I had an sh7264 or sh7269 board!

Thanks
Phil

-----Original Message-----
On: 09 May 2017 16:44, Laurent Pinchart wrote:
Subject: Re: [PATCH/RFC 0/4] sh: sh7722/sh7757i/sh7264/sh7269: Fix pinctrl =
registration

Hi Geert,

Thank you for the patches.

On Tuesday 09 May 2017 16:11:53 Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> Magnus reported that on sh7722/Migo-R, pinctrl registration fails with:
>=20
>     sh-pfc pfc-sh7722: pin 0 already registered
>     sh-pfc pfc-sh7722: error during pin registration
>     sh-pfc pfc-sh7722: could not register: -22
>     sh-pfc: probe of pfc-sh7722 failed with error -22
>=20
> pinmux_pins[] is initialized through PINMUX_GPIO(), using designated=20
> array initializers, where the GPIO_* enums serve as indices.
> Apparently GPIO_PTQ7 was defined in the enum, but never used.
> If enum values are defined, but never used, pinmux_pins[] contains
> (zero-filled) holes.  Hence such entries are treated as pin zero,=20
> which was registered before, and initialization fails.
>=20
> I can't see how this ever worked, as at the time of commit=20
> f5e25ae52feff2dc
> ("sh-pfc: Add sh7722 pinmux support"), pinmux_gpios[] in=20
> drivers/pinctrl/sh-pfc/pfc-sh7722.c already had the hole, and=20
> drivers/pinctrl/core.c already had the check.
>=20
> Some scripting revealed a few more broken drivers:
>   - sh7757 has four holes, due to nonexistent GPIO_PT[JLNQ]7_RESV.
>   - sh7264 and sh7269 define GPIO_PH[0-7], but don't use it with
>     PINMUX_GPIO().
>=20
> Patch 1 fixes the issue on sh7722, and was tested.
> Patches 3-4 should fix the issue on the other 3 SoCs, but was untested=20
> due to lack of hardware.

This all looks good to me, even if I can't test or verify patches 2/4 to 4/=
4 as I don't have access to the hardware or datasheet either. Given that th=
ey're untested I wouldn't fake the error message in the commit log though, =
but just refer to the problem noticed on sh7722.

Apart from that, for the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Thanks for your comments!
>=20
> Geert Uytterhoeven (4):
>   sh: sh7722: Remove nonexistent GPIO_PTQ7 to fix pinctrl registration
>   [RFC] sh: sh7757: Remove nonexistent GPIO_PT[JLNQ]7_RESV to fix
>     pinctrl registration
>   sh: sh7264: Remove nonexistent GPIO_PH[0-7] to fix pinctrl
>     registration
>   [RFC] sh: sh7269: Remove nonexistent GPIO_PH[0-7] to fix pinctrl
>     registration
>=20
>  arch/sh/include/cpu-sh2a/cpu/sh7264.h | 4 +--- =20
> arch/sh/include/cpu-sh2a/cpu/sh7269.h | 4 +--- =20
> arch/sh/include/cpu-sh4/cpu/sh7722.h  | 2 +- =20
> arch/sh/include/cpu-sh4/cpu/sh7757.h  | 8 ++++----
>  4 files changed, 7 insertions(+), 11 deletions(-)

--
Regards,

Laurent Pinchart
