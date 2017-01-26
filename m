From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rockchip: Add rk3328 pinctrl support
Date: Thu, 26 Jan 2017 14:29:17 +0100
Message-ID: <CACRpkdaJEEGFnfX0_eBtwLMqYtSTShB5u6WCaA-YZG53OMnk+w@mail.gmail.com>
References: <1485074286-7863-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485074286-7863-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Tao Huang <huangtao@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jan 22, 2017 at 9:38 AM, David Wu <david.wu@rock-chips.com> wrote:

> From: "david.wu" <david.wu@rock-chips.com>
>
> This patch supports 3bit width iomux type.
> Note, the iomux of following pins are special, need to
> be handled specially.
>  - gpio2_b0 ~ gpio2_b6
>  - gpio2_b7
>  - gpio2_c7
>  - gpio3_b0
>  - gpio3_b1 ~ gpio3_b7
> And therefore add IOMUX_RECALCED_FLAG to indicate which
> iomux source of the bank need to be recalced. If the mux
> recalced callback and IOMUX_RECALCED_FLAG were set, recalc
> the related pins' iomux.
>
> Signed-off-by: david.wu <david.wu@rock-chips.com>

Heiko, could you review this?

Yours,
Linus Walleij
