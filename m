From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rockchip: add irq_enable & irq_disable ops
Date: Tue, 14 Mar 2017 16:03:48 +0100
Message-ID: <CACRpkdYQawufFw+TX8MX0qbAXOy9rJ=uT5qCG8kmfOON2k7yMw@mail.gmail.com>
References: <1488434212-6567-1-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488434212-6567-1-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, Tomasz Figa <tfiga@google.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2017 at 6:56 AM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:

> Currently we are trying to enable/disable the clk of irq's gpio bank when
> unmask/mask irq. But the kernel's "lazy disable approach" will skip masking
> irq when the irq chip doesn't support irq_disable ops.
>
> So we may hit this case:
>         irq_enable-> enable clk
>         irq_disable-> noop
>         irq_enable-> enable clk again
>         irq_disable-> noop
>
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

Heiko, can you look at this patch?

Yours,
Linus Walleij
