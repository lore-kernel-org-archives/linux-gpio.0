From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: fix regmap error handling
Date: Tue, 13 Sep 2016 10:42:50 +0200
Message-ID: <CACRpkdb6oWqHtAr26UgA4NtN5hvpCFqTJpj8LOw=YQcNZwJtaw@mail.gmail.com>
References: <20160909092715.403663-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35695 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755559AbcIMImw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 04:42:52 -0400
Received: by mail-oi0-f46.google.com with SMTP id d191so154974260oih.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 01:42:52 -0700 (PDT)
In-Reply-To: <20160909092715.403663-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 9, 2016 at 11:26 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> The newly added aspeed driver tries to check for a negative return
> value from a pinctrl function, but stores the intermediate value in
> a 'bool' variable, which cannot work:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function 'aspeed_sig_expr_set':
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:192:11: error: comparison of constant '0' with boolean expression is always false [-Werror=bool-compare]
>
> This slightly reworks the logic to use an explicit comparison with zero
> before assigning to the temporary variable.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied with the ACKs.
Also added Colin as Reported-by.

Yours,
Linus Walleij
