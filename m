From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: fix direction control issue
Date: Fri, 5 Feb 2016 14:52:59 +0100
Message-ID: <CACRpkdZb2-TX1eY7eyK5qCqOg66MP1e4+OO287roJdP=RB6-Fg@mail.gmail.com>
References: <1454462686-770-1-git-send-email-biao.huang@mediatek.com>
	<1454462686-770-2-git-send-email-biao.huang@mediatek.com>
	<1454555015.4618.10.camel@mussux00>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35600 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753142AbcBENw7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2016 08:52:59 -0500
Received: by mail-ob0-f176.google.com with SMTP id xk3so88858171obc.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2016 05:52:59 -0800 (PST)
In-Reply-To: <1454555015.4618.10.camel@mussux00>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>, Sherman Yin <syin@broadcom.com>
Cc: Biao Huang <biao.huang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

On Thu, Feb 4, 2016 at 4:03 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:
> On Wed, 2016-02-03 at 09:24 +0800, Biao Huang wrote:
>> Since input-enable/disable and input-schmitt-enable/disable are
>> workable when gpio direction is input, so add direction setting
>> when do input-enable/disable and input-schmitt-enable/disable
>> properties.
>>
>> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
>> ---
>>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
>> index 8cac73d..6eb01c9 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
>> @@ -352,6 +352,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
>>               ret = mtk_pconf_set_pull_select(pctl, pin, true, false, arg);
>>               break;
>>       case PIN_CONFIG_INPUT_ENABLE:
>> +             mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
>>               ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>
> Hi Linus,
>
> From pinctrl-bindings.txt, 'input-enable' property defined as following:
> input-enable        - enable input on pin (no effect on output)
>
> Since input enable and input direction are two different settings on our
> SOC,

What does this mean? How can input have a "direction"?

Isn't the direction of an input always inbound, into the SoC?

Please elaborate.

> could you tell me the exact meaning of this property? Input enable
> only? Or set input direction at the same time?

This was added in commit 8ba3f4d00078e7a49c60c0bd6298f29402c3a0a0
"pinctrl: Adds slew-rate, input-enable/disable"
by Sherman Yin so let's ask him first.

I interpret it as if there is a single bit setting a pin to input, these
two boolean flags toggle that bit, so it would be the first setting
on your SoC in that case.

Yours,
Linus Walleij
