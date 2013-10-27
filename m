From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio: provide stubs for devres gpio functions
Date: Sun, 27 Oct 2013 15:58:56 +0900
Message-ID: <CAAVeFu+DTGHUSSeADvHsOe5ZzDsD2KSseGffL0PQiQ8989Bgbw@mail.gmail.com>
References: <1382715613-3435-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:43250 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751190Ab3J0G7S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Oct 2013 02:59:18 -0400
Received: by mail-ie0-f177.google.com with SMTP id e14so9012174iej.22
        for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2013 23:59:18 -0700 (PDT)
In-Reply-To: <1382715613-3435-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Sat, Oct 26, 2013 at 12:40 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> commit 6b3d8145dcfdbbb43f13544e16f44f4574f941dd
> "gpiolib: make GPIO_DEVRES depend on GPIOLIB"
> breaks builds when device drivers are using devm_gpio*
> devres functions without enabling GPIOLIB, relying on
> the devres code to be compiled anyway.
>
> Provide stubs so that we get these if we're using the
> devres functions without GPIOLIB.
>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
