From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: add rk3188 routes to switch
 between nand and emmc
Date: Sat, 17 Nov 2018 13:19:16 +0100
Message-ID: <CACRpkdZO852hScSgCGQVspcLSCK99B5ofM9mNkGUj-uQHwfS+g@mail.gmail.com>
References: <20181111210047.30375-1-heiko@sntech.de> <20181111210047.30375-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111210047.30375-2-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, David Wu <david.wu@rock-chips.com>, heiko.stuebner@bq.com
List-Id: linux-gpio@vger.kernel.org

On Sun, Nov 11, 2018 at 10:01 PM Heiko Stuebner <heiko@sntech.de> wrote:

> From: Heiko Stuebner <heiko.stuebner@bq.com>
>
> The rk3188 has pins that are not handled through the regular iomuxing
> for handling either nand-flash or an emmc and are set through only one
> specifal setting. So utilize the routing function to simply do that
> setting depending on one of the core nand/emmc signals that are actually
> regular pins handled through pinctrl.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>

Patch applied.

Yours,
Linus Walleij
