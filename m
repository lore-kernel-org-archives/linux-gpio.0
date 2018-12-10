From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH] pinctrl: msm: mark PM functions as __maybe_unused
Date: Mon, 10 Dec 2018 13:26:14 -0800
Message-ID: <CAE=gft43eL--acrZ18cRhKcDLJ7u2nVeOOYreS30yBYk7q7=uw@mail.gmail.com>
References: <20181210205955.3254660-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210205955.3254660-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de
Cc: bjorn.andersson@linaro.org, linus.walleij@linaro.org, swboyd@chromium.org, timur@codeaurora.org, dianders@chromium.org, ricardo.ribalda@gmail.com, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 10, 2018 at 1:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Without CONFIG_PM_SLEEP, we get annoyting warnings about unused functions:
>
> drivers/pinctrl/qcom/pinctrl-msm.c:1082:12: error: 'msm_pinctrl_resume' defined but not used [-Werror=unused-function]
>  static int msm_pinctrl_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:1075:12: error: 'msm_pinctrl_suspend' defined but not used [-Werror=unused-function]
>  static int msm_pinctrl_suspend(struct device *dev)
>
> Mark them as __maybe_unused to shut up the warning and silently drop
> the functions without having to add ugly #ifdefs.
>
> Fixes: 977d057ad346 ("pinctrl: msm: Add sleep pinctrl state transitions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 87cbebe217fd..ee8119879c4c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1072,14 +1072,14 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
>                 }
>  }
>
> -static int msm_pinctrl_suspend(struct device *dev)
> +static __maybe_unused int msm_pinctrl_suspend(struct device *dev)
>  {
>         struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
>
>         return pinctrl_force_sleep(pctrl->pctrl);
>  }
>
> -static int msm_pinctrl_resume(struct device *dev)
> +static __maybe_unused int msm_pinctrl_resume(struct device *dev)
>  {
>         struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
>

Thanks Arnd.

Reviewed-by: Evan Green <evgreen@chromium.org>
