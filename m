From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH][next] pinctrl: actions: make s900_functions,
 s900_padinfo and s900_pads static
Date: Mon, 30 Apr 2018 18:56:04 +0530
Message-ID: <20180430132604.bgcstndvverw766w@linaro.org>
References: <20180430130434.1361-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180430130434.1361-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 30, 2018 at 02:04:34PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> s900_functions, s900_padinfo and s900_pads are local to the source and do
> not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> drivers/pinctrl/actions/pinctrl-s900.c:1445:30: warning: symbol
> 's900_functions' was not declared. Should it be static?
> drivers/pinctrl/actions/pinctrl-s900.c:1664:20: warning: symbol
> 's900_padinfo' was not declared. Should it be static?
> drivers/pinctrl/actions/pinctrl-s900.c:207:31: warning: symbol
> 's900_pads' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> 

Thanks,
Mani

> ---
>  drivers/pinctrl/actions/pinctrl-s900.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-s900.c b/drivers/pinctrl/actions/pinctrl-s900.c
> index 49a04e224ee6..08d93f8fc086 100644
> --- a/drivers/pinctrl/actions/pinctrl-s900.c
> +++ b/drivers/pinctrl/actions/pinctrl-s900.c
> @@ -204,7 +204,7 @@
>  #define NUM_PADS		(_PIN(3) + 1)
>  
>  /* Pad names as specified in datasheet */
> -const struct pinctrl_pin_desc s900_pads[] = {
> +static const struct pinctrl_pin_desc s900_pads[] = {
>  	PINCTRL_PIN(ETH_TXD0, "eth_txd0"),
>  	PINCTRL_PIN(ETH_TXD1, "eth_txd1"),
>  	PINCTRL_PIN(ETH_TXEN, "eth_txen"),
> @@ -1442,7 +1442,7 @@ static const char * const sirq2_groups[] = {
>  		.ngroups = ARRAY_SIZE(fname##_groups),	\
>  	}
>  
> -const struct owl_pinmux_func s900_functions[] = {
> +static const struct owl_pinmux_func s900_functions[] = {
>  	[S900_MUX_ERAM] = FUNCTION(eram),
>  	[S900_MUX_ETH_RMII] = FUNCTION(eth_rmii),
>  	[S900_MUX_ETH_SMII] = FUNCTION(eth_smii),
> @@ -1661,7 +1661,7 @@ static PAD_ST_CONF(I2S_MCLK0, 1, 0, 1);
>  	}
>  
>  /* Pad info table */
> -struct owl_padinfo s900_padinfo[NUM_PADS] = {
> +static struct owl_padinfo s900_padinfo[NUM_PADS] = {
>  	[ETH_TXD0] = PAD_INFO_ST(ETH_TXD0),
>  	[ETH_TXD1] = PAD_INFO_ST(ETH_TXD1),
>  	[ETH_TXEN] = PAD_INFO_ST(ETH_TXEN),
> -- 
> 2.17.0
> 
