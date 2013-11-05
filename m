From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 3/4] pinctrl: at91: copy define to driver
Date: Tue, 5 Nov 2013 10:52:44 +0100
Message-ID: <5278BFEC.4070600@atmel.com>
References: <1383643814-14308-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:43599 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752072Ab3KEJwv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2013 04:52:51 -0500
In-Reply-To: <1383643814-14308-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

On 05/11/2013 10:30, Linus Walleij :
> The #define for the maximum number of GPIO blocks was retrieved
> into pinctrl-at91.c by implicit inclusion of <mach/gpio.h>
> from <linux/gpio.h> creating a dependency on machine-local
> <mach/gpio.h>. Break the depenency by copying this single
> define into the driver.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Yes, that seems reasonable.

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
> This will be applied directly to the pinctrl tree unless there
> are specific protests.
> ---
>   drivers/pinctrl/pinctrl-at91.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index f350fd2e170e..0dfb8c7b58df 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -33,6 +33,7 @@
>
>   #include "core.h"
>
> +#define MAX_GPIO_BANKS		5
>   #define MAX_NB_GPIO_PER_BANK	32
>
>   struct at91_pinctrl_mux_ops;
>


-- 
Nicolas Ferre
