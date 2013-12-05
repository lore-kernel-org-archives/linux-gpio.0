From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 4/5] gpiolib: update commentary at gpiod_get_index()
Date: Thu, 5 Dec 2013 11:10:05 +0900
Message-ID: <529FE07D.9050808@nvidia.com>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386164580-32288-5-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:6005 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756310Ab3LECKI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 21:10:08 -0500
In-Reply-To: <1386164580-32288-5-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On 12/04/2013 10:42 PM, Andy Shevchenko wrote:
> THe patch just accents that @dev could be NULL.

s/THe/This

Maybe "commentary by" can also be replaced by "description for" or 
"inline documentation of"?

>
> There is no functional change.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpio/gpiolib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 70e560c..013e5a5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2425,7 +2425,7 @@ EXPORT_SYMBOL_GPL(gpiod_get);
>
>   /**
>    * gpiod_get_index - obtain a GPIO from a multi-index GPIO function
> - * @dev:	GPIO consumer
> + * @dev:	GPIO consumer, can be NULL for system-global GPIOs

Looks ok, but could you also perform the same change for gpiod_get() 
that is just a little bit above since it applies to it as well?
