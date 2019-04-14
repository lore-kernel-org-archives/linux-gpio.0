From: Sean Wang <sean.wang-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] pinctrl: Add alternative way for specifying register
 bases
Date: Sun, 14 Apr 2019 16:01:39 -0700
Message-ID: <CAGp9LzpVRMbf3uWp8rAeM29dDqF6z5rG62rFXsrhyGCczkNBmA@mail.gmail.com>
References: <1555038945-10245-1-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1555038945-10245-1-git-send-email-light.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Light Hsieh <light.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi, Light

On Thu, Apr 11, 2019 at 8:15 PM Light Hsieh <light.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> The orginal PINCTRL_MTK_PARIS/PINCTRL_MTK_MOORE need more effort for
> specifying register bases when porting platform driver:
> 1. Write mtXXXX_pinctrl_register_base_name[] array in pinctrl-mtXXXX.c
>    to specify names of register bases, for exmaple:
>
>         static const char * const mt6765_pinctrl_register_base_names[] = {
>                 "iocfg0", "iocfg1", "iocfg2", "iocfg3", "iocfg4", "iocfg5",
>                 "iocfg6", "iocfg7",
>         };
> 2. Write reg = <...>, ..., <...>; in mtXXXX.dts to specify register
>    bases. Each member of reg contain address range cloned from
>    pre-generated devicetree node.
> 3. Write reg-names = "...", ..., "..."; in mtXXXX.dts to specify
>    names of register bases. The sequence of names in reg-names shall match
>    sequence of names that specified in pinctrl-mtXXXX.c.
>    Besides, the seqeunce of names in reg-names shall also match sequence of
>    address range in reg, for exmaple:
>
>         pio: pinctrl {
>                 compatible = "mediatek,mt6765-pinctrl";
>                 reg = <0 0x10005000 0 0x1000>,
>                       <0 0x10002C00 0 0x200>,
>                       <0 0x10002800 0 0x200>,
>                       <0 0x10002A00 0 0x200>,
>                       <0 0x10002000 0 0x200>,
>                       <0 0x10002200 0 0x200>,
>                       <0 0x10002400 0 0x200>,
>                       <0 0x10002600 0 0x200>,
>                       <0 0x1000b000 0 0x1000>;
>                 reg-names = "iocfg0", "iocfg1", "iocfg2", "iocfg3",
>                             "iocfg4", "iocfg5", "iocfg6", "iocfg7",
>                             "eint";
>
> To reduce porting effort, this patch add an alternative way for specifying
> register bases:
> 1. Write reg_bases = <...>, ..., <...>; and reg_base_eint = <&eint>;
>    in mtXXXX.dtsi where members in reg_bases and &eint are labels for
>    pre-generated devicetree nodes, for example:
>         pio: pinctrl {
>                 compatible = "mediatek,mt6765-pinctrl";
>                 reg_bases = <&gpio0>,
>                             <&iocfg0>,
>                             <&iocfg1>,
>                             <&iocfg2>,
>                             <&iocfg3>,
>                             <&iocfg4>,
>                             <&iocfg5>,
>                             <&iocfg6>,
>                             <&iocfg7>;
>                 reg_base_eint = <&eint>;

reg and reg-names both are generic properties used in all of DT-based
device and driver, described in
Documentation/devicetree/bindings/resource-names.txt, but reg_based
and reg_base_eint aren't.

If these properties are not hardware specific related, I personally
will encourage reusing those generic properties and relevant helpers
because those generic properties handling in the base driver are
almost bug-free, well maintained and even keep be extended in the
future. This way can help driver people put more concentration on
hardware specific stuff in the driver.

>
>    Since this pre-generated nodes had already specify address range,
>    it is not necessary to specify address range again in pinctrl node.
>
> Using this way, porting effort is reduced and therefore typo can occur with
> less chance.
>
> Change-Id: I55f5e328919f4f736ca4b9f8d1593e069f179637
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 19 +++++---
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 62 ++++++++++++++++--------
>  2 files changed, 54 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index b1c3684..16b4863 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/of_irq.h>
> +#include <linux/of_address.h>
>
>  #include "mtk-eint.h"
>  #include "pinctrl-mtk-common-v2.h"
> @@ -310,7 +311,7 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>
>  int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>  {
> -       struct device_node *np = pdev->dev.of_node;
> +       struct device_node *np = pdev->dev.of_node, *node;
>         struct resource *res;
>
>         if (!IS_ENABLED(CONFIG_EINT_MTK))
> @@ -323,13 +324,19 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>         if (!hw->eint)
>                 return -ENOMEM;
>
> -       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
> -       if (!res) {
> -               dev_err(&pdev->dev, "Unable to get eint resource\n");
> -               return -ENODEV;
> +       node = of_parse_phandle(np, "reg_base_eint", 0);
> +       if (node) {
> +               hw->eint->base = of_iomap(node, 0);
> +       } else {
> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                       "eint");
> +               if (!res) {
> +                       dev_err(&pdev->dev, "Unable to get eint resource\n");
> +                       return -ENODEV;
> +               }
> +               hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
>         }
>
> -       hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(hw->eint->base))
>                 return PTR_ERR(hw->eint->base);
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index b59e108..8ddb995 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -9,6 +9,7 @@
>   *        Hongzhou.Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>   */
>
> +#include <linux/of_address.h>
>  #include <linux/gpio/driver.h>
>  #include <dt-bindings/pinctrl/mt65xx.h>
>  #include "pinctrl-paris.h"
> @@ -815,10 +816,11 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
>  int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc)
>  {
> +       struct device_node *np = pdev->dev.of_node, *node;
>         struct pinctrl_pin_desc *pins;
>         struct mtk_pinctrl *hw;
>         struct resource *res;
> -       int err, i;
> +       int err, i, get_base_pass;
>
>         hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
>         if (!hw)
> @@ -828,31 +830,49 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>         hw->soc = soc;
>         hw->dev = &pdev->dev;
>
> -       if (!hw->soc->nbase_names) {
> -               dev_err(&pdev->dev,
> -                       "SoC should be assigned at least one register base\n");
> -               return -EINVAL;
> -       }
> -
> -       hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
> +       if (hw->soc->nbase_names) {
> +               hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
>                                       sizeof(*hw->base), GFP_KERNEL);
> -       if (!hw->base)
> -               return -ENOMEM;
> +               if (!hw->base)
> +                       return -ENOMEM;
> +
> +               for (i = 0; i < hw->soc->nbase_names; i++) {
> +                       res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                                       hw->soc->base_names[i]);
> +                       if (!res) {
> +                               dev_err(&pdev->dev, "missing IO resource\n");
> +                               return -ENXIO;
> +                       }
>
> -       for (i = 0; i < hw->soc->nbase_names; i++) {
> -               res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                                                  hw->soc->base_names[i]);
> -               if (!res) {
> -                       dev_err(&pdev->dev, "missing IO resource\n");
> -                       return -ENXIO;
> +                       hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
> +                       if (IS_ERR(hw->base[i]))
> +                               return PTR_ERR(hw->base[i]);
>                 }
>
> -               hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
> -               if (IS_ERR(hw->base[i]))
> -                       return PTR_ERR(hw->base[i]);
> -       }
> +               hw->nbase = hw->soc->nbase_names;
> +       } else {
> +               for (get_base_pass = 0; get_base_pass < 2; get_base_pass++) {
> +                       for (i = 0;; i++) {
> +                               node = of_parse_phandle(np, "reg_bases", i);
> +                               if (!node)
> +                                       break;
> +                               if (get_base_pass == 1)
> +                                       hw->base[i] = of_iomap(node, 0);
> +                               of_node_put(node);
> +                       }
>
> -       hw->nbase = hw->soc->nbase_names;
> +                       if (i == 0)
> +                               return -EINVAL;
> +                       if (get_base_pass == 0) {
> +                               hw->nbase = i;
> +                               hw->base = devm_kmalloc_array(&pdev->dev, i,
> +                                       sizeof(*hw->base),
> +                                       GFP_KERNEL | __GFP_ZERO);
> +                               if (IS_ERR(hw->base))
> +                                       return PTR_ERR(hw->base);
> +                       }
> +               }
> +       }
>
>         err = mtk_pctrl_build_state(pdev);
>         if (err) {
> --
> 1.8.1.1.dirty
>
