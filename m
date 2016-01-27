From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers/pinctrl: make mediatek/pinctrl-mt8* driver
 explicitly non-modular
Date: Wed, 27 Jan 2016 15:00:19 +0100
Message-ID: <CACRpkdb6-GhWdZ=0gM5YnpL6GzBmoUX1dLWCUDhCw+VgLxpLzg@mail.gmail.com>
References: <1451929450-18150-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33628 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754240AbcA0OAT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 09:00:19 -0500
Received: by mail-ob0-f181.google.com with SMTP id is5so7577551obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 06:00:19 -0800 (PST)
In-Reply-To: <1451929450-18150-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>

On Mon, Jan 4, 2016 at 6:44 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for these drivers are currently:
>
> config PINCTRL_MT8127
>         bool "Mediatek MT8127 pin control" if COMPILE_TEST && !MACH_MT8127
>
> config PINCTRL_MT8135
>         bool "Mediatek MT8135 pin control" if COMPILE_TEST && !MACH_MT8135
>
> config PINCTRL_MT8173
>         bool "Mediatek MT8173 pin control"
>
> ...meaning that they are currently not being built as a module by anyone.
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> A recent commit moved these from module_init to arch_initcall already, so
> the init ordering remains untouched with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Daniel Kurtz <djkurtz@chromium.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Sorry for delayed response...

Yours,
Linus Walleij
