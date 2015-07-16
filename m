From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/7] pinctrl: UniPhier: add UniPhier pinctrl core support
Date: Thu, 16 Jul 2015 09:20:15 +0200
Message-ID: <CACRpkdZFfypZfDAmULcC1_q_bYD-nsh2H0rMAqo+ncWsBx6m=A@mail.gmail.com>
References: <1436841607-7556-1-git-send-email-yamada.masahiro@socionext.com>
	<1436841607-7556-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35364 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753805AbbGPHUQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 03:20:16 -0400
Received: by obbop1 with SMTP id op1so41713915obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 00:20:15 -0700 (PDT)
In-Reply-To: <1436841607-7556-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 14, 2015 at 4:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The core support for the pinctrl drivers for all the UniPhier SoCs.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - drop vogus THIS_MODULE because this file is always built-in
>   - drop vogus "include <linux/module.h> because this file is
>     always built-in

This looks nice and uses all generic facilities we have.

Patch applied.

Yours,
Linus Walleij
