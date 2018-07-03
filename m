From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpiolib: Defer on non-DT find_chip_by_name() failure
Date: Tue, 3 Jul 2018 23:06:11 +0300
Message-ID: <CAHp75Vf5XC=RNiid12WXYtiT-SSPoH45VpakRrNV=T0qQCecdg@mail.gmail.com>
References: <20180703172635.32508-1-jmkrzyszt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703172635.32508-1-jmkrzyszt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Boris Brezillon <boris.brezillon@bootlin.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 3, 2018 at 8:26 PM, Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> Avoid replication of error code conversion in non-DT GPIO consumers'
> code by returning -EPROBE_DEFER from gpiod_find() in case a chip
> identified by its label in a registered lookup table is not ready.
>
> See https://lkml.org/lkml/2018/5/30/176 for example case.

> +                       /*
> +                        * As the lookup table indicates a chip with
> +                        * p->chip_label should exist, assume it may
> +                        * still appear latar and let the interested

latar -> later

> +                        * consumer be probed again or let the Deferred
> +                        * Probe infrastructure handle the error.
> +                        */
> +                       dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
> +                                p->chip_label);
> +                       return ERR_PTR(-EPROBE_DEFER);
>                 }

-- 
With Best Regards,
Andy Shevchenko
