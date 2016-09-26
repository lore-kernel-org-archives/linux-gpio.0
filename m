From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: fix masking of pinmux functions
Date: Sun, 25 Sep 2016 23:36:08 -0700
Message-ID: <CAJOFmgx3Y01DZvUU=wF68HLWRrUoiHAcOYtVjw6LsqvE3+Ds8w@mail.gmail.com>
References: <1473673015-33124-1-git-send-email-john@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473673015-33124-1-git-send-email-john@phrozen.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <john@phrozen.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2016 at 2:36 AM, John Crispin <john@phrozen.org> wrote:
> The following commit introduced a regression by not properly masking the
> calculated value.
>
> commit 47a01ee9a6c39fe1 ("pinctrl: qcom: Clear all function selection bits")
>
> Signed-off-by: John Crispin <john@phrozen.org>

Now I'm confused how it ever worked.... but agreed, the code looks wrong.

Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 51c42d7..775c883 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -156,7 +156,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>         spin_lock_irqsave(&pctrl->lock, flags);
>
>         val = readl(pctrl->regs + g->ctl_reg);
> -       val &= mask;
> +       val &= ~mask;
>         val |= i << g->mux_bit;
>         writel(val, pctrl->regs + g->ctl_reg);
>
