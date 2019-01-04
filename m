From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v5] pinctrl: mediatek: add EINT support to virtual GPIOs
Date: Fri, 4 Jan 2019 02:26:46 -0800
Message-ID: <CAGp9Lzop3UaUt8Kx4LsPxkoo_4uZF-7bv2BOqHgwmurmEA9CLA@mail.gmail.com>
References: <1546486635-16829-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546486635-16829-1-git-send-email-chuanjia.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2h1YW5qaWEgTGl1ICjmn7PkvKDlmIkp?= <chuanjia.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, youlin.pei@mediatek.com, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, hailong.fan@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 2, 2019 at 7:38 PM <chuanjia.liu@mediatek.com> wrote:
>
> From: "chuanjia.liu" <Chuanjia.Liu@mediatek.com>
>
> Virtual gpio only used inside SOC and not being exported to outside SOC.
> Some modules use virtual gpio as eint and doesn't need SMT.
> So this patch add EINT support to virtual GPIOs.
>
> Signed-off-by: chuanjia.liu <Chuanjia.Liu@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

BTW, if you were worried about a patch is lost, you could use RESEND
in the tag is fine.

> ---
> change note:
> v5: This patch is the same as v4,re-upload due to
>       mail permissions issues
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4a9e0d4c2bbc..b1c368455d30 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -290,7 +290,13 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>                 return err;
>
>         err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
> -       if (err)
> +       /* SMT is supposed to be supported by every real GPIO and doesn't
> +        * support virtual GPIOs, so the extra condition err != -ENOTSUPP
> +        * is just for adding EINT support to these virtual GPIOs. It should
> +        * add an extra flag in the pin descriptor when more pins with
> +        * distinctive characteristic come out.
> +        */
> +       if (err && err != -ENOTSUPP)
>                 return err;
>
>         return 0;
> --
> 2.19.1
>
