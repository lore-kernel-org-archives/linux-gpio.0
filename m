From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 7/9] gpiolib-sysfs: Add gpio name parsing for sysfs export
Date: Tue, 28 Jul 2015 11:50:04 +0200
Message-ID: <20150728095004.GM28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <1437125570-28623-8-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36722 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755670AbbG1JuG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2015 05:50:06 -0400
Received: by lagw2 with SMTP id w2so65125684lag.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2015 02:50:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437125570-28623-8-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Fri, Jul 17, 2015 at 11:32:48AM +0200, Markus Pargmann wrote:
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 41 ++++++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index b57ed8e55ab5..c3b74440ca67 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -443,18 +443,25 @@ static ssize_t export_store(struct class *class,
>  				const char *buf, size_t len)
>  {
>  	long			gpio;
> -	struct gpio_desc	*desc;
> +	struct gpio_desc	*desc = NULL;
>  	int			status;
>  
>  	status = kstrtol(buf, 0, &gpio);
> -	if (status < 0)
> -		goto done;
> +	if (!status)
> +		desc = gpio_to_desc(gpio);
>  
> -	desc = gpio_to_desc(gpio);
> -	/* reject invalid GPIOs */
> +	/* Fall back on detection by name */
>  	if (!desc) {
> -		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> -		return -EINVAL;
> +		char *gpio_name = kstrdup(buf, GFP_KERNEL);

Must check for allocation failures, but why use kstrdup at all?

> +
> +		desc = gpio_name_to_desc(strim(gpio_name));
> +		kfree(gpio_name);
> +
> +		/* reject invalid GPIOs */
> +		if (!desc) {
> +			pr_warn("%s: invalid GPIO %s\n", __func__, buf);
> +			return -EINVAL;
> +		}
>  	}
>  
>  	/* No extra locking here; FLAG_SYSFS just signifies that the
> @@ -485,17 +492,25 @@ static ssize_t unexport_store(struct class *class,
>  				const char *buf, size_t len)
>  {
>  	long			gpio;
> -	struct gpio_desc	*desc;
> +	struct gpio_desc	*desc = NULL;
>  	int			status;
>  
>  	status = kstrtol(buf, 0, &gpio);
> -	if (status < 0)
> -		goto done;
> +	if (!status)
> +		desc = gpio_to_desc(gpio);
> +
> +	/* Fall back on detection by name */
> +	if (!desc) {
> +		char *gpio_name = kstrdup(buf, GFP_KERNEL);

Same here.

> +
> +		desc = gpio_name_to_desc(strim(gpio_name));
> +		kfree(gpio_name);
> +	}
> +

Random whitespace change.

>  
> -	desc = gpio_to_desc(gpio);
>  	/* reject bogus commands (gpio_unexport ignores them) */
>  	if (!desc) {
> -		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
> +		pr_warn("%s: invalid GPIO %s\n", __func__, buf);
>  		return -EINVAL;
>  	}

Johan
