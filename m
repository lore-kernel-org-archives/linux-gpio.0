From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: bcm2835: Fix build error without CONFIG_OF
Date: Sun, 2 Jun 2019 10:39:12 +0200
Message-ID: <CACRpkdb0dti=x2UxaOoP=VRrzxQTuAaeQ2==UM4U6KNyHC2QwQ@mail.gmail.com>
References: <20190528091304.9932-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528091304.9932-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Greg KH <gregkh@linuxfoundation.org>, Doug Berger <opendmb@gmail.com>, Eric Anholt <eric@anholt.net>, Thomas Gleixner <tglx@linutronix.de>, Matheus Castello <matheus@castello.eng.br>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 11:18 AM YueHaibing <yuehaibing@huawei.com> wrote:

> drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pctl_dt_node_to_map:
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:720:8: error: implicit declaration of function pinconf_generic_dt_node_to_map_all;
> drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pinctrl_probe:
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:1022:15: error: struct gpio_chip has no member named of_node
>   pc->gpio_chip.of_node = np;
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl binding")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
