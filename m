From: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Check for memory allocation failure
Date: Sun, 7 May 2017 04:40:38 +0900
Message-ID: <20170506194038.GI17317@lianli.shorne-pla.net>
References: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36520 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbdEFTkl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 May 2017 15:40:41 -0400
Content-Disposition: inline
In-Reply-To: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org, gary.bisson@boundarydevices.com, vladimir_zapolskiy@mentor.com, tony@atomide.com, vivien.didelot@savoirfairelinux.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On Sat, May 06, 2017 at 10:23:59AM +0200, Christophe JAILLET wrote:
> If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
> Return -ENOMEM instead, as done for the other memory allocation just a
> few lines below.

This looks fine.

> BTW, change the 'devm_kzalloc' into a 'devm_kcalloc'.

Any reason for the devm_kcalloc change?  It looks like the next for loop
does set all of the group_name values.

-Stafford

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 74bd90dfd7b1..90a946c028ff 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -581,9 +581,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>  		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
>  		return -EINVAL;
>  	}
> -	func->group_names = devm_kzalloc(info->dev,
> -					 func->num_group_names *
> +	func->group_names = devm_kcalloc(info->dev, func->num_group_names,
>  					 sizeof(char *), GFP_KERNEL);
> +	if (!func->group_names)
> +		return -ENOMEM;
>  
>  	for_each_child_of_node(np, child) {
>  		func->group_names[i] = child->name;
> -- 
> 2.11.0
> 
