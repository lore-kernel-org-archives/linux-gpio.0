From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: rockchip: add support for the rk3399
Date: Wed, 27 Jan 2016 15:02:18 +0100
Message-ID: <CACRpkdb6Cooo-_eBKJn-SdFkGPg2hR9nud7Tq6aa+bmkDuOEmg@mail.gmail.com>
References: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
	<1452152498-21780-1-git-send-email-wdc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452152498-21780-1-git-send-email-wdc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Wu <wdc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: huangtao@rock-chips.com, Chris Zhong <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, xjq@rock-chips.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2016 at 8:41 AM, David Wu <wdc@rock-chips.com> wrote:

> From: David Wu <david.wu@rock-chips.com>
>
> The pinctrl of rk3399 is much different from other's,
> especially the 3bits of drive strength.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
> change from v1:
> - need spin_unlock_irqrestore for set drive default case

Heiko can you please look at this patch?

> +       { .compatible = "rockchip,rk3399-pinctrl",
> +               .data = (void *)&rk3399_pin_ctrl },

I guess this requires a small patch to some binding file.
It's OK to fold that into this patch.

Yours,
Linus Walleij
