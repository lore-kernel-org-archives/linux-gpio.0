From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ath79: add MODULE_LICENSE
Date: Sat, 2 Dec 2017 16:46:25 +0100
Message-ID: <CACRpkdbdXufZJ5fP6PGBaHR1qfKbvzYB2-ZVyqnXnrEazn3Wxg@mail.gmail.com>
References: <20171201014458.8809-1-dja@axtens.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34509 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbdLBPq0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 10:46:26 -0500
Received: by mail-io0-f193.google.com with SMTP id s19so14353891ioa.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 07:46:26 -0800 (PST)
In-Reply-To: <20171201014458.8809-1-dja@axtens.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Axtens <dja@axtens.net>
Cc: Alban Bedel <albeu@free.fr>, linux-gpio@vger.kernel.org, Jiri Kosina <trivial@kernel.org>

On Fri, Dec 1, 2017 at 2:44 AM, Daniel Axtens <dja@axtens.net> wrote:

> This fixes the following warning on an allmodconf build:
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o
>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

I already got some other patch for this but thanks anyway!

Yours,
Linus Walleij
