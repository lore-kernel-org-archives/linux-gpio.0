From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH V2 6/6] gpio: davinci: Remove redundant macros
Date: Mon, 16 Jan 2017 12:27:12 +0530
Message-ID: <e38d4a3f-1f48-142b-b5c5-b45da9c55b0d@ti.com>
References: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
 <1484281215-24576-7-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:43556 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbdAPG5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2017 01:57:17 -0500
In-Reply-To: <1484281215-24576-7-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com

Linus,

On Friday 13 January 2017 09:50 AM, Keerthy wrote:
> Some of the macros were needed as per old driver design.
> With the current implementation they are unwanted. Hence remove
> them.

Seems like Macros are being used in:
arch/arm/mach-davinci/board-neuros-osd2.c

So this patch can be dropped from the series.

>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  include/linux/platform_data/gpio-davinci.h | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
> index 90ae19c..f922601 100644
> --- a/include/linux/platform_data/gpio-davinci.h
> +++ b/include/linux/platform_data/gpio-davinci.h
> @@ -45,14 +45,6 @@ struct davinci_gpio_controller {
>  	unsigned int		base;
>  };
>
> -/*
> - * basic gpio routines
> - */
> -#define	GPIO(X)		(X)	/* 0 <= X <= (DAVINCI_N_GPIO - 1) */
> -
> -/* Convert GPIO signal to GPIO pin number */
> -#define GPIO_TO_PIN(bank, gpio)	(16 * (bank) + (gpio))
> -
>  static inline u32 __gpio_mask(unsigned gpio)
>  {
>  	return 1 << (gpio % 32);
>
