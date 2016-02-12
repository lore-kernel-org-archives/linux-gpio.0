From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: fix direction control issue
Date: Thu, 11 Feb 2016 18:07:11 -0800
Message-ID: <1455242831.35628.15.camel@mussux00>
References: <1454462686-770-1-git-send-email-biao.huang@mediatek.com>
	 <1454462686-770-2-git-send-email-biao.huang@mediatek.com>
	 <1454555015.4618.10.camel@mussux00>
	 <CACRpkdZb2-TX1eY7eyK5qCqOg66MP1e4+OO287roJdP=RB6-Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([69.46.227.141]:39810 "EHLO
	mailgw03.cellopoint.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751315AbcBLCHS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 21:07:18 -0500
In-Reply-To: <CACRpkdZb2-TX1eY7eyK5qCqOg66MP1e4+OO287roJdP=RB6-Fg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sherman Yin <syin@broadcom.com>, Biao Huang <biao.huang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

On Fri, 2016-02-05 at 14:52 +0100, Linus Walleij wrote:
> On Thu, Feb 4, 2016 at 4:03 AM, Hongzhou Yang
> <hongzhou.yang@mediatek.com> wrote:
> > On Wed, 2016-02-03 at 09:24 +0800, Biao Huang wrote:
> >> Since input-enable/disable and input-schmitt-enable/disable are
> >> workable when gpio direction is input, so add direction setting
> >> when do input-enable/disable and input-schmitt-enable/disable
> >> properties.
> >>
> >> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> >> ---
> >>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> >> index 8cac73d..6eb01c9 100644
> >> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> >> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> >> @@ -352,6 +352,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
> >>               ret = mtk_pconf_set_pull_select(pctl, pin, true, false, arg);
> >>               break;
> >>       case PIN_CONFIG_INPUT_ENABLE:
> >> +             mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
> >>               ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
> >
> > Hi Linus,
> >
> > From pinctrl-bindings.txt, 'input-enable' property defined as following:
> > input-enable        - enable input on pin (no effect on output)
> >
> > Since input enable and input direction are two different settings on our
> > SOC,
> 
> What does this mean? How can input have a "direction"?
> 
> Isn't the direction of an input always inbound, into the SoC?
> 
> Please elaborate.

Sorry for the late reply.
There are two conditions if external device input data into SOC.
1. Change GPIO direction to input.
2. Switch on input.


> > could you tell me the exact meaning of this property? Input enable
> > only? Or set input direction at the same time?
> 
> This was added in commit 8ba3f4d00078e7a49c60c0bd6298f29402c3a0a0
> "pinctrl: Adds slew-rate, input-enable/disable"
> by Sherman Yin so let's ask him first.

Thanks for this info.
>From Sherman's comment, PIN_CONFIG_INPUT_ENABLE seems only to stand for
the condition 2.

* @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does
not affect the pin's ability to drive output.  1 enables input, 0
disables input.

Then I get confuse if we can change direction under this property.

Thanks.
Hongzhou

