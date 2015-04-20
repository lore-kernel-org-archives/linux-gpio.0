From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: mediatek: mtk-common: initialize unmask
Date: Mon, 20 Apr 2015 15:32:51 +0300
Message-ID: <5534F1F3.9060802@cogentembedded.com>
References: <1429528516-9245-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:34384 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754806AbbDTMcz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Apr 2015 08:32:55 -0400
Received: by laat2 with SMTP id t2so125483439laa.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2015 05:32:54 -0700 (PDT)
In-Reply-To: <1429528516-9245-1-git-send-email-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Hello.

On 04/20/2015 02:15 PM, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>

> cppcheck detected an unitialized variable:

    Uninitialized.

> [drivers/pinctrl/mediatek/pinctrl-mtk-common.c:897]:
>    (error) Uninitialized variable: unmask

> unmask should be initialized to zero to ensure unmasking
> only occurs if a previous mask occurred. The current situation
> is that the unmask variable could contain any random garbage
> causing random unexpected unmasking.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 493294c..3173125 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -881,7 +881,8 @@ static int mtk_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
>   	if (!mtk_eint_get_mask(pctl, eint_num)) {
>   		mtk_eint_mask(d);
>   		unmask = 1;
> -	}
> +	} else
> +		unmask = 0;

    The CodingStyle dictates that there should be {} around *else* branch too.

[...]

WBR, Sergei

