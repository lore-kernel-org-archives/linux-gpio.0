From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
Date: Thu, 2 May 2019 21:48:08 +0800
Message-ID: <1556804888.28808.6.camel@mtksdaap41>
References: <20190429032551.65975-1-drinkcat@chromium.org>
 <20190429032551.65975-2-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190429032551.65975-2-drinkcat@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, evgreen@chromium.org, swboyd@chromium.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 2019-04-29 at 11:25 +0800, Nicolas Boichat wrote:
> pinctrl variants that include pinctrl-mtk-common-v2.h (and not
> pinctrl-mtk-common.h) also need to use mtk_eint_pm_ops to setup
> wake mask properly, so copy over the pm_ops to v2.
> 
> It is not easy to merge the 2 copies (or move
> mtk_eint_suspend/resume to mtk-eint.c), as we need to
> dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
> different structure definition for v1 and v2.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> ---
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 20e1c890e73b30c..7e19b5a4748eafe 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -723,3 +723,22 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>  
>  	return 0;
>  }
> +
> +static int mtk_eint_suspend(struct device *device)
> +{
> +	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> +
> +	return mtk_eint_do_suspend(pctl->eint);
> +}
> +
> +static int mtk_eint_resume(struct device *device)
> +{
> +	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
> +
> +	return mtk_eint_do_resume(pctl->eint);
> +}
> +
> +const struct dev_pm_ops mtk_eint_pm_ops = {
> +	.suspend_noirq = mtk_eint_suspend,
> +	.resume_noirq = mtk_eint_resume,
> +};

This is identical to the one in pinctrl-mtk-common.c and will have name
clash if both pinctrl-mtk-common.c and pinctrl-mtk-common-v2.c are
built.

It would be better if we try to merge both version into mtk-eint.c, this
way we could also remove some global functions.

Joe.C
