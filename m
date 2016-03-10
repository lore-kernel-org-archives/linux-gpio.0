From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: gpio-pca953x: no interrupts with 4-bit devices
Date: Fri, 11 Mar 2016 01:02:57 +0700
Message-ID: <56E1B6D1.3080908@ti.com>
References: <emabcbfc80-7a10-4494-be09-92de321c5d0e@t410-5a>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:50765 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754753AbcCJSDC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 10 Mar 2016 13:03:02 -0500
In-Reply-To: <emabcbfc80-7a10-4494-be09-92de321c5d0e@t410-5a>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mrpace2@gmail.com, linux-gpio@vger.kernel.org

On 03/10/2016 05:15 PM, mrpace2@gmail.com wrote:
> The NBANK macro can be extended in order to avoid the underflow:
>
> #define NBANK(chip) (chip->gpio_chip.ngpio == 0 ? 0 : \
>      ((chip->gpio_chip.ngpio + (BANK_SZ - 1)) / BANK_SZ))
> Resending a modified patch.
>
> Signed-off-by: Frank Edelhaeuser <mrpace2 <at> gmail.com>
> ---
> diff -Nur a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> --- a/drivers/gpio/gpio-pca953x.c 2016-03-10 02:34:56.012345678 +0000
> +++ b/drivers/gpio/gpio-pca953x.c 2016-03-10 02:34:56.012345678 +0000
> @@ -86,7 +86,8 @@
>   #define MAX_BANK 5
>   #define BANK_SZ 8
>
> -#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
> +#define NBANK(chip) (chip->gpio_chip.ngpio == 0 ? 0 : \
> +    ((chip->gpio_chip.ngpio + (BANK_SZ - 1)) / BANK_SZ))
>

And finally this DIV_ROUND_UP:) Right?


-- 
regards,
-grygorii
