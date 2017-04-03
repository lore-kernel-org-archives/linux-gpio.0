From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: pinmux: Fix kerneldoc for
 pinmux_generic_add_function()
Date: Mon, 3 Apr 2017 07:05:05 -0700
Message-ID: <20170403140505.GU8575@atomide.com>
References: <1491208362-17443-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:43026 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751808AbdDCOFJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Apr 2017 10:05:09 -0400
Content-Disposition: inline
In-Reply-To: <1491208362-17443-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [170403 01:35]:
> Correct the incorrect function name and description.
> 
> Fixes: a76edc89b100e4fe ("pinctrl: core: Add generic pinctrl functions for managing groups")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for fixing that:

Acked-by: Tony Lindgren <tony@atomide.com>


>  drivers/pinctrl/pinmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 29ad3151abecc42e..9fd6d9087dc508ca 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -763,7 +763,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
>  EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
>  
>  /**
> - * pinmux_generic_get_function_groups() - gets the function groups
> + * pinmux_generic_add_function() - adds a function group
>   * @pctldev: pin controller device
>   * @name: name of the function
>   * @groups: array of pin groups
> -- 
> 2.7.4
> 
