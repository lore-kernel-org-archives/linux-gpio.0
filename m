From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH] gpio: sprd: Add missing break in switch statement
Date: Tue, 12 Feb 2019 10:07:26 +0800
Message-ID: <CAMz4kuLm66+h_Mo45sTZ1et_wGqDBEv2RRLMU_c+Xip1TEVM-w@mail.gmail.com>
References: <20190211185001.GA19472@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211185001.GA19472@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Hi Gustavo,

On Tue, 12 Feb 2019 at 02:50, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Fix the following warning by adding a missing break:
>
> drivers/gpio/gpio-eic-sprd.c: In function =E2=80=98sprd_eic_irq_set_type=
=E2=80=99:
> drivers/gpio/gpio-eic-sprd.c:403:3: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
>    switch (flow_type) {
>    ^~~~~~
> drivers/gpio/gpio-eic-sprd.c:435:2: note: here
>   default:
>   ^~~~~~~
>
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Thanks for fixing my mistake.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  drivers/gpio/gpio-eic-sprd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index e41223c05f6e..f0223cee9774 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
> @@ -432,6 +432,7 @@ static int sprd_eic_irq_set_type(struct irq_data *dat=
a, unsigned int flow_type)
>                 default:
>                         return -ENOTSUPP;
>                 }
> +               break;
>         default:
>                 dev_err(chip->parent, "Unsupported EIC type.\n");
>                 return -ENOTSUPP;
> --
> 2.20.1
>


--=20
Baolin Wang
Best Regards
