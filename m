From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 7/7] pinctrl: UniPhier: add UniPhier PH1-LD6b pinctrl driver
Date: Thu, 16 Jul 2015 09:36:13 +0200
Message-ID: <CACRpkdZPDq+gW4e+rKpiZbfYaYr6O1KUuXW93_qY_d5FUSi5FQ@mail.gmail.com>
References: <1436841607-7556-1-git-send-email-yamada.masahiro@socionext.com>
	<1436841607-7556-8-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34082 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753864AbbGPHgO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 03:36:14 -0400
Received: by obre1 with SMTP id e1so42033714obr.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 00:36:14 -0700 (PDT)
In-Reply-To: <1436841607-7556-8-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 14, 2015 at 4:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add pin configuration and pinmux support for UniPhier PH1-LD6b SoC.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - sort groups and funcs alphabetically
>   - add i2c pin-mux settings
>   - sort members of platform_driver
>   - change to tristate
>   - add THIS_MODULE to pinctrl_desc
>   - use module_platform_driver

Patch applied.

Yours,
Linus Walleij
