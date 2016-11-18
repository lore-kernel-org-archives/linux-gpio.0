From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: mediatek: use builtin_platform_driver
Date: Fri, 18 Nov 2016 15:53:20 -0800
Message-ID: <1479513200.25135.0.camel@mussux00>
References: <7746cfe83ca3e96ccdf503669db3ace0e3081b7f.1479455552.git.geliangtang@gmail.com>
 <70fcc58b7e9219a9fbe3695df927041b8234dd08.1479457060.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <70fcc58b7e9219a9fbe3695df927041b8234dd08.1479457060.git.geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Geliang Tang <geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Fri, 2016-11-18 at 22:12 +0800, Geliang Tang wrote:
> Use builtin_platform_driver() helper to simplify the code.
> 
> Signed-off-by: Geliang Tang <geliangtang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6397.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
> index 6eccb85..afcede7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
> @@ -64,8 +64,4 @@ static struct platform_driver mtk_pinctrl_driver = {
>  	},
>  };
>  
> -static int __init mtk_pinctrl_init(void)
> -{
> -	return platform_driver_register(&mtk_pinctrl_driver);
> -}
> -device_initcall(mtk_pinctrl_init);
> +builtin_platform_driver(mtk_pinctrl_driver);

Acked-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Thanks,
Hongzhou
