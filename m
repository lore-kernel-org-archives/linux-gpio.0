From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH gpio 1/4] drivers: gpio: use devm_kzalloc
Date: Tue, 7 Apr 2015 17:37:04 +0200
Message-ID: <20150407153704.GE21841@localhost>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
 <1427775551-6908-2-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:36471 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752929AbbDGPhH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 11:37:07 -0400
Received: by lbbqq2 with SMTP id qq2so37055672lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 08:37:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1427775551-6908-2-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

On Tue, Mar 31, 2015 at 09:49:08AM +0530, Varka Bhadram wrote:
> We can use devres API for allocating memory. No need of using kfree.
> 
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> ---
>  drivers/gpio/gpio-adp5588.c  |    3 +--
>  drivers/gpio/gpio-mcp23s08.c |    7 ++++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index 3beed6e..0de8c70 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -378,7 +378,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
>  		return -EIO;
>  	}
>  
> -	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
>  	if (dev == NULL)
>  		return -ENOMEM;
>  
> @@ -446,7 +446,6 @@ static int adp5588_gpio_probe(struct i2c_client *client,
>  err_irq:
>  	adp5588_irq_teardown(dev);
>  err:
> -	kfree(dev);
>  	return ret;
>  }

You cannot just switch the allocation to devm_kzalloc without removing
the kfree from the remove callback.

> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
> index eea5d7e..a17b81f 100644
> --- a/drivers/gpio/gpio-mcp23s08.c
> +++ b/drivers/gpio/gpio-mcp23s08.c
> @@ -949,10 +949,12 @@ static int mcp23s08_probe(struct spi_device *spi)
>  	if (!chips)
>  		return -ENODEV;
>  
> -	data = kzalloc(sizeof(*data) + chips * sizeof(struct mcp23s08),
> -			GFP_KERNEL);
> +	data = devm_kzalloc(&spi->dev,
> +			    sizeof(*data) + chips * sizeof(struct mcp23s08),
> +			    GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> +
>  	spi_set_drvdata(spi, data);
>  
>  	spi->irq = irq_of_parse_and_map(spi->dev.of_node, 0);
> @@ -989,7 +991,6 @@ fail:
>  			continue;
>  		gpiochip_remove(&data->mcp[addr]->chip);
>  	}
> -	kfree(data);
>  	return status;
>  }

Same bug again.

Johan
