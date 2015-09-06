From: maoguang meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4] pinctrl: mediatek: Implement wake handler and
 suspend resume
Date: Sun, 6 Sep 2015 18:39:32 +0800
Message-ID: <1441535972.22230.5.camel@mhfsdcap03>
References: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
 <55DB4609.5040904@arm.com>
 <CAGS+omBnoitju07KQ1Y7JHTbce6+DO4WqWHTaKz5D+T157zEJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGS+omBnoitju07KQ1Y7JHTbce6+DO4WqWHTaKz5D+T157zEJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2015-09-02 at 14:02 +0800, Daniel Kurtz wrote:
> Hi maoguang,
> 
> On Tue, Aug 25, 2015 at 12:27 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> >
> >
> > On 14/08/15 09:38, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> >>
> >> From: Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>
> >> This patch implement irq_set_wake to get who is wakeup source and
> >> setup on suspend resume.
> >>
> >> Signed-off-by: Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>
> [snip]
> 
> Can you please respond to Sudeep's questions:
> 
> > Does this pinmux controller:
> >
> > 1. Support wake-up configuration ? If not, you need to use
> >    IRQCHIP_SKIP_SET_WAKE. I don't see any value in writing the
> >    mask_{set,clear} if the same registers are used for {en,dis}able

  YES.
  we can call enable_irq_wake(irq) to config this irq as a wake-up
source.

> >
> > 2. Is in always on domain ? If not, you need save/restore only to
> >    resume back the functionality. Generally we can set
> >    IRQCHIP_MASK_ON_SUSPEND to ensure non-wake-up interrupts are
> >    disabled during suspend and re-enabled in resume path. You just
> >    save/restore raw values without tracking the wake-up source.

  YES.

> >
> > Also I see that no care is taken to set the port irq as wake enable
> > source. It may work with current mainline, but won't with -next. Please
> > ensure the port irq to the parent interrupt controller remains
> > enabled(i.e set as wake).

As you know, we do not care the port irq as wake enbale source,
when enter suspend we think no matter what the port irq is
enabled/disabled which are not affected as a wake-up source,
Because eint has a line to receive SPM.

For example,after suspend,press power key(use eint5) will generate an
electrical signal which is send to spm by eint.
and then spm wake cpu.
  
> >
> > Regards,
> > Sudeep

Regards,
Maoguang
