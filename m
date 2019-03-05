From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/3] x86: apuv2: remove unused variable
Date: Tue, 5 Mar 2019 01:04:48 +0100
Message-ID: <25276a71-2d50-0039-226c-3066a3767c0d@metux.net>
References: <20190304201930.1622839-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304201930.1622839-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 04.03.19 21:19, Arnd Bergmann wrote:

> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index dcb084f6b892..c1ca931e1fab 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -208,7 +208,6 @@ static struct platform_device * __init apu_create_pdev(
>  
>  static int __init apu_board_init(void)
>  {
> -	int rc;
>  	const struct dmi_system_id *id;
>  
>  	id = dmi_first_match(apu_gpio_dmi_table);
> 

ACK.

Reviewed-By: Enrico Weigelt, metux IT consult <info@metux.net>


thx
--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
