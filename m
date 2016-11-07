From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH 1/1] pinctrl: st: st_pctl_dt_parse_groups simplify
 expression
Date: Mon, 7 Nov 2016 10:05:13 +0100
Message-ID: <1ac9af0e-0a00-757b-6981-0ff9461fbbb3@st.com>
References: <20161105143515.4668-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:53182 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751218AbcKGJFn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 04:05:43 -0500
In-Reply-To: <20161105143515.4668-1-xypron.glpk@gmx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org



On 11/05/2016 03:35 PM, Heinrich Schuchardt wrote:
> for_each_property_of_node(pins, pp) checks that pp is not NULL.
> So there is no need to check it inside the loop.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  drivers/pinctrl/pinctrl-st.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 8308f15..676efcc 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -1181,7 +1181,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  		if (!strcmp(pp->name, "name"))
>  			continue;
>  
> -		if (pp  && (pp->length/sizeof(__be32)) >= OF_GPIO_ARGS_MIN) {
> +		if (pp->length / sizeof(__be32) >= OF_GPIO_ARGS_MIN) {
>  			npins++;
>  		} else {
>  			pr_warn("Invalid st,pins in %s node\n", np->name);
> 

Hi Heinrich

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
