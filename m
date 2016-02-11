From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: rockchip-pinctrl: Support the RK3399
 SoCs compatible
Date: Thu, 11 Feb 2016 14:52:42 +0100
Message-ID: <CACRpkdZvS2RY2LqFQ1dMz8vecMgG7zmxw8JEj5KLTiqYCSsJ=w@mail.gmail.com>
References: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
	<1454153517-52969-1-git-send-email-david.wu@rock-chips.com>
	<1454153517-52969-3-git-send-email-david.wu@rock-chips.com>
	<14543443.RsRWh5K5Uv@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:36364 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252AbcBKNwm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 08:52:42 -0500
Received: by mail-ob0-f172.google.com with SMTP id ba1so73475037obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 05:52:42 -0800 (PST)
In-Reply-To: <14543443.RsRWh5K5Uv@phil>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: David Wu <david.wu@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jan 30, 2016 at 1:16 PM, Heiko Stuebner <heiko@sntech.de> wrote:
> Hi David,
>
> Am Samstag, 30. Januar 2016, 19:31:57 schrieb David Wu:
>> Change-Id: Ic1bdb3dc358837e97d7b48dd58be2f8d9d08d766
>
> please no Change-Id, it's missing the Signed-off, and as Linus Walleij said,
> the compatible addition to the documentation can maybe stay in the pinctrl-
> patch itself.
>
> I think both Linus and me overlooked that the binding-doc-addition was
> already correctly included in your v2 patch at the top :-)

Yeah I merged that now anyways so the string is there.

Yours,
Linus Walleij
