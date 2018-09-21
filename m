From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: make symbol 'mtk_drive' static
Date: Fri, 21 Sep 2018 10:00:42 +0800
Message-ID: <1537495242.9654.1.camel@mtkswgap22>
References: <1537424502-23554-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1537424502-23554-1-git-send-email-weiyongjun1@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "Ryder.Lee" <ryder.lee@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2018-09-20 at 06:21 +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:37:29: warning:
>  symbol 'mtk_drive' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Sean Wang <sean.wang@mediatek.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 167ebf4..4a9e0d4 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -34,7 +34,7 @@ struct mtk_drive_desc {
>  };
>  
>  /* The groups of drive strength */
> -const struct mtk_drive_desc mtk_drive[] = {
> +static const struct mtk_drive_desc mtk_drive[] = {
>  	[DRV_GRP0] = { 4, 16, 4, 1 },
>  	[DRV_GRP1] = { 4, 16, 4, 2 },
>  	[DRV_GRP2] = { 2, 8, 2, 1 },
> 
