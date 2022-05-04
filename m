Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644EFC4332F
	for <linux-gpio@archiver.kernel.org>; Wed,  4 May 2022 13:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350512AbiEDNiZ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 4 May 2022 09:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiEDNiX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 May 2022 09:38:23 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4280DBA;
        Wed,  4 May 2022 06:34:47 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nmF9R-0001EX-Iz; Wed, 04 May 2022 15:34:45 +0200
Message-ID: <82f2762a-4b53-bfa1-4e57-8e53f13c76e6@leemhuis.info>
Date:   Wed, 4 May 2022 15:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <treding@nvidia.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20220315165205.1502325-1-brgl@bgdev.pl>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] Revert "gpio: Revert regression in sysfs-gpio
 (gpiolib.c)"
In-Reply-To: <20220315165205.1502325-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1651671287;6d3f29cc;
X-HE-SMSGID: 1nmF9R-0001EX-Iz
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15.03.22 17:52, Bartosz Golaszewski wrote:
> This reverts commit fc328a7d1fcce263db0b046917a66f3aa6e68719.
> 
> This commit - while attempting to fix a regression - has caused a number
> of other problems. As the fallout from it is more significant than the
> initial problem itself, revert it for now before we find a correct
> solution.

I just noticed that the regression that fc328a7d1fcc was trying to fix
is still on my list of tracked regressions. Is anyone working on it od
did it fall through the cracks? Was it maybe even fixed already? Or are
matters now that complicated that it's best to just leave everything as
it is now?

Ciao, Thorsten

#regzbot ^backmonitor:
https://lore.kernel.org/stable/20211217153555.9413-1-marcelo.jimenez@gmail.com/

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpiolib.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index defb7c464b87..6630d92e30ad 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1701,6 +1701,11 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
>   */
>  int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset)
>  {
> +#ifdef CONFIG_PINCTRL
> +	if (list_empty(&gc->gpiodev->pin_ranges))
> +		return 0;
> +#endif
> +
>  	return pinctrl_gpio_request(gc->gpiodev->base + offset);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_generic_request);
> @@ -1712,6 +1717,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_request);
>   */
>  void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset)
>  {
> +#ifdef CONFIG_PINCTRL
> +	if (list_empty(&gc->gpiodev->pin_ranges))
> +		return;
> +#endif
> +
>  	pinctrl_gpio_free(gc->gpiodev->base + offset);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_generic_free);
