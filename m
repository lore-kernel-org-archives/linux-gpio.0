From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH] gpio: dwapb: fix missing first irq for edgeboth irq
 type
Date: Mon, 12 Jun 2017 13:05:30 +0800
Message-ID: <20170612130530.724305b5@xhacker>
References: <20170601232715.2788-1-xgchenshy@gmail.com>
        <CACRpkdbnXOab-wn3z9BQrs7RVrqag8wtdwsmUvekYLY29rxdVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:38870 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752002AbdFLFKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Jun 2017 01:10:19 -0400
In-Reply-To: <CACRpkdbnXOab-wn3z9BQrs7RVrqag8wtdwsmUvekYLY29rxdVw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: xgchenshy@gmail.com, Hoan Tran <hotran@apm.com>, Jiang Qiu <qiujiang@huawei.com>, Jamie Iles <jamie@jamieiles.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, 9 Jun 2017 11:26:19 +0200 Linus Walleij wrote:

> 
> On Fri, Jun 2, 2017 at 1:27 AM,  <xgchenshy@gmail.com> wrote:
> > From: Xiaoguang Chen <xgchenshy@gmail.com>
> >
> > dwapb_irq_set_type overwrites polarity register value for
> > IRQ_TYPE_EDGE_BOTH case. If the polarity of one gpio is 0
> > by default, then it will set falling edge irq trigger.
> > and the gpio may requires rising edge irq for the first time,
> > and it will be missed.
> >
> > Do not overwrite polarity register for IRQ_TYPE_EDGE_BOTH case
> > can solve this issue.

I think this is a correct fix.

> >
> > Signed-off-by: Xiaoguang Chen <xgchenshy@gmail.com>

Tested-by: Jisheng Zhang <jszhang@marvell.com>

> > ---
> >  drivers/gpio/gpio-dwapb.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> > index f051c45..80913e4 100644
> > --- a/drivers/gpio/gpio-dwapb.c
> > +++ b/drivers/gpio/gpio-dwapb.c
> > @@ -288,7 +288,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
> >         irq_setup_alt_chip(d, type);
> >
> >         dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
> > -       dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
> > +       if （type != IRQ_TYPE_EDGE_BOTH）
> > +               dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
> >         spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> >
> >         return 0;
> > --
> > 2.8.4 (Apple Git-73)
> >  

