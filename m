From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: intel-mid: Fix build warning when !CONFIG_PM
Date: Mon, 16 Jan 2017 16:59:38 +0200
Message-ID: <CAHp75VcG5GVJp4cYbhcHaBMpn2p_dhMBcwPFt41Rb9=tO2inuw@mail.gmail.com>
References: <1484577077-13418-1-git-send-email-augustocaringi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35844 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbdAPO7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2017 09:59:39 -0500
In-Reply-To: <1484577077-13418-1-git-send-email-augustocaringi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Augusto Mecking Caringi <augustocaringi@gmail.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 16, 2017 at 4:30 PM, Augusto Mecking Caringi
<augustocaringi@gmail.com> wrote:
> The only usage of function intel_gpio_runtime_idle() is here (in the
> same file):
>
> static const struct dev_pm_ops intel_gpio_pm_ops =3D {
>         SET_RUNTIME_PM_OPS(NULL, NULL, intel_gpio_runtime_idle)
> };
>
> And when CONFIG_PM is not set, the macro SET_RUNTIME_PM_OPS expands to
> nothing, causing the following compiler warning:
>
> drivers/gpio/gpio-intel-mid.c:324:12: warning: =E2=80=98intel_gpio_runtim=
e_idle=E2=80=99
> defined but not used [-Wunused-function]
> static int intel_gpio_runtime_idle(struct device *dev)
>
> Fix it by annotating the function with __maybe_unused.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Augusto Mecking Caringi <augustocaringi@gmail.com>
> ---
>  drivers/gpio/gpio-intel-mid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.=
c
> index a1e44c2..b76ecee 100644
> --- a/drivers/gpio/gpio-intel-mid.c
> +++ b/drivers/gpio/gpio-intel-mid.c
> @@ -321,7 +321,7 @@ static void intel_mid_irq_init_hw(struct intel_mid_gp=
io *priv)
>         }
>  }
>
> -static int intel_gpio_runtime_idle(struct device *dev)
> +static int __maybe_unused intel_gpio_runtime_idle(struct device *dev)
>  {
>         int err =3D pm_schedule_suspend(dev, 500);
>         return err ?: -EBUSY;
> --
> 2.7.4
>



--=20
With Best Regards,
Andy Shevchenko
