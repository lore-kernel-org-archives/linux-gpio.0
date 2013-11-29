From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] gpio: better lookup method for platform GPIOs
Date: Fri, 29 Nov 2013 13:57:49 +0200
Message-ID: <20131129115748.GB3942@xps8300>
References: <1385628388-23827-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:40041 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752741Ab3K2L5x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 06:57:53 -0500
Content-Disposition: inline
In-Reply-To: <1385628388-23827-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rhyland Klein <rklein@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Thu, Nov 28, 2013 at 05:46:28PM +0900, Alexandre Courbot wrote:
> @@ -88,16 +89,20 @@ Note that GPIO_LOOKUP() is just a shortcut to GPIO_LOOKUP_IDX() where idx = 0.
>  
>  A lookup table can then be defined as follows:
>  
> -	struct gpiod_lookup gpios_table[] = {
> -	GPIO_LOOKUP_IDX("gpio.0", 15, "foo.0", "led", 0, GPIO_ACTIVE_HIGH),
> -	GPIO_LOOKUP_IDX("gpio.0", 16, "foo.0", "led", 1, GPIO_ACTIVE_HIGH),
> -	GPIO_LOOKUP_IDX("gpio.0", 17, "foo.0", "led", 2, GPIO_ACTIVE_HIGH),
> -	GPIO_LOOKUP("gpio.0", 1, "foo.0", "power", GPIO_ACTIVE_LOW),
> -	};
> +struct gpiod_lookup_table gpios_table = {
> +	.dev_id = "foo.0",
> +	.size = 4,
> +	.table = {
> +	GPIO_LOOKUP_IDX("gpio.0", 15, "led", 0, GPIO_ACTIVE_HIGH),
> +	GPIO_LOOKUP_IDX("gpio.0", 16, "led", 1, GPIO_ACTIVE_HIGH),
> +	GPIO_LOOKUP_IDX("gpio.0", 17, "led", 2, GPIO_ACTIVE_HIGH),
> +	GPIO_LOOKUP("gpio.0", 1, "power", GPIO_ACTIVE_LOW),
> +	},
> +};

Instead of using the size variable, wouldn't it be more clear to
expect the array to be null terminated?

>  And the table can be added by the board code as follows:
>  
> -	gpiod_add_table(gpios_table, ARRAY_SIZE(gpios_table));
> +	gpiod_add_lookup_table(&gpios_table);

Remove "&" from the above.

Thanks,

-- 
heikki
