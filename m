From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: make arrays static, reduces object
 code size
Date: Tue, 12 Sep 2017 16:19:30 +0200
Message-ID: <CACRpkdZXPJEjQMfCekdXOCgRKwiZ8mv9wwskfuz8EgxXJyGmAA@mail.gmail.com>
References: <20170912112124.1143-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33060 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdILOTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2017 10:19:31 -0400
Received: by mail-io0-f180.google.com with SMTP id k101so5886071iod.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2017 07:19:31 -0700 (PDT)
In-Reply-To: <20170912112124.1143-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 12, 2017 at 1:21 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate const arrays on the stack, instead make them
> static.  Makes the object code smaller nearly 1000 bytes. Also
> line break wide lines to avoid checkpatch warnings.
>
> Before:
>    text    data     bss     dec     hex filename
>   13112    1996       0   15108    3b04 pinctrl-uniphier-core.o
>
> After:
>    text    data     bss     dec     hex filename
>   11642    2476       0   14118    3726 pinctrl-uniphier-core.o
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Masahiro's ACK.

Yours,
Linus Walleij
