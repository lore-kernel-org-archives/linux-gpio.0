From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Date: Thu, 22 Nov 2018 15:08:33 +0100
Message-ID: <20181122140832.qcrhmmybdzbvfv6s@verge.net.au>
References: <20181119161838.10610-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181119161838.10610-1-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 19, 2018 at 04:18:38PM +0000, Phil Edworthy wrote:
> This fixes the check for unused mdio bus setting and the following static
> checker warning:
>  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
>  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'
> 
> It also fixes the return var when calling of_get_child_count()
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v2:
>  - Don't rely on rely on the implicit typecast from -1 to uint
> ---
>  drivers/pinctrl/pinctrl-rzn1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
> index 57886dcff53d..cc0e5aa9128a 100644
> --- a/drivers/pinctrl/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/pinctrl-rzn1.c
> @@ -112,7 +112,7 @@ struct rzn1_pinctrl {
>  	struct rzn1_pinctrl_regs __iomem *lev2;
>  	u32 lev1_protect_phys;
>  	u32 lev2_protect_phys;
> -	u32 mdio_func[2];
> +	int mdio_func[2];

Hi Phil,

rzn1_pinctrl_mdio_select() assigns values of type u32 to elements
of mdio_func. Perhaps that warrants cleaning up too?

>  
>  	struct rzn1_pin_group *groups;
>  	unsigned int ngroups;
> @@ -810,8 +810,8 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device_node *child;
>  	unsigned int maxgroups = 0;
> -	unsigned int nfuncs = 0;
>  	unsigned int i = 0;
> +	int nfuncs = 0;
>  	int ret;
>  
>  	nfuncs = of_get_child_count(np);
> -- 
> 2.17.1
> 
