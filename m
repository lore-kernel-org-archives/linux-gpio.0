From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: Re: [PATCH] pinctrl: axp209: add CONFIG_OF dependency
Date: Fri, 15 Dec 2017 13:53:12 +0100
Message-ID: <9fa963bb-cc84-d367-9090-c8b7ad796411@free-electrons.com>
References: <20171215124910.2887096-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215124910.2887096-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Arnd,

On 15/12/2017 13:48, Arnd Bergmann wrote:
> The pinconf_generic_dt_free_map and pinconf_generic_dt_node_to_map_group
> functions are only defined when CONFIG_OF is set:
> 
> drivers/pinctrl/pinctrl-axp209.c:312:21: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function); did you mean 'pinconf_generic_params'?
> drivers/pinctrl/pinctrl-axp209.c:313:18: error: 'pinconf_generic_dt_free_map' undeclared here (not in a function); did you mean 'pinconf_generic_params'?
> 
> This adds a Kconfig depdency for the driver to prevent randconfig
> build failures.
> 
> Fixes: 23f75d7dfa92 ("pinctrl: axp209: add pinctrl features")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index ce126955212c..648be90ac1cb 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -65,7 +65,7 @@ config PINCTRL_AS3722
>  
>  config PINCTRL_AXP209
>  	tristate "X-Powers AXP209 PMIC pinctrl and GPIO Support"
> -	depends on MFD_AXP20X
> +	depends on MFD_AXP20X && OF
>  	help
>  	  AXP PMICs provides multiple GPIOs that can be muxed for different
>  	  functions. This driver bundles a pinctrl driver to select the function
> 

I already sent a patch fixing this issue yesterday:

https://patchwork.kernel.org/patch/10111721/

Thanks anyway :)

Quentin

-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
