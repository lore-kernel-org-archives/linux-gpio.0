From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH] gpio: syscon: reduce message level when direction reg
 offset not in dt
Date: Tue, 24 Mar 2015 16:00:13 -0400
Message-ID: <5511C24D.3080205@ti.com>
References: <20150324161358.GA694@kahuna> <1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427222562-2223-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grygorii.strashko@linaro.org
Cc: linux@arm.linux.org.uk, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ssantosh@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 03/24/2015 02:42 PM, grygorii.strashko@linaro.org wrote:
> From: Grygorii Strashko<grygorii.strashko@linaro.org>
>
> Now GPIO syscon driver produces bunch of warnings during the
> boot of Kesytone 2 SoCs:
>   gpio-syscon soc:keystone_dsp_gpio@02620240: can't read the dir register offset!
>   gpio-syscon soc:keystone_dsp_gpio@2620244: can't read the dir register offset!
>
> This message unintentionally was added using dev_err(), but its
> actual log level is debug, because third cell of "ti,syscon-dev" is
> optional.
>
> Hence change it to dev_dbg() as it should be.
>
> This patch fixes commit:
>   5a3e3f8 ("gpio: syscon: retriave syscon node and regs offsets from dt")
>
> Reported-by: Russell King<linux@arm.linux.org.uk>
> Signed-off-by: Grygorii Strashko<grygorii.strashko@linaro.org>
> ---
>   drivers/gpio/gpio-syscon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 257e298..045a952 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -219,7 +219,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
>   		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
>   						&priv->dir_reg_offset);
>   		if (ret)
> -			dev_err(dev, "can't read the dir register offset!\n");
> +			dev_dbg(dev, "can't read the dir register offset!\n");
>
>   		priv->dir_reg_offset<<= 3;
>   	}

Tested this on K2HK EVM and found the error log is not appearing any more.

Tested-by: Murali Karicheri <m-karicheri2@ti.com>

-- 
Murali Karicheri
Linux Kernel, Texas Instruments
