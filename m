From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v3] pinctrl:mediatek:add EINT support to virtual GPIOs
Date: Thu, 27 Dec 2018 11:16:09 -0800
Message-ID: <CAGp9LzpRrXzikwn91oW_qZ76MK2RePR-npQsca9_Q3g38xdUpA@mail.gmail.com>
References: <1545711838-20444-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545711838-20444-1-git-send-email-chuanjia.liu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: chuanjia.liu@mediatek.com
Cc: youlin.pei@mediatek.com, zhiyong.tao@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, hailong.fan@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 24, 2018 at 8:25 PM <chuanjia.liu@mediatek.com> wrote:
>
> From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
>

there are still some nitpicks

an empty char should follow the ':' char

> Virtual gpio only used inside SOC and not being exported to outside SOC.
> Some modules use virtual gpio as eint and doesn't nedd SMT.

s/nedd/need/

> So this patch add EINT support to virtual GPIOs.
>
> Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> ---
> change note:
> v3 : 1. modify subject and description
>       2. modify comments
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4a9e0d4c2bbc..a0db145f798d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -290,7 +290,15 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>                 return err;
>
>         err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
> -       if (err)
> +       /*

merge the second line to be consistent with the other comment blocks

> +        *SMT is supposed to be supported by every real GPIO and doesn't

an empty char should follow '*' char to be consistent with the other
comment blocks
and also in the other lines starting with '*'

> +        *support virtual GPIOs, so the extra condition err != -ENOTSUPP
> +        *is just for adding EINT support to these virtual GPIOs. It should
> +        *add an extra flag in the pin descriptor when more pins with
> +        *distinctive characteristic come out.
> +        */
> +

remove the blank line

> +       if (err && err != -ENOTSUPP)
>                 return err;
>
>         return 0;
> --
> 2.19.1
>
