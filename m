From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: Fix NULL pointer deference
Date: Wed, 8 Jun 2016 10:39:30 +0200
Message-ID: <CACRpkdZ42659nZnKaahFDahLY1Ey4dtTGt2nY69se=pu=jnpFw@mail.gmail.com>
References: <1464973802-9286-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464973802-9286-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Roger Quadros <rogerq@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 3, 2016 at 7:10 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Under some circumstances, a gpiochip might be half cleaned from the
> gpio_device list.
>
> This patch makes sure that the chip pointer is still valid, before
> calling the match function.
>
> [  104.088296] BUG: unable to handle kernel NULL pointer dereference at
> 0000000000000090
> [  104.089772] IP: [<ffffffff813d2045>] of_gpiochip_find_and_xlate+0x15/0x80
> [  104.128273] Call Trace:
> [  104.129802]  [<ffffffff813d2030>] ? of_parse_own_gpio+0x1f0/0x1f0
> [  104.131353]  [<ffffffff813cd910>] gpiochip_find+0x60/0x90
> [  104.132868]  [<ffffffff813d21ba>] of_get_named_gpiod_flags+0x9a/0x120
> ...
> [  104.141586]  [<ffffffff8163d12b>] gpio_led_probe+0x11b/0x360
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Oh there is the fix that Roger and Grygorii needs.

Applied to fixes and tagged for stable.

Sorry for screwing things up :(

Yours,
Linus Walleij
