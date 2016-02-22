From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: Re: [PATCH] gpio: ts4800: Drop redundant code to set already
 initialized gpio_chip fields
Date: Mon, 22 Feb 2016 11:13:47 -0500 (EST)
Message-ID: <1939670978.164659.1456157627925.JavaMail.zimbra@savoirfairelinux.com>
References: <1455949366.14139.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:58652 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731AbcBVQNu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 11:13:50 -0500
In-Reply-To: <1455949366.14139.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hello,

Thank you for this patch. I checked and it still works as expected.

----- Original Message -----
> From: "Axel Lin" <axel.lin@ingics.com>
> To: "Linus Walleij" <linus.walleij@linaro.org>
> Cc: "Julien Grossholtz" <julien.grossholtz@savoirfairelinux.com>, "Alexandre Courbot" <gnurou@gmail.com>,
> linux-gpio@vger.kernel.org
> Sent: Saturday, February 20, 2016 1:22:46 AM
> Subject: [PATCH] gpio: ts4800: Drop redundant code to set already initialized gpio_chip fields

> Both chip->base and chip->label are correctly set by bgpio_init().
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
Tested-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
> ---
> drivers/gpio/gpio-ts4800.c | 2 --
> 1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
> index 9da79e4..1478245 100644
> --- a/drivers/gpio/gpio-ts4800.c
> +++ b/drivers/gpio/gpio-ts4800.c
> @@ -54,8 +54,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
> 		return retval;
> 	}
> 
> -	chip->base = -1;
> -	chip->label = dev_name(&pdev->dev);
> 	chip->ngpio = ngpios;
> 
> 	platform_set_drvdata(pdev, chip);
> --
> 2.1.4
