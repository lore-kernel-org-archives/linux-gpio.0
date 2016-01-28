From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pxa: guard sub-directory with CONFIG_PINCTRL_PXA
Date: Thu, 28 Jan 2016 11:24:13 +0100
Message-ID: <CACRpkdaMz_kSamr6KoBC+JrhCDfwmkZggXQ4-F9rEZ=czXL8uw@mail.gmail.com>
References: <1453563068-30238-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35477 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934235AbcA1KYN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 05:24:13 -0500
Received: by mail-ob0-f179.google.com with SMTP id ny8so10146026obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 02:24:13 -0800 (PST)
In-Reply-To: <1453563068-30238-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jan 23, 2016 at 4:31 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_PXA is more suitable than CONFIG_ARCH_PXA
> to guard the drivers/pinctrl/pxa/ directory.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
