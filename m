From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/4] pinctrl: rockchip: avoid hardirq-unsafe functions
 in irq_chip
Date: Tue, 28 Mar 2017 11:19:31 +0200
Message-ID: <CACRpkdYy9cygGCYJcWQiO+iv2TSwphBxiiShsE4gWPUgM9z67A@mail.gmail.com>
References: <20170323105931.10455-1-john@metanate.com> <20170323105931.10455-5-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170323105931.10455-5-john@metanate.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Keeping <john@metanate.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2017 at 11:59 AM, John Keeping <john@metanate.com> wrote:

> With real-time preemption, regmap functions cannot be used in the
> implementation of irq_chip since they use spinlocks which may sleep.
>
> Move the setting of the mux for IRQs to an irq_bus_sync_unlock handler
> where we are allowed to sleep.
>
> Signed-off-by: John Keeping <john@metanate.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
> v3: unchanged
> v2: unchanged

Patch applied.

Yours,
Linus Walleij
