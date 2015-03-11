From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH] gpio: fix constconst in devres
Date: Wed, 11 Mar 2015 13:22:19 +0100
Message-ID: <5364467.g0vMANFLvB@pcimr>
References: <1426073078-25029-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40567 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbbCKMWX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 08:22:23 -0400
In-Reply-To: <1426073078-25029-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Olliver Schinagl <oliver@schinagl.nl>

On Wednesday 11 March 2015 12:24:38 Linus Walleij wrote:
> Commit 1feb57a245a4910b03202a814ffc51a900bd4aca
> "gpio: add parameter to allow the use named gpios"
> includes a double-conted array. Fix this.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/devres.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
> index ec24da2418b3..0bd060bf7151 100644
> --- a/drivers/gpio/devres.c
> +++ b/drivers/gpio/devres.c
> @@ -135,7 +135,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>  					    const char *con_id,
>  					    struct fwnode_handle *child)
>  {
> -	static const char const *suffixes[] = { "gpios", "gpio" };
> +	static const char *suffixes[] = { "gpios", "gpio" };
>  	char prop_name[32]; /* 32 is max size of property name */
>  	struct gpio_desc **dr;
>  	struct gpio_desc *desc;
> 

Shouldn't it be const char * const suffixes[], as in a const pointer to const data?

Wouldn't it be better to add an #include "gpiolib.h" to devres.c and use
the gpio_suffixes array defined in gliolib.h?


