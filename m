From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1 3/3] pinctrl: qcom: spmi-gpio: Correct power_source
 range check
Date: Tue, 20 Jun 2017 11:33:04 +0200
Message-ID: <CACRpkdY7CsP_hFq3p4tzzMxU0rykrwKu_EmWJ2KBqEU=Rz0KZw@mail.gmail.com>
References: <20170613061707.13892-1-fenglinw@codeaurora.org> <20170613061707.13892-4-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613061707.13892-4-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 13, 2017 at 8:16 AM,  <fenglinw@codeaurora.org> wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
>
> Power source selection in DIG_VIN_CTL is indexed from 0, in the range
> check it shouldn't be equal to the total number of power sources.
>
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index 581309d..1fd677c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -500,7 +500,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *p=
ctldev, unsigned int pin,
>                         pad->is_enabled =3D false;
>                         break;
>                 case PIN_CONFIG_POWER_SOURCE:
> -                       if (arg > pad->num_sources)
> +                       if (arg >=3D pad->num_sources)
>                                 return -EINVAL;
>                         pad->power_source =3D arg;
>                         break;

Bj=C3=B6rn can you ACK this?

Yours,
Linus Walleij
