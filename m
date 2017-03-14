From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] pinctrl: rockchip: add irq_enable & irq_disable ops
Date: Tue, 14 Mar 2017 16:06:40 +0100
Message-ID: <1586348.DzvzNKqtLI@diego>
References: <1488434212-6567-1-git-send-email-jeffy.chen@rock-chips.com> <CACRpkdYQawufFw+TX8MX0qbAXOy9rJ=uT5qCG8kmfOON2k7yMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYQawufFw+TX8MX0qbAXOy9rJ=uT5qCG8kmfOON2k7yMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, Tomasz Figa <tfiga@google.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Am Dienstag, 14. März 2017, 16:03:48 CET schrieb Linus Walleij:
> On Thu, Mar 2, 2017 at 6:56 AM, Jeffy Chen <jeffy.chen@rock-chips.com> 
wrote:
> > Currently we are trying to enable/disable the clk of irq's gpio bank when
> > unmask/mask irq. But the kernel's "lazy disable approach" will skip
> > masking
> > irq when the irq chip doesn't support irq_disable ops.
> > 
> > So we may hit this case:
> >         irq_enable-> enable clk
> >         irq_disable-> noop
> >         irq_enable-> enable clk again
> >         irq_disable-> noop
> > 
> > Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> 
> Heiko, can you look at this patch?

This (and all the other pending pinctrl patches) are in my queue, but right 
now I'm still hunting rockchip regressions in 4.11-rc, so haven't found the 
time to review yet.


Heiko
