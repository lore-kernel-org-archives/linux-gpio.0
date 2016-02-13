From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: mediatek: guard sub-directory with CONFIG_PINCTRL_MTK
Date: Sat, 13 Feb 2016 23:35:03 +0100
Message-ID: <CACRpkdYiv3cMGfPuqHshfr5+dB=eLYp=z6u9eGFLW+kw5i83Zw@mail.gmail.com>
References: <1455098072-13112-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35354 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbcBMWfE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Feb 2016 17:35:04 -0500
Received: by mail-ob0-f176.google.com with SMTP id xk3so167274580obc.2
        for <linux-gpio@vger.kernel.org>; Sat, 13 Feb 2016 14:35:04 -0800 (PST)
In-Reply-To: <1455098072-13112-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>

On Wed, Feb 10, 2016 at 10:54 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_MTK is more suitable than CONFIG_ARCH_MEDIATEK
> to guard the drivers/pinctrl/mediatek/ directory.
> (I renamed CONFIG_PINCTRL_MTK_COMMON to CONFIG_PINCTRL_MTK.)
>
> This allows COMPILE_TEST to descend into drivers/pinctrl/mediatek
> without CONFIG_ARCH_MEDIATEK define.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Series-changes: 2
>   - Rebase onto linux-pinctrl/devel

Patch applied.

THANKS for following through.

Yours,
Linus Walleij
