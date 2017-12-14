From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: axp209: add missing Kconfig dependencies
Date: Thu, 14 Dec 2017 10:22:38 -0800
Message-ID: <0aa972ed-dc37-4d03-7e08-95cc32f7a45e@infradead.org>
References: <20171214094335.899-1-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171214094335.899-1-quentin.schulz@free-electrons.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@free-electrons.com, linux-sunxi@googlegroups.com
List-Id: linux-gpio@vger.kernel.org

On 12/14/2017 01:43 AM, Quentin Schulz wrote:
> This fixes some compilation issues.
> 
> GENERIC_PINCONF and OF at least for pinconf_generic_dt_*, PINMUX at
> least for pinmux_ops and GPIOLIB for at least gpio_chip.
> 
> Fixes: 23f75d7dfa92 ("pinctrl: axp209: add pinctrl features")
> 
> Reported-by: Randy Dunlab <rdunlap@infradead.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/pinctrl/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index ce126955212c..1dd445116432 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -66,6 +66,10 @@ config PINCTRL_AS3722
>  config PINCTRL_AXP209
>  	tristate "X-Powers AXP209 PMIC pinctrl and GPIO Support"
>  	depends on MFD_AXP20X
> +	depends on OF
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	select GPIOLIB
>  	help
>  	  AXP PMICs provides multiple GPIOs that can be muxed for different
>  	  functions. This driver bundles a pinctrl driver to select the function
> 


-- 
~Randy
