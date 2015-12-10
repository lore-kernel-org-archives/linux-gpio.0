From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: pxa: convert to one gpiochip
Date: Thu, 10 Dec 2015 16:04:22 +0100
Message-ID: <CACRpkdbNRck0S_6P4+HX-4bSkLvsnbOokig4oGgB+vVt6M2sdg@mail.gmail.com>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<1448746665-13422-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448746665-13422-2-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 28, 2015 at 10:37 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> The pxa gpio IP is provided by one chip, which holds multiple banks.
>
> Another reason the driver should register only one gpiochip instead of
> multiple gpiochips (ie. 1 per each bank) is that for pincontrol and
> devicetree integration (think gpio-ranges), it's impossible to have the
> contiguous pin range 0..127 mapped to gpios 0..127.
>
> This patch, amongst other thinks, paves the path to loosen the bond with
> the global structure variable pxa_gpio_chip.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Patch applied.

Since noone else seems to care, would you consider sending a patch
to MAINTAINERS listing yourself as maintainer of this GPIO driver?

Yours,
Linus Walleij
