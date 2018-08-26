From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: ftgpio: Support optional silicon clock
Date: Mon, 27 Aug 2018 00:46:25 +0200
Message-ID: <CACRpkdYeyNzZ2XM=Rj4igKF7t+TLk3veteRXeO4D4XYLaSN4FQ@mail.gmail.com>
References: <20180826110321.17723-1-linus.walleij@linaro.org>
 <20180826190445.GB7359@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180826190445.GB7359@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonas Jensen <jonas.jensen@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sun, Aug 26, 2018 at 9:04 PM Andrew Lunn <andrew@lunn.ch> wrote:

> > +     g->clk = devm_clk_get(dev, NULL);
> > +     if (!IS_ERR(g->clk)) {
> > +             ret = clk_prepare_enable(g->clk);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Hi Linus
>
> Is there any chance devm_clk_get() could return -EPROBE_DIFFERED?

Not practically but I was convinced to move the bulk of clocks out of
CLK_OF_DECLARE_DRIVER so I guess theoretically it could happen.
So I guess I should re-spin with that as explict bailout condition.

Yours,
Linus Walleij
