From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: twl6040: remove unneeded forward declaration
Date: Wed, 23 Aug 2017 10:20:45 +0200
Message-ID: <CACRpkdY2m0x_rOUSqJvJiDJZ-yJpPohFfiyRMD5fAww7hhp5xg@mail.gmail.com>
References: <1503423235-4240-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34076 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753386AbdHWIUr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 04:20:47 -0400
Received: by mail-oi0-f50.google.com with SMTP id j144so9827516oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2017 01:20:47 -0700 (PDT)
In-Reply-To: <1503423235-4240-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 22, 2017 at 7:33 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> There is no reference to twl6040gpo_chip before its definition.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
