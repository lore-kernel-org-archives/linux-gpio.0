From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix some NULL checks in probe
Date: Thu, 27 Sep 2018 06:25:01 +0800
Message-ID: <1538000701.30348.16.camel@mtkswgap22>
References: <20180926104230.GC14535@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180926104230.GC14535@mwanda>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org


Hi,

The same patch is already being sent and applied in [1].

	Sean

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2018-September/015280.html
http://lists.infradead.org/pipermail/linux-mediatek/2018-September/015283.html


On Wed, 2018-09-26 at 13:42 +0300, Dan Carpenter wrote:
> The devm_kmalloc_array() function returns NULL on error, it doesn't
> return error pointers.
> 
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 4cf0fea30b7d..d2179028f134 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -836,8 +836,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>  
>  	hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
>  				      sizeof(*hw->base), GFP_KERNEL);
> -	if (IS_ERR(hw->base))
> -		return PTR_ERR(hw->base);
> +	if (!hw->base)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < hw->soc->nbase_names; i++) {
>  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> @@ -863,8 +863,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>  	/* Copy from internal struct mtk_pin_desc to register to the core */
>  	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
>  				  GFP_KERNEL);
> -	if (IS_ERR(pins))
> -		return PTR_ERR(pins);
> +	if (!pins)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < hw->soc->npins; i++) {
>  		pins[i].number = hw->soc->pins[i].number;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index c27597cd3931..3bf5dd552749 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -608,8 +608,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
>  
>  	hw->base = devm_kmalloc_array(&pdev->dev, hw->soc->nbase_names,
>  				      sizeof(*hw->base), GFP_KERNEL);
> -	if (IS_ERR(hw->base))
> -		return PTR_ERR(hw->base);
> +	if (!hw->base)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < hw->soc->nbase_names; i++) {
>  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> @@ -629,8 +629,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
>  	/* Copy from internal struct mtk_pin_desc to register to the core */
>  	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
>  				  GFP_KERNEL);
> -	if (IS_ERR(pins))
> -		return PTR_ERR(pins);
> +	if (!pins)
> +		return -ENOMEM;
>  
>  	for (i = 0; i < hw->soc->npins; i++) {
>  		pins[i].number = hw->soc->pins[i].number;
