From: Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH] pinctrl: imx: make sure that maps are fully initialized
Date: Mon, 12 Nov 2018 16:37:21 +0100
Message-ID: <20181112153721.ekgpql3pj3bbv6ee@viti.kaiser.cx>
References: <1541871439-4882-1-git-send-email-martin@kaiser.cx>
 <AM0PR04MB4290D734ED5D039A903DA2DBEEC00@AM0PR04MB4290.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4290D734ED5D039A903DA2DBEEC00@AM0PR04MB4290.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Leonard,

Thus wrote Leonard Crestez (leonard.crestez@nxp.com):

> On 11/10/18 7:37 PM, Martin Kaiser wrote:
> > The commit that added scu based pinctrl support introduced a regression
> > for the mmio case. In the for-loop where the maps are initialized, we
> > end up creating a partially initialized map in some cases. This causes a
> > kernel panic when such a map is used at a later stage.

> > Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> > Cc: A.s. Dong <aisheng.dong@nxp.com>

> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> > @@ -108,9 +108,6 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   	new_map++;
> >   	for (i = j = 0; i < grp->num_pins; i++) {
> >   		pin = &((struct imx_pin *)(grp->data))[i];
> > -		new_map[j].type = PIN_MAP_TYPE_CONFIGS_PIN;
> > -		new_map[j].data.configs.group_or_pin =
> > -					pin_get_name(pctldev, pin->pin);

> >   		if (info->flags & IMX_USE_SCU) {
> >   			/*
> > @@ -126,7 +123,12 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   			new_map[j].data.configs.num_configs = 1;
> >   		}

> > -		j++;
> > +		if (new_map[j].data.configs.num_configs) {
> > +			new_map[j].type = PIN_MAP_TYPE_CONFIGS_PIN;
> > +			new_map[j].data.configs.group_or_pin =
> > +				pin_get_name(pctldev, pin->pin);
> > +			j++;
> > +		}

> Sorry but I don't think this is correct.

> The new_map array is allocated with kmalloc_array so we can't rely on 
> new_map[j].data.configs.num_configs being initialized to zero unless 
> assigned to.

you're right. There's no guarantee that the memory area is initialized
to 0.

Regards,
Martin
