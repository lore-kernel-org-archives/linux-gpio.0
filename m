From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: intel_soc_pmic_crc: Uniquify device name
Date: Mon, 17 Jul 2017 12:58:29 +0100
Message-ID: <20170717115829.2mp2eyodrcdqy4t5@dell>
References: <20170620163323.16345-1-hadess@hadess.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170620163323.16345-1-hadess@hadess.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The commit log should not be empty.

Please provide information as to why this change is required, etc.

> ---
>  drivers/mfd/intel_soc_pmic_crc.c | 2 +-

One of the Intel guys should take a look at this too.

>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
> index 4a7494872da2..f47dadaf644c 100644
> --- a/drivers/mfd/intel_soc_pmic_crc.c
> +++ b/drivers/mfd/intel_soc_pmic_crc.c
> @@ -147,7 +147,7 @@ static const struct regmap_irq crystal_cove_irqs[] = {
>  };
>  
>  static const struct regmap_irq_chip crystal_cove_irq_chip = {
> -	.name = "Crystal Cove",
> +	.name = "Crystal Cove (PMIC)",
>  	.irqs = crystal_cove_irqs,
>  	.num_irqs = ARRAY_SIZE(crystal_cove_irqs),
>  	.num_regs = 1,

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
