From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Defer on non-DT find_chip_by_name() failure
Date: Mon, 9 Jul 2018 15:18:04 +0200
Message-ID: <CACRpkdZ4P+PhKCb=2rmT5unrzJLkYkCiWDBDMptxZVp7OdcGBg@mail.gmail.com>
References: <20180703172635.32508-1-jmkrzyszt@gmail.com> <20180703221819.1825-1-jmkrzyszt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703221819.1825-1-jmkrzyszt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 4, 2018 at 12:18 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Avoid replication of error code conversion in non-DT GPIO consumers'
> code by returning -EPROBE_DEFER from gpiod_find() in case a chip
> identified by its label in a registered lookup table is not ready.
>
> See https://lkml.org/lkml/2018/5/30/176 for example case.
>
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changelog
> v2: fix typo (latar -> later) - thanks Boris and Andy for catching this

Patch applied as the discussion seems to conclude this should
work fine, I hope we will notice if it doesn't!

Yours,
Linus Walleij
