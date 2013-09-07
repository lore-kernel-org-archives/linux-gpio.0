From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: Provide helper macros for logging of GPIO events
Date: Sat, 7 Sep 2013 11:34:36 +0900
Message-ID: <CAAVeFuLLDc+BynoroG8TBx5yT+jYPHfoppDFFqjwistOu-5HnA@mail.gmail.com>
References: <1378471128-3330-1-git-send-email-broonie@kernel.org> <1378471128-3330-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:35496 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860Ab3IGCe5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2013 22:34:57 -0400
Received: by mail-ve0-f181.google.com with SMTP id oy12so2132456veb.40
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2013 19:34:56 -0700 (PDT)
In-Reply-To: <1378471128-3330-2-git-send-email-broonie@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Fri, Sep 6, 2013 at 9:38 PM, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> Currently many but not all GPIO log messages log the GPIO number and the
> formats vary. Ensure that this is done consistently by defining logging
> helpers which take the GPIO descriptor.
>
> The will help people pattern matching on logs and providing the number
> makes the log messages that omitted it more useful.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

I like the idea of having log helpers, but we are trying to deprecate
the representation of GPIO as integers. Well, for now this is indeed
the only way to use them, so what I am saying might only apply when
the gpiod RFC patches are refined and merged, but how about thinking
of another way to represent them, e.g. by GPIO chip name/GPIO index
wrt. their chip? The representation needs to be compact, which is
another challenge.

Note that this is not a comment against this patch (which definitely
improves the situation), just some thinking about a problem we will
likely face later.

>
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 52 +++++++++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 374cf9e..e389183 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -103,6 +103,18 @@ static int gpiod_export_link(struct device *dev, const char *name,
>  static int gpiod_sysfs_set_active_low(struct gpio_desc *desc, int value);
>  static void gpiod_unexport(struct gpio_desc *desc);
>
> +#define gpiod_emerg(desc, fmt, ...)                               \
> +       pr_emerg("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
> +#define gpiod_crit(desc, fmt, ...)                                \
> +       pr_crit("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
> +#define gpiod_err(desc, fmt, ...)                                 \
> +       pr_err("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
> +#define gpiod_warn(desc, fmt, ...)                                \
> +       pr_warn("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
> +#define gpiod_info(desc, fmt, ...)                                \
> +       pr_info("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
> +#define gpiod_dbg(desc, fmt, ...)                                 \
> +       pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
>
>  static inline void desc_set_label(struct gpio_desc *d, const char *label)
>  {
> @@ -1636,8 +1648,9 @@ static int gpiod_direction_input(struct gpio_desc *desc)
>
>         chip = desc->chip;
>         if (!chip->get || !chip->direction_input) {
> -               pr_warn("%s: missing get() or direction_input() operations\n",
> -                       __func__);
> +               gpiod_warn(desc,
> +                       "%s: missing get() or direction_input() operations\n",
> +                        __func__);
>                 return -EIO;
>         }
>
> @@ -1657,8 +1670,7 @@ static int gpiod_direction_input(struct gpio_desc *desc)
>         if (status) {
>                 status = chip->request(chip, offset);
>                 if (status < 0) {
> -                       pr_debug("GPIO-%d: chip request fail, %d\n",
> -                               desc_to_gpio(desc), status);
> +                       gpiod_dbg(desc, "chip request fail, %d\n", status);
>                         /* and it's not available to anyone else ...
>                          * gpio_request() is the fully clean solution.
>                          */
> @@ -1676,8 +1688,7 @@ lose:
>  fail:
>         spin_unlock_irqrestore(&gpio_lock, flags);
>         if (status)
> -               pr_debug("%s: gpio-%d status %d\n", __func__,
> -                        desc_to_gpio(desc), status);
> +               gpiod_dbg(desc, "%s status %d\n", __func__, status);
>         return status;
>  }
>
> @@ -1709,8 +1720,9 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
>
>         chip = desc->chip;
>         if (!chip->set || !chip->direction_output) {
> -               pr_warn("%s: missing set() or direction_output() operations\n",
> -                       __func__);
> +               gpiod_warn(desc,
> +                      "%s: missing set() or direction_output() operations\n",
> +                      __func__);
>                 return -EIO;
>         }
>
> @@ -1730,8 +1742,7 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
>         if (status) {
>                 status = chip->request(chip, offset);
>                 if (status < 0) {
> -                       pr_debug("GPIO-%d: chip request fail, %d\n",
> -                               desc_to_gpio(desc), status);
> +                       gpiod_dbg(desc, "chip request fail, %d\n", status);
>                         /* and it's not available to anyone else ...
>                          * gpio_request() is the fully clean solution.
>                          */
> @@ -1749,8 +1760,7 @@ lose:
>  fail:
>         spin_unlock_irqrestore(&gpio_lock, flags);
>         if (status)
> -               pr_debug("%s: gpio-%d status %d\n", __func__,
> -                        desc_to_gpio(desc), status);
> +               gpiod_dbg(desc, "%s: gpio status %d\n", __func__, status);
>         return status;
>  }
>
> @@ -1779,8 +1789,9 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>
>         chip = desc->chip;
>         if (!chip->set || !chip->set_debounce) {
> -               pr_debug("%s: missing set() or set_debounce() operations\n",
> -                        __func__);
> +               gpiod_dbg(desc,
> +                         "%s: missing set() or set_debounce() operations\n",
> +                         __func__);
>                 return -EIO;
>         }
>
> @@ -1802,8 +1813,7 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>  fail:
>         spin_unlock_irqrestore(&gpio_lock, flags);
>         if (status)
> -               pr_debug("%s: gpio-%d status %d\n", __func__,
> -                        desc_to_gpio(desc), status);
> +               gpiod_dbg(desc, "%s: status %d\n", __func__, status);
>
>         return status;
>  }
> @@ -1891,8 +1901,9 @@ static void _gpio_set_open_drain_value(struct gpio_desc *desc, int value)
>         }
>         trace_gpio_direction(desc_to_gpio(desc), value, err);
>         if (err < 0)
> -               pr_err("%s: Error in set_value for open drain gpio%d err %d\n",
> -                                       __func__, desc_to_gpio(desc), err);
> +               gpiod_err(desc,
> +                         "%s: Error in set_value for open drain err %d\n",
> +                         __func__, err);
>  }
>
>  /*
> @@ -1918,8 +1929,9 @@ static void _gpio_set_open_source_value(struct gpio_desc *desc, int value)
>         }
>         trace_gpio_direction(desc_to_gpio(desc), !value, err);
>         if (err < 0)
> -               pr_err("%s: Error in set_value for open source gpio%d err %d\n",
> -                                       __func__, desc_to_gpio(desc), err);
> +               gpiod_err(desc,
> +                         "%s: Error in set_value for open source err %d\n",
> +                         __func__, err);
>  }
>
>  /**
> --
> 1.8.4.rc3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
