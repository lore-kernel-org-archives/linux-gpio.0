From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH][next] pinctrl: actions: Fix Kconfig dependency and help
 text
Date: Mon, 30 Apr 2018 21:23:46 -0700
Message-ID: <92d58976-7fe4-517e-95e9-b4255ecb390c@infradead.org>
References: <20180501030047.305-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501030047.305-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linus.walleij@linaro.org, afaerber@suse.de, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 04/30/2018 08:00 PM, Manivannan Sadhasivam wrote:
> 1. Fix Kconfig dependency for Actions Semi S900 pinctrl driver which
> generates below warning in x86:
> 
> WARNING: unmet direct dependencies detected for PINCTRL_OWL
>   Depends on [n]: PINCTRL [=y] && (ARCH_ACTIONS || COMPILE_TEST [=n]) && OF [=n]
>   Selected by [y]:
>   - PINCTRL_S900 [=y] && PINCTRL [=y]
> 
> 2. Add help text for OWL pinctrl driver
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/pinctrl/actions/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
> index 1c7309c90f0d..ede97cdbbc12 100644
> --- a/drivers/pinctrl/actions/Kconfig
> +++ b/drivers/pinctrl/actions/Kconfig
> @@ -1,12 +1,14 @@
>  config PINCTRL_OWL
> -	bool
> +	bool "Actions Semi OWL pinctrl driver"
>  	depends on (ARCH_ACTIONS || COMPILE_TEST) && OF
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> +	help
> +	  Say Y here to enable Actions Semi OWL pinctrl driver
>  
>  config PINCTRL_S900
>  	bool "Actions Semi S900 pinctrl driver"
> -	select PINCTRL_OWL
> +	depends on PINCTRL_OWL
>  	help
>  	  Say Y here to enable Actions Semi S900 pinctrl driver
> 


-- 
~Randy
