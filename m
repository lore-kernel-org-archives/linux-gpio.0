From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2] gpio: mxc: add power management support
Date: Tue, 17 Jul 2018 10:52:03 -0300
Message-ID: <CAOMZO5D9MBOwQtKVqSD8XUtDBf9RH5+soV2jreBYHZrXzLWm6A@mail.gmail.com>
References: <1531721186-19417-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531721186-19417-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Anson,

[Next time please put the i.mx maintainers on Cc]

On Mon, Jul 16, 2018 at 3:06 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> GPIO registers could lose context on i.MX7D,
> when enter LPSR mode, the whole SoC will be
> powered off except LPSR domain, GPIO banks
> will lose context in this case, need to restore
> the context after resume from LPSR mode.
>
> This patch adds GPIO save/restore for those necessary
> registers, and put the save/restore operations in noirq
> suspend/resume phase, since GPIO is fundamental module
> which could be used by other peripherals' resume phase.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

>  static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
> @@ -434,6 +445,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> +       if (of_machine_is_compatible("fsl,imx7d"))
> +               port->support_power_off = true;

This does not scale well as we need to support mx8 soon.

Like I replied in my last message the best solution here is to add a
"fsl,imx7d-gpio" compatible entry in this driver.

Then you can set a flag in the "fsl,imx7d-gpio" case to handle the
'power_off' feature.

With this method there will be no need to touch this driver again for
adding mx8 support.
