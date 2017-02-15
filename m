From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [patch] gpio: mockup: return -EFAULT if copy_from_user() fails
Date: Wed, 15 Feb 2017 10:16:21 +0100
Message-ID: <CAMpxmJU16zrxT-RLPp_GPO_wtd-aqDtw=M0bSmEwpYT+0z-phA@mail.gmail.com>
References: <20170214230206.GA4048@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:36306 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbdBOJQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2017 04:16:22 -0500
Received: by mail-io0-f174.google.com with SMTP id j13so85445766iod.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2017 01:16:22 -0800 (PST)
In-Reply-To: <20170214230206.GA4048@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

2017-02-15 0:02 GMT+01:00 Dan Carpenter <dan.carpenter@oracle.com>:
> copy_from_user() returns the number of bytes remaining to be copied but
> we want to return negative error codes on failue.
>
> Fixes: 9202ba2397d1 ("gpio: mockup: implement event injecting over debugfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 06dac72cb69c..d99338689213 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -197,7 +197,7 @@ static ssize_t gpio_mockup_event_write(struct file *file,
>         struct seq_file *sfile;
>         struct gpio_desc *desc;
>         struct gpio_chip *gc;
> -       int status, val;
> +       int val;
>         char buf;
>
>         sfile = file->private_data;
> @@ -206,9 +206,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
>         chip = priv->chip;
>         gc = &chip->gc;
>
> -       status = copy_from_user(&buf, usr_buf, 1);
> -       if (status)
> -               return status;
> +       if (copy_from_user(&buf, usr_buf, 1))
> +               return -EFAULT;
>
>         if (buf == '0')
>                 val = 0;

Oops my bad.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
