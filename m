From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: rockchip: don't disable clk when irq mask is
 already set
Date: Tue, 27 Sep 2016 00:35:18 +0200
Message-ID: <3592219.tUs91je5kA@phil>
References: <1474655197-26919-1-git-send-email-jacob-chen@iotwrt.com>
 <fb4ec747-fde3-142b-1963-be3b9cfab260@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <fb4ec747-fde3-142b-1963-be3b9cfab260-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

Am Samstag, 24. September 2016, 18:24:11 CEST schrieb Shawn Lin:
> On 2016/9/24 2:26, Jacob Chen wrote:
> > From: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > In some drivers, disable_irq() call don't be symmetric with enable_irq()
> > , disable_irq() will be called before call free_irq().
> 
> Which upstream drivers you refer to?
> 
> Shouldn't it be the unbalanced call for these drivers?
> 
> > But both disable_irq() and free_irq() will call
> > rockchip_irq_gc_mask_set_bit,> 
> >  and clk_disable() will be called more times than clk_enable(), which will
> > 
> > cause bugs.
> > 
> > I think we can correct that by checking of mask.If mask is already set, do
> > nothing.
> Looks like a little hacky to me.

that may be true, but on first glance I tend to agree with Jacob.
Look for example at (a driver using disable_irq I picked at random) drivertc/
rtcrs/-tps6586x.c .

In its probe function it does devm_request_irq directly followed by 
disable_irq on its alarm interrupt. The interrupt only gets enabled again if 
the rtc alarm gets enabled. So you can easily run into the disable + free case 
there as well. Similar probably in a lot of other drivers.


Heiko

> 
> > Change-Id: If19912c7658253e15531c04db6c70fdbffd5960a
> 
> remove this.
> 
> > Signed-off-by: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > 
> >  drivers/pinctrl/pinctrl-rockchip.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > b/drivers/pinctrl/pinctrl-rockchip.c index c6c04ac..9a8804a 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -2334,8 +2334,12 @@ static void rockchip_irq_gc_mask_clr_bit(struct
> > irq_data *d)> 
> >  void rockchip_irq_gc_mask_set_bit(struct irq_data *d)
> >  {
> >  
> >  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> > 
> > +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
> > 
> >  	struct rockchip_pin_bank *bank = gc->private;
> > 
> > +	if (*ct->mask_cache & d->mask)
> > +		return;
> > +
> > 
> >  	irq_gc_mask_set_bit(d);
> >  	clk_disable(bank->clk);
> >  
> >  }
> > 
> > --
> > 2.7.4
> > 
> > 
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
