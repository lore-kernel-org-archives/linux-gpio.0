From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/4] i2c: rk3x: new method to caculate i2c clocks
Date: Thu, 14 Jan 2016 08:12:50 -0800
Message-ID: <CAD=FV=UXMzEQiKcMa7VjDx+arcbRo1e-0HPHBnG8GP7k6uFt1g@mail.gmail.com>
References: <1452774699-57455-1-git-send-email-david.wu@rock-chips.com>
	<1452774699-57455-4-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452774699-57455-4-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Wolfram Sang <wsa@the-dreams.de>, andy.shevchenko@gmail.com, Tao Huang <huangtao@rock-chips.com>, Chris <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, Lin Huang <hl@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Thu, Jan 14, 2016 at 4:31 AM, David Wu <david.wu@rock-chips.com> wrote:
> There was an timing issue about "repeated start" time at the I2C
> controller of version0, controller appears to drop SDA at .875x (7/8)
> programmed clk high. The rule(.875x) isn't enough to meet tSU;STA
> requirements on 100k's Standard-mode. To resolve this issue,
> data_upd_st, start_setup_cnt and stop_setup_cnt configs for I2C
> timing information are added, new rules are designed to calculate
> the timing information at new v1.

I'm curious: does new hardware behave differently and that's why you
need v1?  ...or does old and new hardware behave the same and you're
just introducing v1 so you don't mess with how old boards are working?

>From the description it sounds as if the old code had problems as 100k too...

If the new controller is different, I'd probably reword like the
following (you'd have to re-wordwrap):

There was an timing issue about "repeated start" time at the I2C
controller of version0, controller appears to drop SDA at .875x (7/8)
programmed clk high. On version 1 of the controller, the rule(.875x)
isn't enough to meet tSU;STA
requirements on 100k's Standard-mode. To resolve this issue,
data_upd_st, start_setup_cnt and stop_setup_cnt configs for I2C
timing information are added, new rules are designed to calculate
the timing information at new v1.

-Doug
