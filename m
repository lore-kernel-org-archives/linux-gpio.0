From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: kempld: Fix autoloading of module
Date: Sat, 12 Apr 2014 09:58:03 -0700
Message-ID: <5349709B.6030004@roeck-us.net>
References: <1397277918.29335.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:49501 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754889AbaDLQ6H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Apr 2014 12:58:07 -0400
In-Reply-To: <1397277918.29335.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Brunner <michael.brunner@kontron.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On 04/11/2014 09:45 PM, Axel Lin wrote:
> Make the module alias match the platform device name, so gpio-kempld module
> should now autoload correctly.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   drivers/gpio/gpio-kempld.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
> index c6d8817..ebe1023 100644
> --- a/drivers/gpio/gpio-kempld.c
> +++ b/drivers/gpio/gpio-kempld.c
> @@ -216,4 +216,4 @@ module_platform_driver(kempld_gpio_driver);
>   MODULE_DESCRIPTION("KEM PLD GPIO Driver");
>   MODULE_AUTHOR("Michael Brunner <michael.brunner@kontron.com>");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:gpio-kempld");
> +MODULE_ALIAS("platform:kempld-gpio");
>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Wonder though if the module alias is necessary in the first place,
as the driver is instantiated from the mfd driver.

Guenter

