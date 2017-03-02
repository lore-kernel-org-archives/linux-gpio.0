From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH fixes v3] pinctrl: Really force states during suspend/resume
Date: Thu, 2 Mar 2017 10:54:44 +0200
Message-ID: <CAHp75VdWVq3E3qrgtvvJK=A4yxK+yM_q3ZJd1hNnFBTj-H4Mxw@mail.gmail.com>
References: <20170301183257.6554-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170301183257.6554-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, swarren@nvidia.com, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 1, 2017 at 8:32 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> In case a platform only defaults a "default" set of pins, but not a
> "sleep" set of pins, and this particular platform suspends and resumes
> in a way that the pin states are not preserved by the hardware, when we
> resume, we would call pinctrl_single_resume() -> pinctrl_force_default()
> -> pinctrl_select_state() and the first thing we do is check that the
> pins state is the same as before, and do nothing.
>
> In order to fix this, decouple the actual state change from
> pinctrl_select_state() and move it pinctrl_commit_state(), while keeping
> the p->state == state check in pinctrl_select_state() not to change the
> caller assumptions. pinctrl_force_sleep() and pinctrl_force_default()
> are updated to bypass the state check by calling pinctrl_commit_state().
>
> Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per device")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

This change is indeed beautiful and clean.

FWIW:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> ---
> Changes in v3:
>
> - move the state check to pinctrl_select_state
>
> Changes in v2:
>
> - rename __pinctrl_select_state to pinctrl_commit_state
>
>  drivers/pinctrl/core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index fb38e208f32d..735d8f7f9d71 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -992,19 +992,16 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
>  EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
>
>  /**
> - * pinctrl_select_state() - select/activate/program a pinctrl state to HW
> + * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
>   * @p: the pinctrl handle for the device that requests configuration
>   * @state: the state handle to select/activate/program
>   */
> -int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
> +static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>  {
>         struct pinctrl_setting *setting, *setting2;
>         struct pinctrl_state *old_state = p->state;
>         int ret;
>
> -       if (p->state == state)
> -               return 0;
> -
>         if (p->state) {
>                 /*
>                  * For each pinmux setting in the old state, forget SW's record
> @@ -1068,6 +1065,19 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
>
>         return ret;
>  }
> +
> +/**
> + * pinctrl_select_state() - select/activate/program a pinctrl state to HW
> + * @p: the pinctrl handle for the device that requests configuration
> + * @state: the state handle to select/activate/program
> + */
> +int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
> +{
> +       if (p->state == state)
> +               return 0;
> +
> +       return pinctrl_commit_state(p, state);
> +}
>  EXPORT_SYMBOL_GPL(pinctrl_select_state);
>
>  static void devm_pinctrl_release(struct device *dev, void *res)
> @@ -1236,7 +1246,7 @@ void pinctrl_unregister_map(struct pinctrl_map const *map)
>  int pinctrl_force_sleep(struct pinctrl_dev *pctldev)
>  {
>         if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_sleep))
> -               return pinctrl_select_state(pctldev->p, pctldev->hog_sleep);
> +               return pinctrl_commit_state(pctldev->p, pctldev->hog_sleep);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
> @@ -1248,7 +1258,7 @@ EXPORT_SYMBOL_GPL(pinctrl_force_sleep);
>  int pinctrl_force_default(struct pinctrl_dev *pctldev)
>  {
>         if (!IS_ERR(pctldev->p) && !IS_ERR(pctldev->hog_default))
> -               return pinctrl_select_state(pctldev->p, pctldev->hog_default);
> +               return pinctrl_commit_state(pctldev->p, pctldev->hog_default);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(pinctrl_force_default);
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
