From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl:Convert the composition of
 devm_request_mem_region and devm_ioremap to a single call
Date: Thu, 3 Dec 2015 13:44:16 -0800
Message-ID: <20151203214415.GC23396@atomide.com>
References: <1446191478-22714-1-git-send-email-sanjeev_sharma@mentor.com>
 <CACRpkdZFhseQDbXvJg1CP3+WRsw_dPivx0w8730-9FV3fwjUGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZFhseQDbXvJg1CP3+WRsw_dPivx0w8730-9FV3fwjUGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sanjeev Sharma <sanjeev_sharma@mentor.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [151030 12:54]:
> Please run posts like this by the maintainers. Tony Lindgren is one
> user, Haojian is another.

I think we need to add ourselves to MAINTAINERS for this driver,
otherwise we'll keep on missing emails.

> On Fri, Oct 30, 2015 at 8:51 AM, Sanjeev Sharma
> <sanjeev_sharma@mentor.com> wrote:
> > Use devm_ioremap_resource() in order to make the code simpler,
> > and remove redundant return value check of platform_get_resource()
> > because this value is alreadytaken care by devm_ioremap_resource()
> >
> > Signed-off-by: Sanjeev Sharma <sanjeev_sharma@mentor.com>
> > ---
> >  drivers/pinctrl/pinctrl-single.c | 21 +++------------------
> >  1 file changed, 3 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> > index ef04b96..905cc0a 100644
> > --- a/drivers/pinctrl/pinctrl-single.c
> > +++ b/drivers/pinctrl/pinctrl-single.c
> > @@ -1865,24 +1865,9 @@ static int pcs_probe(struct platform_device *pdev)
> >                                                   "pinctrl-single,bit-per-mux");
> >
> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -       if (!res) {
> > -               dev_err(pcs->dev, "could not get resource\n");
> > -               return -ENODEV;
> > -       }
> > -
> > -       pcs->res = devm_request_mem_region(pcs->dev, res->start,
> > -                       resource_size(res), DRIVER_NAME);
> > -       if (!pcs->res) {
> > -               dev_err(pcs->dev, "could not get mem_region\n");
> > -               return -EBUSY;
> > -       }
> > -
> > -       pcs->size = resource_size(pcs->res);
> > -       pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
> > -       if (!pcs->base) {
> > -               dev_err(pcs->dev, "could not ioremap\n");
> > -               return -ENODEV;
> > -       }
> > +       pcs->base = devm_ioremap_resource(pcs->dev, res);
> > +       if (IS_ERR(pcs->base))
> > +               return PTR_ERR(pcs->base);
> >
> >         INIT_RADIX_TREE(&pcs->pgtree, GFP_KERNEL);
> >         INIT_RADIX_TREE(&pcs->ftree, GFP_KERNEL);

This won't work, we're using the physical address from pcs->res in the
code at least in pcs_add_pin.

Regards,

Tony
