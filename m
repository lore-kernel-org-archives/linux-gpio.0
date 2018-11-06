From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: build warning after merge of the gpio tree
Date: Tue, 6 Nov 2018 08:24:30 +0100
Message-ID: <20181106072430.vub6xjvyof2agj3h@pengutronix.de>
References: <20181106121502.00efbd07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181106121502.00efbd07@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Nov 06, 2018 at 12:15:02PM +1100, Stephen Rothwell wrote:
> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/gpio/gpiolib.c:1514:12: warning: 'devm_gpio_chip_match' defined but not used [-Wunused-function]
>  static int devm_gpio_chip_match(struct device *dev, void *res, void *data)
>             ^~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   48207d7595d2 ("gpio: drop devm_gpiochip_remove()")

I noticed this, too, but didn't tell immediately because I thought I'd
have to resent this patch and then forgot as you applied yourself.

Sorry for that, the obvious resolution is to drop
devm_gpio_chip_match(). Feel free to squash that into 48207d7595d2. If
your branch is already stable I can provide a patch for that.

Thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
