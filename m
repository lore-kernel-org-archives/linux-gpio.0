From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] x86: pcengines apuv2 gpio/leds/keys platform driver
Date: Fri, 8 Feb 2019 15:30:59 +0100
Message-ID: <CACRpkdaFJyGYeDZ83LQBG4pr3tgtYPkDQ3RGrrGPM==Sw1vE2w@mail.gmail.com>
References: <1549588593-4856-1-git-send-email-lkml@metux.net> <1549588593-4856-2-git-send-email-lkml@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549588593-4856-2-git-send-email-lkml@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 8, 2019 at 2:16 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> From: "Enrico Weigelt, metux IT consult" <info@metux.net>
>
> Driver for PCengines APUv2 board that supports GPIOs via AMD PCH
> and attached LEDs and keys.
>
> Cc: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org
> Cc: bgolaszewski@baylibre.com
> Cc: dvhart@infradead.org
> Cc: andy@infradead.org
> Cc: platform-driver-x86@vger.kernel.org
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Andy can provide more details on this patch here are some quick
remarks:

> +#define GPIO_BASE              100
> +
> +#define GPIO_LED1              (GPIO_BASE+0)
> +#define GPIO_LED2              (GPIO_BASE+1)
> +#define GPIO_LED3              (GPIO_BASE+2)
> +#define GPIO_MODESW            (GPIO_BASE+3)
> +#define GPIO_SIMSWAP           (GPIO_BASE+4)

Instead of hardcoding the GPIO base and offsets like this, use:

#include <linux/gpio/machine.h>

and define a descriptor table using the name of your gpiochip.
There should be examples of other board quirks doing this.
I have already patched gpio-leds.c to accept LEDs from
descriptor tables, see commit
commit 45d4c6de4e497e5b0026c77044ae5fcddf8fecd8
"leds: gpio: Try to lookup gpiod from device"

Yours,
Linus Walleij
