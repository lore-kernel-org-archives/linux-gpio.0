From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: correct debounce time unit in
 mtk_gpio_set_debounce
Date: Fri, 1 Apr 2016 22:34:42 +0800
Message-ID: <1459521282.27150.3.camel@mtksdaap41>
References: <1459518711-61619-1-git-send-email-yingjoe.chen@mediatek.com>
	 <CAGS+omA=xbZH04nkVddVi77xvNznjx36_rHJHhAHBLejuxZqgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGS+omA=xbZH04nkVddVi77xvNznjx36_rHJHhAHBLejuxZqgA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>
List-Id: linux-gpio@vger.kernel.org


Daniel,

Thanks for your review.

On Fri, 2016-04-01 at 22:28 +0800, Daniel Kurtz wrote:
> Hi Yingjoe,
> 
> On Fri, Apr 1, 2016 at 9:51 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> > The debounce time unit for gpio_chip.set_debounce is us but
> > mtk_gpio_set_debounce regard it as ms.
> > Fix this by correct debounce time array dbnc_arr so it can find correct
> > debounce setting.
> 
> This patch also changes the first entry to 500 usec.  At least mention why.
> 

OK. Will add this:

Debounce time for first debounce setting is 500us, correct this as well.

While I'm at it, also change the debounce time array name to
"debounce_time" for readability.


> >
> > Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > index 2bbe6f7..be72325 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > @@ -1004,7 +1004,8 @@ static int mtk_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
> >         struct mtk_pinctrl *pctl = dev_get_drvdata(chip->parent);
> >         int eint_num, virq, eint_offset;
> >         unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask, dbnc;
> > -       static const unsigned int dbnc_arr[] = {0 , 1, 16, 32, 64, 128, 256};
> > +       static const unsigned int dbnc_arr[] = {500, 1000, 16000, 32000, 64000,
> > +                                               128000, 256000};
> 
> While you are at it, can you please rename this to something more
> readable than "dbnc"?


Will change to debounce_time.

Joe.C
