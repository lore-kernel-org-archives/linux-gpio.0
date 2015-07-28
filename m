From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/9] gpiolib: Fix possible use of wrong name
Date: Tue, 28 Jul 2015 11:03:31 +0200
Message-ID: <20150728090331.GI28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36518 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932206AbbG1JDx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2015 05:03:53 -0400
Received: by lagw2 with SMTP id w2so64447365lag.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2015 02:03:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437125570-28623-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Fri, Jul 17, 2015 at 11:32:42AM +0200, Markus Pargmann wrote:
> The name is set optionally from DT. Therefore we need to reset the name
> variable for every loop iteration. Otherwise we could use a wrong or
> uninitialized name.

This doesn't make sense. of_get_gpio_hog falls back to using the node
name so name will always be updated (unless there's an error).

Could be better documented, though.

> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---
>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 9a0ec48a4737..60aebe4d7c26 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -209,11 +209,11 @@ static void of_gpiochip_scan_hogs(struct gpio_chip *chip)
>  {
>  	struct gpio_desc *desc = NULL;
>  	struct device_node *np;
> -	const char *name;
>  	enum gpio_lookup_flags lflags;
>  	enum gpiod_flags dflags;
>  
>  	for_each_child_of_node(chip->of_node, np) {
> +		const char *name = NULL;
>  		if (!of_property_read_bool(np, "gpio-hog"))
>  			continue;

Johan
