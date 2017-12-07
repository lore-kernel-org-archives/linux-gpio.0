From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] gpio: gpio-rcar: Support S2RAM
Date: Thu, 7 Dec 2017 10:08:11 +0100
Message-ID: <20171207090810.zzltv5567d62w4ka@verge.net.au>
References: <1512586115-4698-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdXRLuXeVmE9UAFGMdKV4gFSNO3kiVkh-q2MYM8spPkF7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRLuXeVmE9UAFGMdKV4gFSNO3kiVkh-q2MYM8spPkF7Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 06, 2017 at 08:01:52PM +0100, Geert Uytterhoeven wrote:
> Hi Kaneko-san,
> 
> On Wed, Dec 6, 2017 at 7:48 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > From: Hien Dang <hien.dang.eb@renesas.com>
> >
> > This patch adds an implementation that saves and restores the state of
> > GPIO configuration on suspend and resume.
> >
> > Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpio/gpio-rcar.c
> > +++ b/drivers/gpio/gpio-rcar.c
> > @@ -31,6 +31,16 @@
> >  #include <linux/spinlock.h>
> >  #include <linux/slab.h>
> >
> > +struct gpio_rcar_bank_info {
> > +       bool iointsel;
> > +       bool inoutsel;
> > +       bool outdt;
> > +       bool active_high_rising_edge;
> > +       bool level_trigger;
> > +       bool both;
> > +       bool intmsk;
> > +};
> 
> So for each GPIO, you save 7 bools = 7 bytes.

s/save/use/ ?

> >  struct gpio_rcar_priv {
> >         void __iomem *base;
> >         spinlock_t lock;
> > @@ -41,6 +51,7 @@ struct gpio_rcar_priv {
> >         unsigned int irq_parent;
> >         bool has_both_edge_trigger;
> >         bool needs_clk;
> > +       struct gpio_rcar_bank_info bank_info[32];
> 
> That's 32 x 7 = 224 bytes in total.
> 
> What about just using 7 u32s instead, one for each register to save?
> That way you only need 7 x 4 = 28 bytes, and you can probably optimize
> the code to just save/restore the whole register at once.

So the suggestion is to use a u32 instead of struct gpio_rcar_bank_info,
and for each field of struct gpio_rcar_bank_info use a bit in the u32?

If so, probably one could go a step further and use a u8 as there are
currently only 7 fields, thus using 32 x 1 = 32 bytes rather than
32 x 4 = 128 bytes.
