From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 10/23] pinctrl: rockchip: add schmitt input mode
 support for rv1108
Date: Mon, 7 Aug 2017 10:50:48 +0200
Message-ID: <CACRpkdZZh_vix_+atNk-r8ZCGV3HR-SJ6fzbFwFS6GEodqAbCQ@mail.gmail.com>
References: <1501662303-11687-1-git-send-email-andy.yan@rock-chips.com> <1501663217-12255-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501663217-12255-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2017 at 10:40 AM, Andy Yan <andy.yan@rock-chips.com> wrote:

> Some pins like i2c SCL/SDA need the schmitt input function
> to avoid crosstalk problems.
>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>
> Changes in v2: None

Already applied v1 with Heiko's ACK so should be fine then.

Yours,
Linus Walleij
