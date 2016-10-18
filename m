From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] pinctrl: imx: reset group index on probe
Date: Wed, 19 Oct 2016 01:40:10 +0300
Message-ID: <0c13caa8-4966-8cba-3d8b-93166fe2156d@mleia.com>
References: <20161018210915.31614-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161018210915.31614-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, linus.walleij@linaro.org
Cc: shawnguo@kernel.org, vladimir_zapolskiy@mentor.com, mpa@pengutronix.de, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Stefan,

On 19.10.2016 00:09, Stefan Agner wrote:
> Group index is incremented on every new group parsed. Since the
> field is part of struct imx_pinctrl_soc_info, which is typically
> a global variable passed by the individual pinctrl-imx.c based
> driver, it does not get cleared automatically when re-probing the
> driver. This lead imx_pinctrl_parse_functions passing a group
> pointer which is outside of the allocated group space on second
> probe and onwards. Typically this ended up in a NULL pointer
> dereference when accessing the name field like this:
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> ...
> PC is at strcmp+0x18/0x44
> LR is at imx_dt_node_to_map+0xc4/0x290
> 
> Avoid this by setting group_index to 0 on probe.
> 
> This has been observed when using DEBUG_TEST_DRIVER_REMOVE.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

I've recently developed a pinctrl driver for the last remaining
i.MX31 platform from the SoC series (not published yet), it does
not fit well under any of the 3 existing drivers, and instead
of adding 1.5K lines of code with half of them almost copy-pasted
from the rest drivers I started to work on generalization of the
i.MX/Vybrid pinctrl/pinmux drivers.

This task is large and I'm not sure when I complete and share
the results, but your change conflicts with one of the changes
in my backlog... Let me share it with you right now, because it
deals with info->group_index from another point of view and it
(unlikely) may have an impact on Vybrid platform, which I can not
test.

> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 4761320..79c4e14 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -687,6 +687,7 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
>  	if (!info->functions)
>  		return -ENOMEM;
>  
> +	info->group_index = 0;
>  	if (flat_funcs) {
>  		info->ngroups = of_get_child_count(np);
>  	} else {
> 

--
With best wishes,
Vladimir
