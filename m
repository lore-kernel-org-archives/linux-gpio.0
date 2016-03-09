From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/8] drivers/pinctrl: make stm32/pinctrl-stm32f429.c
 explicitly non-modular
Date: Wed, 9 Mar 2016 10:25:55 +0700
Message-ID: <CACRpkdZ3q1O5=u3b4hGMp2ahTh26yVM=nNraucZMAKikx7xokQ@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-6-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34809 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222AbcCIDZ4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 22:25:56 -0500
Received: by mail-ob0-f170.google.com with SMTP id ts10so34577043obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 19:25:56 -0800 (PST)
In-Reply-To: <1456778924-20730-6-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Mar 1, 2016 at 3:48 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/stm32/Kconfig:config PINCTRL_STM32F429
> drivers/pinctrl/stm32/Kconfig:  bool "STMicroelectronics STM32F429 pin control" if COMPILE_TEST && !MACH_STM32F429
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
