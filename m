From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: uniphier: enable UniPhier SoCs pinctrl
 drivers by default
Date: Thu, 29 Oct 2015 14:33:34 +0100
Message-ID: <CACRpkdY4hs_7dE2KicDeUj7hvbKmHu3pcwQO3eshTtSmzH2PGA@mail.gmail.com>
References: <1445912911-1292-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36475 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756950AbbJ2Ndf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2015 09:33:35 -0400
Received: by oiao187 with SMTP id o187so32591040oia.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2015 06:33:34 -0700 (PDT)
In-Reply-To: <1445912911-1292-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, "arm@kernel.org" <arm@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 27, 2015 at 3:28 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add "default y" to the Kconfig rather than adding entries into
> arch/arm/configs/multi_v7_defconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

(...)
> config PINCTRL_UNIPHIER_PH1_LD4
>         tristate "UniPhier PH1-LD4 SoC pinctrl driver"
> +       default y
>         select PINCTRL_UNIPHIER_CORE

Why is it not default y if <PH1_LD4_SOC_THING>?

So it is only turned on if the corresponding SoC is selected?

Or don't you have symbols like that?

ARM SoC folks: can you ACK this patch indicating that this is the way
you wanna handle this?

Yours,
Linus Walleij
