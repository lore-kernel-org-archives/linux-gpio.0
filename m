From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] gpio: mxc: add power management support
Date: Fri, 13 Jul 2018 15:33:34 -0300
Message-ID: <CAOMZO5BSt4jdLWmXjNmTDAegGwtRWjbMuVAwdrnRyHWvSBuU5A@mail.gmail.com>
References: <1531208921-23342-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531208921-23342-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi Anson,

On Tue, Jul 10, 2018 at 4:48 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> GPIO registers could lose context on some i.MX SoCs,
> like on i.MX7D, when enter LPSR mode, the whole SoC

After further reviewing this patchI have a question: here you say that
i.MX7D needs to save some registers.

> will be powered off except LPSR domain, GPIO banks
> will lose context in this case, need to restore
> the context after resume from LPSR mode.
>
> This patch adds GPIO save/restore for those necessary
> registers, and put the save/restore operations in noirq
> suspend/resume phase, since GPIO is fundamental module
> which could be used by other peripherals' resume phase.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 2f28299..0fc52d8 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -45,6 +45,15 @@ struct mxc_gpio_hwdata {
>         unsigned fall_edge;
>  };
>
> +struct mxc_gpio_reg_saved {
> +       u32 icr1;
> +       u32 icr2;
> +       u32 imr;
> +       u32 gdir;
> +       u32 edge_sel;
> +       u32 dr;
> +};
> +
>  struct mxc_gpio_port {
>         struct list_head node;
>         void __iomem *base;
> @@ -55,6 +64,7 @@ struct mxc_gpio_port {
>         struct gpio_chip gc;
>         struct device *dev;
>         u32 both_edges;
> +       struct mxc_gpio_reg_saved gpio_saved_reg;
>  };
>
>  static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
> @@ -497,6 +507,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>
>         list_add_tail(&port->node, &mxc_gpio_ports);
>
> +       platform_set_drvdata(pdev, port);
> +
>         return 0;
>
>  out_irqdomain_remove:
> @@ -507,11 +519,67 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>         return err;
>  }
>
> +static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
> +{
> +       if (mxc_gpio_hwtype == IMX21_GPIO)
> +               return;

but here you only block IMX21_GPIO.

This means that mx31/mx35/mx51/mx53/mx6 will execute this code too
now. Is this always safe?

Shouldn't it this save/restore be executed only on mx7d?

Please clarify.
