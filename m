From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] pinctrl: imx: make sure that maps are fully initialized
Date: Sun, 11 Nov 2018 22:37:26 +0000
Message-ID: <AM0PR04MB4290D734ED5D039A903DA2DBEEC00@AM0PR04MB4290.eurprd04.prod.outlook.com>
References: <1541871439-4882-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>, "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On 11/10/18 7:37 PM, Martin Kaiser wrote:=0A=
> The commit that added scu based pinctrl support introduced a regression=
=0A=
> for the mmio case. In the for-loop where the maps are initialized, we=0A=
> end up creating a partially initialized map in some cases. This causes a=
=0A=
> kernel panic when such a map is used at a later stage.=0A=
> =0A=
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")=0A=
> Cc: A.s. Dong <aisheng.dong@nxp.com>=0A=
=0A=
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c=0A=
> @@ -108,9 +108,6 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pct=
ldev,=0A=
>   	new_map++;=0A=
>   	for (i =3D j =3D 0; i < grp->num_pins; i++) {=0A=
>   		pin =3D &((struct imx_pin *)(grp->data))[i];=0A=
> -		new_map[j].type =3D PIN_MAP_TYPE_CONFIGS_PIN;=0A=
> -		new_map[j].data.configs.group_or_pin =3D=0A=
> -					pin_get_name(pctldev, pin->pin);=0A=
>   =0A=
>   		if (info->flags & IMX_USE_SCU) {=0A=
>   			/*=0A=
> @@ -126,7 +123,12 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pc=
tldev,=0A=
>   			new_map[j].data.configs.num_configs =3D 1;=0A=
>   		}=0A=
>   =0A=
> -		j++;=0A=
> +		if (new_map[j].data.configs.num_configs) {=0A=
> +			new_map[j].type =3D PIN_MAP_TYPE_CONFIGS_PIN;=0A=
> +			new_map[j].data.configs.group_or_pin =3D=0A=
> +				pin_get_name(pctldev, pin->pin);=0A=
> +			j++;=0A=
> +		}=0A=
=0A=
Sorry but I don't think this is correct.=0A=
=0A=
The new_map array is allocated with kmalloc_array so we can't rely on =0A=
new_map[j].data.configs.num_configs being initialized to zero unless =0A=
assigned to.=0A=
=0A=
I was looking at the ssue before I saw your patch and posted an =0A=
different fix. I can't find a give link right now, it takes a while to =0A=
show up in public archives.=0A=
