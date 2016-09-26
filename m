From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: fix masking of pinmux functions
Date: Mon, 26 Sep 2016 08:52:09 -0700
Message-ID: <20160926155209.GC7509@tuxbot>
References: <1473673015-33124-1-git-send-email-john@phrozen.org>
 <CAJOFmgx3Y01DZvUU=wF68HLWRrUoiHAcOYtVjw6LsqvE3+Ds8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:34986 "EHLO
        mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941324AbcIZPwN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2016 11:52:13 -0400
Received: by mail-pa0-f43.google.com with SMTP id oz2so64269067pac.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2016 08:52:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAJOFmgx3Y01DZvUU=wF68HLWRrUoiHAcOYtVjw6LsqvE3+Ds8w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun 25 Sep 23:36 PDT 2016, Stephen Boyd wrote:

> On Mon, Sep 12, 2016 at 2:36 AM, John Crispin <john@phrozen.org> wrote:
> > The following commit introduced a regression by not properly masking the
> > calculated value.
> >
> > commit 47a01ee9a6c39fe1 ("pinctrl: qcom: Clear all function selection bits")

Please use the format: Fixes: %h (\"%s\")

> >
> > Signed-off-by: John Crispin <john@phrozen.org>
> 
> Now I'm confused how it ever worked.... but agreed, the code looks wrong.

I agree, we should have seen some issues based on this, I presume we
where "lucky".

> 
> Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Linus, the corrected patch appeared in v4.8-rc1, would you mind
including this in a pull for v4.8?

Regards,
Bjorn

> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 51c42d7..775c883 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -156,7 +156,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >         spin_lock_irqsave(&pctrl->lock, flags);
> >
> >         val = readl(pctrl->regs + g->ctl_reg);
> > -       val &= mask;
> > +       val &= ~mask;
> >         val |= i << g->mux_bit;
> >         writel(val, pctrl->regs + g->ctl_reg);
> >
