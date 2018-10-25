From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH V2 4/8] gpio: vf610: add optional clock support
Date: Thu, 25 Oct 2018 19:58:47 +0200
Message-ID: <c023948f3baee96cb186f970fdb71ebd@agner.ch>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-5-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540295058-26090-5-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: dongas86@gmail.com, Linus Walleij <linus.walleij@linaro.org>, linux@armlinux.org.uk, linux-gpio@vger.kernel.org, robh+dt@kernel.org, dl-linux-imx <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 23.10.2018 13:49, A.s. Dong wrote:
> Some SoCs need the gpio clock to be enabled before accessing
> HW registers. This patch add the optional clock handling.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v1->v2:
>  * new patch
> ---
>  drivers/gpio/gpio-vf610.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index d4ad6d0..cbc4f44 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -16,6 +16,7 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/gpio.h>
>  #include <linux/init.h>
> @@ -256,6 +257,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> +	struct clk *clk_gpio, *clk_port;
>  	struct vf610_gpio_port *port;
>  	struct resource *iores;
>  	struct gpio_chip *gc;
> @@ -280,6 +282,24 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>  	if (port->irq < 0)
>  		return port->irq;
>  
> +	clk_gpio = devm_clk_get(&pdev->dev, "gpio");
> +	clk_port = devm_clk_get(&pdev->dev, "port");

Are you sure that those are two independent clocks? On i.MX 7 usually
there was a single clock gate controlling multiple clocks at once (which
should be modeled as a single clock gate in the clock tree).

--
Stefan 

> +	if ((PTR_ERR(clk_gpio) == -EPROBE_DEFER) ||
> +	    (PTR_ERR(clk_port) == -EPROBE_DEFER)) {
> +		return -EPROBE_DEFER;
> +	} else if (!IS_ERR_OR_NULL(clk_gpio) &&
> +		   !IS_ERR_OR_NULL(clk_port)) {
> +		ret = clk_prepare_enable(clk_gpio);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_prepare_enable(clk_port);
> +		if (ret) {
> +			clk_disable_unprepare(clk_gpio);
> +			return ret;
> +		}
> +	}
> +
>  	gc = &port->gc;
>  	gc->of_node = np;
>  	gc->parent = dev;
