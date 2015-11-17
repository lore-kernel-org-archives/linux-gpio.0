From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix a memleak when do dt maps.
Date: Tue, 17 Nov 2015 10:50:26 +0800
Message-ID: <CAGS+omAZ+rgT2NG4-U7HK4kZJGHqA8n_0EjZpHfePojYYLd1Xw@mail.gmail.com>
References: <1447727690-15251-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447727690-15251-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-gpio@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 17, 2015 at 10:34 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:
> configs will kmemdup to dup_configs in pictrl util function.
> So configs need to be freed.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> ---
>  Fix a memleak issue.
>
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index bbf0230..0000b5a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -568,9 +568,10 @@ static int mtk_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>                 }
>         }
>
> -       return 0;
> +       err = 0;
>
>  fail:

This isn't just 'fail' case anymore, so change label name to something
like "exit".

> +       kfree(configs);

Do we also need to kfree in the "if (!num_pins || !maps_per_pin)" error case?

>         return err;
>  }
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
