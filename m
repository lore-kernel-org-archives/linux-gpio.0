From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH -next] pinctrl: mediatek: moore: fix return value check
 in mtk_moore_pinctrl_probe()
Date: Fri, 21 Sep 2018 10:18:01 +0800
Message-ID: <1537496281.9654.8.camel@mtkswgap22>
References: <1537424510-23623-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1537424510-23623-1-git-send-email-weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "Ryder.Lee" <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2018-09-20 at 06:21 +0000, Wei Yongjun wrote:
> In case of error, the function devm_kmalloc_array() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: b7d7f9eeca55 ("pinctrl: mediatek: extend struct mtk_pin_desc which per-pin driver depends on")
> Signed-off-by: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Acked-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index c27597c..3bf5dd5 100644
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
> 
