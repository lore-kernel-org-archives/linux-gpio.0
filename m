From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: rockchip: Add rv1108 recalculated iomux support
Date: Thu, 31 Aug 2017 15:26:28 +0200
Message-ID: <CACRpkdY+U49Ls6ZFVbk6j2i8HASUAKnb5zDV0oyUyosphWJ4iw@mail.gmail.com>
References: <1503475207-30288-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503475207-30288-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Tao Huang <huangtao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 23, 2017 at 10:00 AM, David Wu <david.wu@rock-chips.com> wrote:

> The pins from GPIO1A0 to GPIO1B1 are special, need to recalculate
> iomux. And the register offset is larger than the u8 range, so changed
> to u32.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
