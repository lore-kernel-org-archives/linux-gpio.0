From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] pinctrl: sort dt_params array in the same order as
 pin_config_param
Date: Tue, 22 Sep 2015 21:39:10 -0700
Message-ID: <20150923043910.GB24668@usrtlx11787.corpusers.net>
References: <1442766419-3983-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442766419-3983-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sun 20 Sep 09:26 PDT 2015, Masahiro Yamada wrote:

> Sort this array in the same order as enum pin_config_param and
> conf_items array for consistency.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/pinctrl/pinconf-generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> index e63ad9f..f0bc8bb 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -166,11 +166,11 @@ static const struct pinconf_generic_params dt_params[] = {
>  	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
>  	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
>  	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
> +	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
>  	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
>  	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
>  	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
>  	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
> -	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0},

I would like to see these alphabetically sorted instead and looking at
most of the entries that's already the case.

The order of the lists in this file the order doesn't matter, so that's
easy. There's some potential implications of renumbering the enum, but I
think it's worth keeping them sorted as well.

Regards,
Bjorn
