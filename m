From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: Re: [Linux-kernel] [PATCH 1/4] drivers/gpio: devres.c: allow gpio
 array requests for managed devices
Date: Fri, 20 Jun 2014 23:29:47 +0100
Message-ID: <1403303387.589.359.camel@xylophone>
References: <1403192765-3258-1-git-send-email-rob.jones@codethink.co.uk>
	 <1403192765-3258-2-git-send-email-rob.jones@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:42232 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S965046AbaFTW2H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 20 Jun 2014 18:28:07 -0400
In-Reply-To: <1403192765-3258-2-git-send-email-rob.jones@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Jones <rob.jones@codethink.co.uk>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, heiko@sntech.de, linux-kernel@codethink.co.uk, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org

On Thu, 2014-06-19 at 16:46 +0100, Rob Jones wrote:
[...]
> +int devm_gpio_request_array(struct device *dev,
> +			    const struct gpio *array,
> +			    size_t num)
> +{
> +	int i, err = 0;
> +
> +	for (i = 0; i < num; i++, array++) {
> +		err = devm_gpio_request_one(dev,
> +					    array->gpio,
> +					    array->flags,
> +					    array->label);
> +		if (err) {
> +			while (i--)
> +				devm_gpio_free(dev, (--array)->gpio);

Missing break here.

> +		}
> +	}
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(devm_gpio_request_array);
[...]


