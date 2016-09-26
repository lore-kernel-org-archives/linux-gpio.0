From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/5] tools/gpio: add gpio basic opereations
Date: Mon, 26 Sep 2016 12:37:13 -0700
Message-ID: <CACRpkdb5AYtXgLXU6M+EbjVoJn1TsvpHPgRyPjxZC=hX9HErAQ@mail.gmail.com>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org> <20160831094548.12574-2-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36259 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934954AbcIZThO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2016 15:37:14 -0400
Received: by mail-oi0-f43.google.com with SMTP id t83so219796494oie.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2016 12:37:14 -0700 (PDT)
In-Reply-To: <20160831094548.12574-2-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Wed, Aug 31, 2016 at 2:45 AM,  <bamvor.zhangjian@linaro.org> wrote:

> +int gpio_request(const char *device_name, unsigned int *lines,
> +                unsigned int nlines, unsigned int flag,
> +                struct gpiohandle_data *data, const char *consumer_label)

Could it be named
gpiotools_request_linehandle()?

Or the name is maybe a bit long.

It's nice if we have a name that tells all the function is doing.

> +int gpio_set_values(const int fd, struct gpiohandle_data *data)

Pls rename
gpiotools_set_values()

> +int gpio_get_values(const int fd, struct gpiohandle_data *data)

Pls rename
gpiotools_get_values()

> +int gpio_release(const int fd)

Pls rename
gpiotools_release_linehandle()

> +int gpio_gets(const char *device_name, unsigned int *lines, unsigned int nlines,
> +             unsigned int flag, struct gpiohandle_data *data)
> +int gpio_sets(const char *device_name, unsigned int *lines, unsigned int nlines,
> +             unsigned int flag, struct gpiohandle_data *data)
> +int gpio_get(const char *device_name, unsigned int line, unsigned int flag)
> +int gpio_set(const char *device_name, unsigned int line, unsigned int flag,
> +            unsigned int value)
> +int gpio_set_flag(const char *device_name, unsigned int line, unsigned int flag)

Prefix all gpiotools_*

> +/*
> + * Request the lines for gpio with device_name. Could set the default value
> + * in request.
> + * device_name:    the name of gpiochip in "/dev", such as gpiochip0.
> + * lines:         the array of which line should be requested.
> + * nline:          the total number of line
> + * flag:           input, output and so on. Reference "linux/gpio.h" for the
> + *                 meaning for flag.
> + * data:          default value when flag is GPIOHANDLE_REQUEST_OUTPUT.
> + * consumer_label: the name of consumer, such as "sysfs", "powerkey".
> + *
> + * Return value:   On success return the fd of specific gpiochip. It could be
> + *                 release by gpio_release.
> + *                On failure return the errno.
> + */
> +int gpio_request(const char *device_name, unsigned int *lines,
> +                unsigned int nlines, unsigned int flag,
> +                struct gpiohandle_data *data, const char *consumer_label);

For all of those, convert to kerneldoc (Documentation/kernel-doc-nano-HOWTO)
and move the kerneldoc above the actual implementation, keep the
header file spartan.

Yours,
Linus Walleij
