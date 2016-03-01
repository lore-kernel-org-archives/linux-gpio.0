From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH 5/8] drivers/pinctrl: make stm32/pinctrl-stm32f429.c
 explicitly non-modular
Date: Tue, 1 Mar 2016 10:01:52 +0100
Message-ID: <CALszF6A4U6fh5Sbb1=JAotmwXcsO6juftTG4rYZnXjH8dbwNxw@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-6-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f68.google.com ([209.85.192.68]:33350 "EHLO
	mail-qg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751209AbcCAJBx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2016 04:01:53 -0500
In-Reply-To: <1456778924-20730-6-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

2016-02-29 21:48 GMT+01:00 Paul Gortmaker <paul.gortmaker@windriver.com>:
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
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32f429.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Thanks for the patch:
Acked-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Regards,
Maxime
