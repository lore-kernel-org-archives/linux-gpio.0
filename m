From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/2] pinctrl: mediatek: Modify pinctrl bindings for mt7623
Date: Fri, 19 Feb 2016 10:03:12 +0100
Message-ID: <CACRpkdYiQop2qDNuh4N2YZy2DTy9mOEyERro8hT4YogCPc2LGw@mail.gmail.com>
References: <1455866238-6102-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36270 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757031AbcBSJDN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 04:03:13 -0500
Received: by mail-ob0-f170.google.com with SMTP id gc3so100359378obb.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 01:03:12 -0800 (PST)
In-Reply-To: <1455866238-6102-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Biao Huang <biao.huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Fri, Feb 19, 2016 at 8:17 AM, John Crispin <blogic@openwrt.org> wrote:

> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> ---
> please apply to the devel-mt2701 branch
>
> Changes in V2
> * make mt7623-pinfunc.h part of patch 1/2
> * make sure the list stays sorted

Patch applied unless the Mediatek maintainers come with serious
remarks (I can always revert).

Only minor comments from Yingjoe on the previous version so I guess
it is finished.

MTK guys: do you even have this SoC? It appears MTK is churning out
a plethora of SoCs and then they land in the lap of the OpenWRT
developers before the MTK maintainers even start to look at it...

Yours,
Linus Walleij
