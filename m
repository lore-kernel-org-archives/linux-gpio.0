From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/qoriq: select IRQ_DOMAIN
Date: Fri, 29 Apr 2016 11:13:29 +0200
Message-ID: <CACRpkdbBeVShF-E0MySsmcgkBVQb1upL=5uFDtYbtz3aYNz+iQ@mail.gmail.com>
References: <1461067821-2031706-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461067821-2031706-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 19, 2016 at 2:10 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The gpio-mpc8xxx driver requires IRQ domains but can be built
> without them, resulting on a failure to build certain randconfigs
> on ARM:
>
> drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_gpio_to_irq':
> drivers/gpio/gpio-mpc8xxx.c:92:10: error: implicit declaration of function 'irq_create_mapping' [-Werror=implicit-function-declaration]
>    return irq_create_mapping(mpc8xxx_gc->irq, offset);
>
> This selects IRQ_DOMAIN from the driver to ensure we can build it.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 5df7fd46b70b ("gpio/qoriq: Add qoriq platforms support")

Patch applied.

Yours,
Linus Walleij
