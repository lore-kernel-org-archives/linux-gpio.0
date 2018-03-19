From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: mockup: fix a potential crash when creating debugfs entries
Date: Mon, 19 Mar 2018 10:35:31 +0100
Message-ID: <CAMRc=McpwoE-QL8b+5FeWkOgHCNZZq3AKcxzOJ11+b+Pb=TECQ@mail.gmail.com>
References: <20180304124551.22565-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180304124551.22565-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

2018-03-04 13:45 GMT+01:00 Bartosz Golaszewski <brgl@bgdev.pl>:
> If we failed to create the top debugfs directory, we must not try to
> create the child nodes. We currently only check if gpio_mockup_dbg_dir
> is not NULL, but it can also contain an errno if debugfs is disabled
> in build options. Use IS_ERR_OR_NULL() instead.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpio-mockup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 3a545ad17817..b5876b07b0f7 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -314,7 +314,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>         if (rv)
>                 return rv;
>
> -       if (gpio_mockup_dbg_dir)
> +       if (!IS_ERR_OR_NULL(gpio_mockup_dbg_dir))
>                 gpio_mockup_debugfs_setup(dev, chip);
>
>         return 0;
> --
> 2.16.1
>

Hi Linus,

gentle ping for this one as it causes a crash if debugfs is disabled.

Bart
