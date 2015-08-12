From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: mediatek: Fix multiple registeration issue.
Date: Wed, 12 Aug 2015 12:19:59 -0700
Message-ID: <1439407199.38706.3.camel@mussux00.eus.mediatek.inc>
References: <1439268571-10895-1-git-send-email-hongzhou.yang@mediatek.com>
 <CAGS+omAE2AXpwnYtvetcjvP_6jUbE2HDuPfKfy=aLook2M-8LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGS+omAE2AXpwnYtvetcjvP_6jUbE2HDuPfKfy=aLook2M-8LQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2015-08-11 at 15:45 +0800, Daniel Kurtz wrote:
> On Tue, Aug 11, 2015 at 12:49 PM, Hongzhou Yang
> <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Use dynamic allocation to fix multiple registeration issue.
> 
> s/registeration/registration   - here and in the patch subject.
> 
> >
> > --------------8<--------------------
> 
> I don't think this is required.
> 
> > Since our common driver need support main chip and PMU
> > at the same time, that means it will register two
> > pinctrl device, and the pinctrl_desc structure should
> > be used two times.
> >
> > But pinctrl_desc use global static definition, then
> > the latest registered pinctrl device will overwrite
> > the old one's, all members in pinctrl_desc will set to
> > the new one's, such as name, pins and pins numbers, etc.
> > This is a bug. Changing to use devm_kzalloc to fix it.
> >
> > Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v4.1+
> > Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   27 +++++++++++++++----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > index ad1ea16..2bba504 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > @@ -1202,17 +1202,12 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > -static struct pinctrl_desc mtk_pctrl_desc = {
> > -       .confops        = &mtk_pconf_ops,
> > -       .pctlops        = &mtk_pctrl_ops,
> > -       .pmxops         = &mtk_pmx_ops,
> > -};
> > -
> >  int mtk_pctrl_init(struct platform_device *pdev,
> >                 const struct mtk_pinctrl_devdata *data,
> >                 struct regmap *regmap)
> >  {
> >         struct pinctrl_pin_desc *pins;
> > +       struct pinctrl_desc *mtk_pctrl_desc;
> >         struct mtk_pinctrl *pctl;
> >         struct device_node *np = pdev->dev.of_node, *node;
> >         struct property *prop;
> > @@ -1265,12 +1260,22 @@ int mtk_pctrl_init(struct platform_device *pdev,
> >
> >         for (i = 0; i < pctl->devdata->npins; i++)
> >                 pins[i] = pctl->devdata->pins[i].pin;
> > -       mtk_pctrl_desc.name = dev_name(&pdev->dev);
> > -       mtk_pctrl_desc.owner = THIS_MODULE;
> > -       mtk_pctrl_desc.pins = pins;
> > -       mtk_pctrl_desc.npins = pctl->devdata->npins;
> > +
> > +       mtk_pctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*mtk_pctrl_desc),
> > +                               GFP_KERNEL);
> > +       if (!mtk_pctrl_desc)
> > +               return -ENOMEM;
> 
> Just embed a struct pinctrl_desc in your struct mtk_pinctrl.
> 
> Best Regards,
> -Dan

Ok, I will send another patch to fix them, thank you.

Yours,
Hongzhou
