From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: pxa: Make two symbols static
Date: Tue, 23 Apr 2019 13:02:39 +0200
Message-ID: <CACRpkdbTTaYV4+VuVPSH=dbH_6mMqYHbenSqAOvYS_kwJpeL3Q@mail.gmail.com>
References: <20190416145612.30364-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416145612.30364-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 16, 2019 at 4:56 PM Yue Haibing <yuehaibing@huawei.com> wrote:

> From: YueHaibing <yuehaibing@huawei.com>
>
> Fix sparse warnings:
>
> drivers/gpio/gpio-pxa.c:580:29: warning:
>  symbol 'pxa_irq_domain_ops' was not declared. Should it be static?
> drivers/gpio/gpio-pxa.c:819:20: warning:
>  symbol 'pxa_gpio_syscore_ops' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
