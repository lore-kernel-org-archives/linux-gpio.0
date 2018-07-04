From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2] gpiolib: Defer on non-DT find_chip_by_name() failure
Date: Wed, 4 Jul 2018 09:17:22 +0200
Message-ID: <20180704091722.29f86ae3@bbrezillon>
References: <20180703172635.32508-1-jmkrzyszt@gmail.com>
        <20180703221819.1825-1-jmkrzyszt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703221819.1825-1-jmkrzyszt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed,  4 Jul 2018 00:18:19 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

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
> 
> I'm not sure if adding both Suggested-by: and Reviewed-by: heades both
> with the same person name is in line with good practices, please remove
> one if not.

I don't think that's a problem. Suggesting a solution and agreeing on
the implementation are 2 different things, so both are not mutually
exclusive IMO.
