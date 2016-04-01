From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: gpio irqchip initialization race
Date: Fri, 1 Apr 2016 10:47:42 +0200
Message-ID: <CACRpkdZ32AAq2BfoEeyiBm1RiXQVkTO6gxsEuuMGhm7wuUXxgQ@mail.gmail.com>
References: <44236018.b6N0xPzKYW@ws-stein>
	<CACRpkdbfidnokJ2WyagdcEycDu3dXKVon2z4TKM7KhNg_Hyf9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbfidnokJ2WyagdcEycDu3dXKVon2z4TKM7KhNg_Hyf9w@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Input <linux-input@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 10:43 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> I think the problem is that gpio-keys is calling gpio_to_irq(), and at that
> point between gpiochip_add_data() but before gpiochip_irqchip_add()
> it gets a bogus IRQ when it should be getting -EPROBE_DEFER.

Or not a bogus irqnumber really, it get -ENXIO (-6)
as in your example:

> gpio-keys user_sw: Unable to get irq number for GPIO 376, error -6

And in this case (if gpio_keys handle -EPROBE_DEFER gracefully)
all should be fine with my oneliner patch.

I am more uncertain about the -EINVAL (-22) we might need some
more analysis there.

Yours,
Linus Walleij
