From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: rockchip: add support the get_direction
Date: Wed, 13 Apr 2016 15:26:50 +0200
Message-ID: <CACRpkdbKG5bvv=rXd+osJorvP2gUmhMWMKGfwz56r+HTYiBmOA@mail.gmail.com>
References: <1458028545-1202-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458028545-1202-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2016 at 8:55 AM, Caesar Wang <wxt@rock-chips.com> wrote:

> This patch adds the get_direction to support the gpio
> interface.
>
> The gpio direction is not used on rockchip platform when use the gpio
> debugfs.
>
> Tested on kylin board. (RK3036 SoCs)
> The repro steps:
> $/sys/class/gpio/
> echo 53 > export
> $/sys/class/gpio/gpio53# cat direction
> in
> In general, the gpio53 should be out value, but the direction is the
> default value 'in',  since the get_direction didn't supported in rockchip
> pinctrl.
>
> So, we should add this patch to support it.
>
> Reported-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
>
> ---
>
> Changes in v2:
> - As Heiko comments on (https://patchwork.kernel.org/patch/8576661/),
>   fixes the wrong offset from original patch.

Patch applied.

Yours,
Linus Walleij
