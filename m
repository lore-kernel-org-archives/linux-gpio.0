From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pxa2xx: add MODULE_LICENSE
Date: Sat, 2 Dec 2017 17:02:20 +0100
Message-ID: <CACRpkdYWTNEJZ3TUCsgEdDMRytGiOiMV6YhRKgciO1Qwgbeorg@mail.gmail.com>
References: <20171202094015.11696-1-dja@axtens.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:46134 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752221AbdLBQCV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 11:02:21 -0500
Received: by mail-it0-f68.google.com with SMTP id t1so5654404ite.5
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 08:02:21 -0800 (PST)
In-Reply-To: <20171202094015.11696-1-dja@axtens.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Axtens <dja@axtens.net>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Jiri Kosina <trivial@kernel.org>

On Sat, Dec 2, 2017 at 10:40 AM, Daniel Axtens <dja@axtens.net> wrote:

> This fixes the following warning on an allmodconfig build:
> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pxa/pinctrl-pxa2xx.o
>
> This matches the license in the header.
>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Somebody patches this too. Sorry!

Thanks anyway!

Yours,
Linus Walleij
