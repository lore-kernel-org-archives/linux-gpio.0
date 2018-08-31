From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v2 3/3] ARM: dts: r9a06g032: Add pinctrl node
Date: Fri, 31 Aug 2018 08:13:07 +0000
Message-ID: <TY1PR01MB1769AF7EB0152AF03B7B77C3F50F0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1535634775-19365-4-git-send-email-phil.edworthy@renesas.com>
 <201808310827.o3GAs37i%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201808310827.o3GAs37i%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


On 31 August 2018 01:51 kbuild test robot wrote:
> Hi Phil,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on pinctrl/devel] [also build test ERROR on v4.19-=
rc1
> next-20180830] [if your patch is applied to the wrong git tree, please dr=
op us
> a note to help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Phil-Edworthy/Renesas-
> R9A06G032-PINCTRL-Driver/20180831-050708
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-
> pinctrl.git devel
> config: arm-mvebu_v5_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.2.0 make.cross ARCH=3Darm
>=20
> All errors (new ones prefixed by >>):
>=20
> >> Error: arch/arm/boot/dts/r9a06g032.dtsi:93.23-24 syntax error
>    FATAL ERROR: Unable to parse input tree

This error is because the patch depends on a patch from Geert:
"ARM: dts: r9a06g032: Use r9a06g032-sysctrl binding definitions"
https://patchwork.kernel.org/patch/10578707/

BR
Phil
