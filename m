From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] regulator: gpio-regulator: use devm_*
Date: Thu, 22 May 2014 17:24:47 +0200
Message-ID: <3643522.fIroKZpKff@phil>
References: <1400770266-7276-1-git-send-email-rob.jones@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:57109 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbaEVPVZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 22 May 2014 11:21:25 -0400
In-Reply-To: <1400770266-7276-1-git-send-email-rob.jones@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Jones <rob.jones@codethink.co.uk>
Cc: linux-gpio@vger.kernel.org, broonie@opensource.wolfsonmicro.com, ext-roger.quadros@nokia.com

Hi Rob,

this is racy.

The deallocation of devm_* stuff is done _after_ the driver _remove callback 
ran, where in the gpio_regulator case it would already have done at least

>  	gpio_free_array(drvdata->gpios, drvdata->nr_gpios);
> 
>  	kfree(drvdata->states);

before the regulator gets deregistered, thus producing a race condition.


Also Mark's mail address is
	Mark Brown <broonie@kernel.org>
and
	linux-kernel@vger.kernel.org
should be included as well.


Heiko


Am Donnerstag, 22. Mai 2014, 15:51:06 schrieb Rob Jones:
> Use devm_regulator_register in probe/remove.
> 
> Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>
> Signed-off-by: Rob Jones <rob.jones@codethink.co.uk>
> ---
>  drivers/regulator/gpio-regulator.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/gpio-regulator.c
> b/drivers/regulator/gpio-regulator.c index 989b23b..994a050 100644
> --- a/drivers/regulator/gpio-regulator.c
> +++ b/drivers/regulator/gpio-regulator.c
> @@ -337,7 +337,7 @@ static int gpio_regulator_probe(struct platform_device
> *pdev) cfg.ena_gpio_flags |= GPIOF_OUT_INIT_HIGH;
>  	}
> 
> -	drvdata->dev = regulator_register(&drvdata->desc, &cfg);
> +	drvdata->dev = devm_regulator_register(&pdev->dev, &drvdata->desc, &cfg);
>  	if (IS_ERR(drvdata->dev)) {
>  		ret = PTR_ERR(drvdata->dev);
>  		dev_err(&pdev->dev, "Failed to register regulator: %d\n", ret);
> @@ -364,8 +364,6 @@ static int gpio_regulator_remove(struct platform_device
> *pdev) {
>  	struct gpio_regulator_data *drvdata = platform_get_drvdata(pdev);
> 
> -	regulator_unregister(drvdata->dev);
> -
>  	gpio_free_array(drvdata->gpios, drvdata->nr_gpios);
> 
>  	kfree(drvdata->states);

