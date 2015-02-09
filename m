From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [patch] gpio: ge: fix error code in gef_gpio_probe()
Date: Mon, 9 Feb 2015 14:29:29 +0900
Message-ID: <CAAVeFuKOzMQDeOyxUHdLc19480u+JyN5xb+2cK4rx9s7jcioAw@mail.gmail.com>
References: <20150128191320.GB10259@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20150128191320.GB10259@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kamlakant Patel <kamlakant.patel@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 29, 2015 at 4:13 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If kstrdup() fails then we should return -ENOMEM but instead the current
> code returns success.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
> index 6ea9303..07e9b39 100644
> --- a/drivers/gpio/gpio-ge.c
> +++ b/drivers/gpio/gpio-ge.c
> @@ -77,8 +77,10 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
>
>         /* Setup pointers to chip functions */
>         bgc->gc.label = kstrdup(pdev->dev.of_node->full_name, GFP_KERNEL);
> -       if (!bgc->gc.label)
> +       if (!bgc->gc.label) {
> +               ret = -ENOMEM;
>                 goto err0;
> +       }

This one is already fixed by
http://www.spinics.net/lists/linux-gpio/msg03670.html
