From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 1/3] gpio: davinci: Remove unwanted blank line
Date: Wed, 11 Jan 2017 11:37:24 -0600
Message-ID: <3ada0b60-01fb-93b9-e369-3a628ecf5fdc@ti.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
 <1484110841-2391-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:33013 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1765150AbdAKRhd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 12:37:33 -0500
In-Reply-To: <1484110841-2391-2-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com



On 01/10/2017 11:00 PM, Keerthy wrote:
> Remove redundant blank line.

i think it's better to drop this patch ;)

>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  include/linux/platform_data/gpio-davinci.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
> index 44ca530..18127c4 100644
> --- a/include/linux/platform_data/gpio-davinci.h
> +++ b/include/linux/platform_data/gpio-davinci.h
> @@ -26,7 +26,6 @@ struct davinci_gpio_platform_data {
>  	u32	gpio_unbanked;
>  };
>
> -
>  struct davinci_gpio_controller {
>  	struct gpio_chip	chip;
>  	struct irq_domain	*irq_domain;
>

-- 
regards,
-grygorii
