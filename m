From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 12/12] gpio: davinci: Include proper header
Date: Mon, 22 Jan 2018 14:01:22 +0530
Message-ID: <153d2db6-d956-d77f-0bce-41444ef8dc5c@ti.com>
References: <20180119064043.18241-1-linus.walleij@linaro.org>
 <20180119064043.18241-12-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:24126 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbeAVIbZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 03:31:25 -0500
In-Reply-To: <20180119064043.18241-12-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org



On Friday 19 January 2018 12:10 PM, Linus Walleij wrote:
> This driver has no business including <linux/gpio.h>, it is a
> driver so include <linux/gpio/driver.h>.

Acked-by: Keerthy <j-keerthy@ti.com>

Compile tested for keystone_defconfig and davinci_all_defconfig.

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-davinci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index f75d8443ecaf..34fc0a167b7c 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -9,7 +9,7 @@
>   * the Free Software Foundation; either version 2 of the License, or
>   * (at your option) any later version.
>   */
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/clk.h>
> 
