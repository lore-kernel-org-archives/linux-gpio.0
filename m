From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] pinctrl: msm: Add sleep pinctrl state transitions
Date: Fri, 09 Nov 2018 16:02:48 -0800
Message-ID: <154180816857.88331.11328422006723958300@swboyd.mtv.corp.google.com>
References: <20181109222835.60607-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109222835.60607-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Evan Green <evgreen@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Evan Green (2018-11-09 14:28:35)
> Add PM suspend callbacks to the msm core driver that select the
> sleep and default pinctrl states. Then wire those callbacks up
> in the sdm845 driver, for those boards that may have GPIO hogs
> that need to change state during suspend.
> =

> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> =

>  drivers/pinctrl/qcom/pinctrl-msm.c    | 16 ++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h    |  2 ++
>  drivers/pinctrl/qcom/pinctrl-sdm845.c |  4 ++++
>  3 files changed, 22 insertions(+)
> =

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 7c7d083e2c0dc..d505d0a50f0a5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1072,6 +1072,22 @@ static void msm_pinctrl_setup_pm_reset(struct msm_=
pinctrl *pctrl)
>                 }
>  }
>  =

> +int msm_pinctrl_suspend(struct device *dev)
> +{
> +       struct msm_pinctrl *pctrl =3D dev_get_drvdata(dev);
> +
> +       return pinctrl_force_sleep(pctrl->pctrl);
> +}
> +EXPORT_SYMBOL(msm_pinctrl_suspend);
> +
> +int msm_pinctrl_resume(struct device *dev)
> +{
> +       struct msm_pinctrl *pctrl =3D dev_get_drvdata(dev);
> +
> +       return pinctrl_force_default(pctrl->pctrl);
> +}
> +EXPORT_SYMBOL(msm_pinctrl_resume);

It's too bad this can't be installed by default into the driver somehow
so we don't have to repeat this for each device driver. O well!
