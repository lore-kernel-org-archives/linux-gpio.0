From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH] pinctrl: imx: make sure that maps are fully initialized
Date: Mon, 12 Nov 2018 15:04:48 +0000
Message-ID: <AM0PR04MB4211FE365D78EDEB0003D74380C10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1541871439-4882-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541871439-4882-1-git-send-email-martin@kaiser.cx>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Martin,

> -----Original Message-----
> From: Martin Kaiser [mailto:martin@kaiser.cx]
> Sent: Sunday, November 11, 2018 1:37 AM
[...]
>=20
> The commit that added scu based pinctrl support introduced a regression f=
or
> the mmio case. In the for-loop where the maps are initialized, we end up
> creating a partially initialized map in some cases. This causes a kernel =
panic
> when such a map is used at a later stage.
>=20
> When scu is not used and and a pin uses the default pad configuration, th=
e
> current code sets the map's type and data.configs.group_or_pin but no con=
figs
> or num_configs are set. The previous code without scu support did not cre=
ate a
> new map at all in this case and did not increment the counter.
>=20
> Fix this by setting the map type and data.configs.group_or_pin only when =
a
> configuration was set before, either by scu or by mmio using a non-defaul=
t pad
> config. Increment the counter only if a new map was created.
>=20
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Cc: A.s. Dong <aisheng.dong@nxp.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Thanks for reporting this issue.
The original code intended to save 3 common lines for both SCU and MMIO pad=
s,
but it did change the code logic a bit which resulted in a regression speci=
ficly
for NO_PAD_CTL cases used on a few legacy boards. (NO_PAD_CTL is deprecated
for new boards dts).

I agree with Leonard that this fixes is not so good.
A simpler and proper fix could be:

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/free=
scale/pinctrl-imx.c
index b704f7c..ab962f5 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -109,6 +109,15 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctl=
dev,
        new_map++;
        for (i =3D j =3D 0; i < grp->num_pins; i++) {
                pin =3D &((struct imx_pin *)(grp->data))[i];
+
+               /*
+                * We only create config maps for SCU pads or MMIO pads tha=
t
+                * are not using the default config (a.k.a NO_PAD_CTL)
+                */
+               if (!(info->flags & IMX_USE_SCU) &&
+                   (pin->conf.mmio.config & IMX_NO_PAD_CTL))
+                       continue;
+
                new_map[j].type =3D PIN_MAP_TYPE_CONFIGS_PIN;
                new_map[j].data.configs.group_or_pin =3D
                                        pin_get_name(pctldev, pin->pin);
@@ -121,7 +130,7 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctld=
ev,
                        new_map[j].data.configs.configs =3D
                                        (unsigned long *)&pin->conf.scu;
                        new_map[j].data.configs.num_configs =3D 2;
-               } else if (!(pin->conf.mmio.config & IMX_NO_PAD_CTL)) {
+               } else {
                        new_map[j].data.configs.configs =3D
                                        &pin->conf.mmio.config;
                        new_map[j].data.configs.num_configs =3D 1;
@@ -550,6 +559,8 @@ static void imx_pinctrl_parse_pin_mmio(struct imx_pinct=
rl *ipctl,
                pin_mmio->config =3D config & ~IMX_PAD_SION;
        }
=20
+       *list_p =3D list;  //thanks to Leonard for pointing out this
+
        dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[*pin_id].name,
                             pin_mmio->mux_mode, pin_mmio->config);

As you both had a patch, i'm not sure who i'm going to expect for a updated=
 one,
so I would send it my own with both of your tags.

Thanks for the effort.

Regards
Dong Aisheng

> ---
>=20
> A crash looks like this
>=20
> [    4.028525] Unable to handle kernel NULL pointer dereference at virtua=
l
> address 00000000
> [    4.036667] pgd =3D (ptrval)
> [    4.039505] [00000000] *pgd=3D00000000
> [    4.043162] Internal error: Oops: 5 [#1] ARM
> [    4.047466] Modules linked in:
> [    4.050582] CPU: 0 PID: 1 Comm: swapper Not tainted
> 4.20.0-rc1-next-20181106+ #2269
> [    4.058270] Hardware name: Freescale i.MX25 (Device Tree Support)
> [    4.064456] PC is at strcmp+0xc/0x40
> [    4.068111] LR is at create_pinctrl+0x104/0x36c
> [    4.072680] pc : [<c05699d8>]    lr : [<c0220bc8>]    psr: 60000013
> [    4.078980] sp : d38bbce8  ip : d38bbcf8  fp : d38bbcf4
> [    4.084236] r10: d3b2e0e0  r9 : d3b2e0c0  r8 : 00000000
> [    4.089494] r7 : d3b2e238  r6 : d3b2e1c0  r5 : 00000000  r4 :
> d3b0df00
> [    4.096054] r3 : 85981bcd  r2 : 85981bcd  r1 : d3a729e0  r0 :
> 00000000
> [    4.102615] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> Segment none
> [    4.109786] Control: 0005317f  Table: 80004000  DAC: 00000053
> [    4.115569] Process swapper (pid: 1, stack limit =3D 0x(ptrval))
> [    4.121437] Stack: (0xd38bbce8 to 0xd38bc000)
> [    4.125849] bce0:                   d38bbd3c d38bbcf8 c0220bc8
> c05699dc d38bbd3c c06adb58
> [    4.134084] bd00: c078cc54 d3b0df0c d3a729e0 00000002 00000000
> c078cc40 d3b0e800 d3b0e800
> [    4.142318] bd20: c07c7ba0 c07e8ed0 c07c0480 c07cf820 d38bbd54
> d38bbd40 c0220eec c0220ad4
> [    4.150553] bd40: d3b0e800 d3b2e230 d38bbd74 d38bbd58 c0220f44
> c0220e40 c028e24c d3b0e800
> [    4.158787] bd60: 00000000 d3b0df50 d38bbd94 d38bbd78 c02a6e38
> c0220f18 d3b0e948 d3b0e800
> [    4.167019] bd80: 00000000 c07a66d8 d38bbdd4 d38bbd98 c028a614
> c02a6dfc 20000013 85981bcd
> [    4.175254] bda0: c07a66d8 00000000 d3b0e800 d3b0e800 c07a66d8
> c07a66d8 c028acac c07c7ac8
> [    4.183489] bdc0: c07c0480 c07cf820 d38bbe0c d38bbdd8 c028ac54
> c028a4fc c03a8acc c03a69f0
> [    4.191722] bde0: d38bbe0c d38bbdf0 d3b0e800 d3b0e834 c07a66d8
> c028acac c07c7ac8 c07c0480
> [    4.199954] be00: d38bbe2c d38bbe10 c028ad94 c028aaf0 00000000
> d3b0e800 c075b028 c07a66d8
> [    4.208189] be20: d38bbe5c d38bbe30 c028867c c028acbc d38bbe68
> d38fe64c d3b08f30 85981bcd
> [    4.216421] be40: c07a66d8 00000000 d3b29980 c0798384 d38bbe6c
> d38bbe60 c028a01c c0288618
> [    4.224655] be60: d38bbe9c d38bbe70 c0289954 c028a004 c069a541
> c07176a8 d38bbe9c c07a66d8
> [    4.232890] be80: 00000006 c07176a8 c075b028 00000000 d38bbeb4
> d38bbea0 c028b99c c028983c
> [    4.241124] bea0: c075687c 00000006 d38bbec4 d38bbeb8 c02e9150
> c028b8ec d38bbed4 d38bbec8
> [    4.249357] bec0: c07176c8 c02e9108 d38bbf4c d38bbed8 c000ab54
> c07176b8 c0034038 c06ed774
> [    4.257589] bee0: 00000000 d38bbe00 d38bbee4 c06eb8ec 00000085
> c06eb8ec 00000000 00000006
> [    4.265822] bf00: 00000006 00000086 c06eae74 c06ed764 d38bbf34
> d3ffcbbc d3ffcbc6 85981bcd
> [    4.274057] bf20: 00000000 85981bcd c075687c 00000006 c07c0480
> c0733830 00000086 c07cf820
> [    4.282289] bf40: d38bbf94 d38bbf50 c06ee0e8 c000aadc 00000006
> 00000006 00000000 c06ed764
> [    4.290520] bf60: 00000000 c0023240 d38bbf84 00000000 c0571424
> 00000000 00000000 00000000
> [    4.298753] bf80: 00000000 00000000 d38bbfac d38bbf98 c057143c
> c06edf5c 60000053 00000000
> [    4.306982] bfa0: 00000000 d38bbfb0 c00090e0 c0571434 00000000
> 00000000 00000000 00000000
> [    4.315210] bfc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    4.323436] bfe0: 00000000 00000000 00000000 00000000 00000013
> 00000000 00000000 00000000
> [    4.331634] Backtrace:
> [    4.334199] [<c05699cc>] (strcmp) from [<c0220bc8>]
> (create_pinctrl+0x104/0x36c)
> [    4.341679] [<c0220ac4>] (create_pinctrl) from [<c0220eec>]
> (pinctrl_get+0xbc/0xd8)
> [    4.349403]  r10:c07cf820 r9:c07c0480 r8:c07e8ed0 r7:c07c7ba0
> r6:d3b0e800 r5:d3b0e800
> [    4.357265]  r4:c078cc40
> [    4.359869] [<c0220e30>] (pinctrl_get) from [<c0220f44>]
> (devm_pinctrl_get+0x3c/0x7c)
> [    4.367745]  r5:d3b2e230 r4:d3b0e800
> [    4.371416] [<c0220f08>] (devm_pinctrl_get) from [<c02a6e38>]
> (pinctrl_bind_pins+0x4c/0x258)
> [    4.379907]  r6:d3b0df50 r5:00000000 r4:d3b0e800 r3:c028e24c
> [    4.385654] [<c02a6dec>] (pinctrl_bind_pins) from [<c028a614>]
> (really_probe+0x128/0x40c)
> [    4.393883]  r6:c07a66d8 r5:00000000 r4:d3b0e800 r3:d3b0e948
> [    4.399613] [<c028a4ec>] (really_probe) from [<c028ac54>]
> (driver_probe_device+0x174/0x1cc)
> [    4.408031]  r10:c07cf820 r9:c07c0480 r8:c07c7ac8 r7:c028acac
> r6:c07a66d8 r5:c07a66d8
> [    4.415893]  r4:d3b0e800
> [    4.418497] [<c028aae0>] (driver_probe_device) from [<c028ad94>]
> (__driver_attach+0xe8/0x138)
> [    4.427084]  r9:c07c0480 r8:c07c7ac8 r7:c028acac r6:c07a66d8
> r5:d3b0e834 r4:d3b0e800
>=20
>=20
> I'm not sure what exactly is required to trigger the problem. I saw the c=
rash for
> a dt device node like this where pinctrl links to two nodes with the actu=
al pin
> settings.
>=20
> &spi1 {
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&pinctrl_spi1_common &pinctrl_spi1_cs>; }
>=20
> pinctrl_spi1_common contains a couple of pins with non-default pad settin=
gs
> and pinctrl_spi1_cs contains a single pin that uses the default pad
> configuration.
>=20
> pinctrl_spi1_cs: spi1_cs_grp {
>    fsl,pins =3D <
>       MX25_PAD_CSPI1_SS0__GPIO_1_16  0x80000000
>    >;
> };
>=20
>=20
>  drivers/pinctrl/freescale/pinctrl-imx.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 78d33dfb4d2d..0c4ad8d19226 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -108,9 +108,6 @@ static int imx_dt_node_to_map(struct pinctrl_dev
> *pctldev,
>  	new_map++;
>  	for (i =3D j =3D 0; i < grp->num_pins; i++) {
>  		pin =3D &((struct imx_pin *)(grp->data))[i];
> -		new_map[j].type =3D PIN_MAP_TYPE_CONFIGS_PIN;
> -		new_map[j].data.configs.group_or_pin =3D
> -					pin_get_name(pctldev, pin->pin);
>=20
>  		if (info->flags & IMX_USE_SCU) {
>  			/*
> @@ -126,7 +123,12 @@ static int imx_dt_node_to_map(struct pinctrl_dev
> *pctldev,
>  			new_map[j].data.configs.num_configs =3D 1;
>  		}
>=20
> -		j++;
> +		if (new_map[j].data.configs.num_configs) {
> +			new_map[j].type =3D PIN_MAP_TYPE_CONFIGS_PIN;
> +			new_map[j].data.configs.group_or_pin =3D
> +				pin_get_name(pctldev, pin->pin);
> +			j++;
> +		}
>  	}
>=20
>  	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
> --
> 2.1.4
