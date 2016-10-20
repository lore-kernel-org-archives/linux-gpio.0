From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: imx: remove unused gpoup_index field
Date: Thu, 20 Oct 2016 13:17:16 -0700
Message-ID: <e81b67ed97d078889e7df6c309917570@agner.ch>
References: <1476830832-5389-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:38548 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753248AbcJTUXM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2016 16:23:12 -0400
In-Reply-To: <1476830832-5389-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org, b38343@freescale.com

Hi Vladimir,

On 2016-10-18 15:47, Vladimir Zapolskiy wrote:
> The group_index field of struct imx_pinctrl_soc_info does not serve
> any particular purpose and its usage can be safely replaced by
> a preexisting local variable.
> 
> Also Stefan Agner reports that the usage of the group_index field
> without reinitialization may lead to an oops on a repeated driver
> probe, this is found with DEBUG_TEST_DRIVER_REMOVE option enabled.

The change is a good idea, and it works for flat pinctrl configurations.
However it does not work when there are multiple sub nodes (or function
nodes).

I am all in for the new flat format, but we should at least make sure
that all device trees are flat or have only one subnode. If that is the
case, we also should add a warning... All that makes me wonder if it is
worth the effort...

Also added Robin Gon which added the field not long ago.

--
Stefan


> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
> The change is supposed to obsolete Stefan's change:
> 
>    https://patchwork.ozlabs.org/patch/683885/
> 
> The change is tested on i.MX6Q platform only.
> 
>  drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
>  drivers/pinctrl/freescale/pinctrl-imx.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 47613201269a..3425d10c1478 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -628,7 +628,7 @@ static int imx_pinctrl_parse_functions(struct
> device_node *np,
>  
>  	for_each_child_of_node(np, child) {
>  		func->groups[i] = child->name;
> -		grp = &info->groups[info->group_index++];
> +		grp = &info->groups[i];
>  		imx_pinctrl_parse_groups(child, grp, info, i++);
>  	}
>  
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h
> b/drivers/pinctrl/freescale/pinctrl-imx.h
> index 8af8aa2897ab..eaf893967453 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> @@ -78,7 +78,6 @@ struct imx_pinctrl_soc_info {
>  	struct imx_pin_reg *pin_regs;
>  	struct imx_pin_group *groups;
>  	unsigned int ngroups;
> -	unsigned int group_index;
>  	struct imx_pmx_func *functions;
>  	unsigned int nfunctions;
>  	unsigned int flags;
