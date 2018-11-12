From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH] pinctrl: msm: Add sleep pinctrl state transitions
Date: Mon, 12 Nov 2018 10:26:48 -0800
Message-ID: <CAE=gft5EvmFUtJOUXaSLiK=Y=Kx-J7d825OjRg3OmZ7A_k8tYA@mail.gmail.com>
References: <20181109222835.60607-1-evgreen@chromium.org> <20181110072045.GB4373@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181110072045.GB4373@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 9, 2018 at 11:20 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 09 Nov 14:28 PST 2018, Evan Green wrote:
>
> > Add PM suspend callbacks to the msm core driver that select the
> > sleep and default pinctrl states. Then wire those callbacks up
> > in the sdm845 driver, for those boards that may have GPIO hogs
> > that need to change state during suspend.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> >
> >  drivers/pinctrl/qcom/pinctrl-msm.c    | 16 ++++++++++++++++
> >  drivers/pinctrl/qcom/pinctrl-msm.h    |  2 ++
> >  drivers/pinctrl/qcom/pinctrl-sdm845.c |  4 ++++
> >  3 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 7c7d083e2c0dc..d505d0a50f0a5 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -1072,6 +1072,22 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
> >               }
> >  }
> >
> > +int msm_pinctrl_suspend(struct device *dev)
> > +{
> > +     struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
> > +
> > +     return pinctrl_force_sleep(pctrl->pctrl);
> > +}
> > +EXPORT_SYMBOL(msm_pinctrl_suspend);
> > +
> > +int msm_pinctrl_resume(struct device *dev)
> > +{
> > +     struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
> > +
> > +     return pinctrl_force_default(pctrl->pctrl);
> > +}
> > +EXPORT_SYMBOL(msm_pinctrl_resume);
> > +
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data)
> >  {
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> > index 29172fdf5882c..e163ca600ecd3 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> > @@ -123,6 +123,8 @@ struct msm_pinctrl_soc_data {
> >       unsigned int ntiles;
> >  };
> >
> > +int msm_pinctrl_suspend(struct device *dev);
> > +int msm_pinctrl_resume(struct device *dev);
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data);
> >  int msm_pinctrl_remove(struct platform_device *pdev);
> > diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> > index 2ab7a88857579..a3ac9cbeabad1 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> > @@ -1287,6 +1287,9 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
> >       .ngpios = 150,
> >  };
> >
> > +static SIMPLE_DEV_PM_OPS(sdm845_pinctrl_dev_pm_ops, msm_pinctrl_suspend,
> > +                      msm_pinctrl_resume);
>
> I don't expect this to differ between the various platforms, so how
> about moving it to pinctrl-msm?

Sounds good! Will spin.
