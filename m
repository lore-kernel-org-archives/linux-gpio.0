From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 04/10] gpio: vf610: add optional clock support
Date: Fri, 2 Nov 2018 10:32:37 +0100
Message-ID: <CACRpkda2XUXBCvb5mYgDrYtCL8dA24uQXaBrHrMLH4PFNdq_MQ@mail.gmail.com>
References: <1540996688-23681-1-git-send-email-aisheng.dong@nxp.com>
 <1540996688-23681-5-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540996688-23681-5-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Dong Aisheng <dongas86@gmail.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 31, 2018 at 3:43 PM A.s. Dong <aisheng.dong@nxp.com> wrote:

> +       clk_port = devm_clk_get(&pdev->dev, "port");
> +       if (clk_port == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       clk_gpio = devm_clk_get(&pdev->dev, "gpio");
> +       if (clk_gpio == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       if (!IS_ERR_OR_NULL(clk_port)) {
> +               ret = clk_prepare_enable(clk_port);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (!IS_ERR_OR_NULL(clk_gpio)) {
> +               ret = clk_prepare_enable(clk_gpio);
> +               if (ret) {
> +                       clk_disable_unprepare(clk_port);
> +                       return ret;
> +               }
> +       }

I think IS_ERR_OR_NULL() is considered harmful among other
things.

What about this pattern:

        clk = devm_clk_get(dev, "foo");
        if (!IS_ERR(clk)) {
                ret = clk_prepare_enable(clk);
                if (ret)
                        return ret;
        } else if (PTR_ERR(clk) == -EPROBE_DEFER) {
                /*
                 * Percolate deferrals, for anything else,
                 * just live without the clocking.
                 */
                return PTR_ERR(clk);
        }

You also need to introduce code to disable the clock on
.remove() or the clock will always be on after this module
has probed. This applies also to builtin drivers, unless
you suppress the sysfs attributes and use
platform_driver_probe()

Yours,
Linus Walleij
