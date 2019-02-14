From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next 1/3] spmi: pmic-arb: select IRQ_DOMAIN_HIERARCHY in
 Kconfig
Date: Wed, 13 Feb 2019 17:54:54 -0800
Message-ID: <3959e53e-d711-8115-4562-c8352a5e3ce8@infradead.org>
References: <20190214013641.9740-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214013641.9740-1-masneyb@onstation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, linus.walleij@linaro.org
Cc: sboyd@kernel.org, lee.jones@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2/13/19 5:36 PM, Brian Masney wrote:
> Select IRQ_DOMAIN_HIERARCHY for pmic-arb in Kconfig since this driver
> uses the version 2 IRQ interfaces. IRQ_DOMAIN_HIERARCHY selects
> IRQ_DOMAIN, so it can be removed from here.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> This addresses a build failure found by make randconfig in linux-next:
> https://lore.kernel.org/lkml/fb0508f1-131d-ff17-9b5d-123ec75275dd@infradead.org/
> 
>  drivers/spmi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index 0d3b70b3bda8..d48ed7c2c6c4 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -12,7 +12,7 @@ if SPMI
>  
>  config SPMI_MSM_PMIC_ARB
>  	tristate "Qualcomm MSM SPMI Controller (PMIC Arbiter)"
> -	select IRQ_DOMAIN
> +	select IRQ_DOMAIN_HIERARCHY
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	default ARCH_QCOM
> 


-- 
~Randy
