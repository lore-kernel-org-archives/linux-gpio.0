From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: Modify pinctrl bindings for
 mt7623
Date: Wed, 20 Jan 2016 17:34:54 +0800
Message-ID: <1453282494.16515.10.camel@mtksdaap41>
References: <1452441608-24176-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:31150 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751627AbcATJfA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2016 04:35:00 -0500
In-Reply-To: <1452441608-24176-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org

On Sun, 2016-01-10 at 17:00 +0100, John Crispin wrote:
> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> index 9ffb0b2..4fa4444 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> @@ -5,6 +5,7 @@ The Mediatek's Pin controller is used to control SoC pins.
>  Required properties:
>  - compatible: value should be one of the following.
>  	"mediatek,mt2701-pinctrl", compatible with mt2701 pinctrl.
> +	"mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.
>  	"mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
>  	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
>  	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.

Hi John,

Please keep the list sorted.

Joe.C


