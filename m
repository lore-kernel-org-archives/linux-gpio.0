From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH 1/1] pinctrl: st: st_pinconf_dbg_show wrong format string
Date: Mon, 7 Nov 2016 10:02:50 +0100
Message-ID: <8069c787-a934-ba1f-0284-1a28f170ef6d@st.com>
References: <20161105142515.4377-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52860 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750927AbcKGJDY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 04:03:24 -0500
In-Reply-To: <20161105142515.4377-1-xypron.glpk@gmx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org



On 11/05/2016 03:25 PM, Heinrich Schuchardt wrote:
> function is defined as unsigned int.
> So we need %u to print it.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  drivers/pinctrl/pinctrl-st.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index b7bb371..8308f15 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -1006,7 +1006,7 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  
>  	function = st_pctl_get_pin_function(pc, offset);
>  	if (function)
> -		snprintf(f, 10, "Alt Fn %d", function);
> +		snprintf(f, 10, "Alt Fn %u", function);
>  	else
>  		snprintf(f, 5, "GPIO");
>  
> 


Hi Heinrich

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

