From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio: pca953x: Fix pca953x_gpio_set_multiple() on 64-bit
Date: Sat, 12 Mar 2016 23:20:40 +0800
Message-ID: <56E433C8.10609@electromag.com.au>
References: <1457713887-7748-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:34190 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753399AbcCLPUq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Mar 2016 10:20:46 -0500
In-Reply-To: <1457713887-7748-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/03/2016 12:31 AM, Geert Uytterhoeven wrote:
> pca953x_gpio_set_multiple() divides by 4 to convert from longs to bytes,
> which assumes a 32-bit platform, and is not correct on 64-bit platforms.
> Use "sizeof(...)" instead to fix this.
>
> Fixes: b4818afeacbd8182 ("gpio: pca953x: Add set_multiple to allow multiple bits to be set in one write.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Phil Reid <preid@electromag.com.au>

> ---
> Untested, found by code inspection.
>
> This bug was introduced in v4.5-rc1, but unless Linus (the other one ;-)
> will make a v4.5-rc8, it's probably too late to get this fixed in v4.5.
> ---
>   drivers/gpio/gpio-pca953x.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 23196c5fc17ceb6b..99b375c959987fe9 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -367,9 +367,11 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
>   	memcpy(reg_val, chip->reg_output, NBANK(chip));
>   	mutex_lock(&chip->i2c_lock);
>   	for(bank=0; bank<NBANK(chip); bank++) {
> -		unsigned bankmask = mask[bank/4] >> ((bank % 4) * 8);
> +		unsigned bankmask = mask[bank / sizeof(*mask)] >>
> +				    ((bank % sizeof(*mask)) * 8);
>   		if(bankmask) {
> -			unsigned bankval  = bits[bank/4] >> ((bank % 4) * 8);
> +			unsigned bankval  = bits[bank / sizeof(*bits)] >>
> +					    ((bank % sizeof(*bits)) * 8);
>   			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
>   		}
>   	}
>


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
