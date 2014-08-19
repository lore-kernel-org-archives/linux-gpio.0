From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: move GPIOD flags outside #ifdef
Date: Tue, 19 Aug 2014 10:04:51 -0700
Message-ID: <CAAVeFuKi1Pwmr=Q=B5WDu76fGR7JthOmi3gaMMx2itfsELutdg@mail.gmail.com>
References: <1408467820-4766-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:40840 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752010AbaHSRFM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Aug 2014 13:05:12 -0400
Received: by mail-ie0-f177.google.com with SMTP id at20so1404250iec.8
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2014 10:05:12 -0700 (PDT)
In-Reply-To: <1408467820-4766-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Aug 19, 2014 at 10:03 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> The GPIOD flags are defined inside the #ifdef CONFIG_GPIOLIB
> switch, making the gpiolib stubs fail if these flags are used
> by a consumer. This is not correct: the stubs should compile
> fine without GPIOLIB.

Oops, sorry about this.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Reported-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  include/linux/gpio/consumer.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index b7ce0c64c6f3..c7e17de732f3 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -16,8 +16,6 @@ struct device;
>   */
>  struct gpio_desc;
>
> -#ifdef CONFIG_GPIOLIB
> -
>  #define GPIOD_FLAGS_BIT_DIR_SET                BIT(0)
>  #define GPIOD_FLAGS_BIT_DIR_OUT                BIT(1)
>  #define GPIOD_FLAGS_BIT_DIR_VAL                BIT(2)
> @@ -34,6 +32,8 @@ enum gpiod_flags {
>                           GPIOD_FLAGS_BIT_DIR_VAL,
>  };
>
> +#ifdef CONFIG_GPIOLIB
> +
>  /* Acquire and dispose GPIOs */
>  struct gpio_desc *__must_check __gpiod_get(struct device *dev,
>                                          const char *con_id,
> --
> 1.9.3
>
