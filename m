From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2] pinctrl:mediatek:add judgment conditions
Date: Sat, 22 Dec 2018 10:50:01 -0800
Message-ID: <CAGp9Lzoo6bw-3Hr56rgbL6EhrRvXX2y5pajaOo13c5MV9FsO7Q@mail.gmail.com>
References: <1545100282-15756-1-git-send-email-chuanjia.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545100282-15756-1-git-send-email-chuanjia.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chuanjia.liu@mediatek.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, zhiyong.tao@mediatek.com, eddie.huang@mediatek.com, hailong.fan@mediatek.com, youlin.pei@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 17, 2018 at 6:32 PM <chuanjia.liu@mediatek.com> wrote:
>

I thought the subject still is much general, it should be further
improved with something like "add EINT support to virtual GPIOs" and
should say more about what virtual GPIOs means by MTKers in the patch
description because "virtual" is a usual term used throughout the
kernel and that would easily cause others to fail to interpret
correctly.

> From: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
>
> This patch avoid return err when virtual gpio set SMT.
>
> Signed-off-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
> ---
> change note:
> v2 : 1. delete virtual gpio number
>      2. add judgment conditions
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 4a9e0d4c2bbc..a576e417744a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -290,7 +290,11 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>                 return err;
>
>         err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, MTK_ENABLE);
> -       if (err)
> +
> +       /* SMT doesn't support virtual GPIO, add err != -ENOTSUPP is used for
> +        * avoid return err when virtual gpio set SMT.
> +        */

I'd prefer to the comments as the below

/*
SMT is supposed to be supported by every real GPIO and doesn't support
virtual GPIOs, so the extra condition err != -ENOTSUPP is just for
adding EINT support to these virtual GPIOs. It should add an extra
flag in the pin descriptor when more pins with distinctive
characteristic come out.
*/

> +       if (err && err != -ENOTSUPP)
>                 return err;
>
>         return 0;
> --
> 2.19.1
>
