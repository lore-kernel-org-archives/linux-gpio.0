From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: guard sub-directory with CONFIG_PINCTRL_SUNXI
Date: Thu, 28 Jan 2016 11:31:34 +0100
Message-ID: <CACRpkdad53bcBEOzKK=dTLmDSzr-rZuiFmh6XWnBqzi+NebuHw@mail.gmail.com>
References: <1453563129-30332-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36013 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965773AbcA1Kbf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 05:31:35 -0500
Received: by mail-ob0-f176.google.com with SMTP id ba1so31878425obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 02:31:35 -0800 (PST)
In-Reply-To: <1453563129-30332-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Jan 23, 2016 at 4:32 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_SUNXI is more suitable than CONFIG_ARCH_SUNXI
> to guard the drivers/pinctrl/sunxi/ directory.
> (I renamed CONFIG_PINCTRL_SUNXI_COMMON to CONFIG_PINCTRL_SUNXI.)
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This patch does not apply on linux v4.5-rc1, please rebase, add
Maxime's ACK and resend.

Yours,
Linus Walleij
