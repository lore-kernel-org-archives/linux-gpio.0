From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
Date: Sat, 4 Feb 2017 21:35:55 +0100
Message-ID: <CACRpkdbbXGuE2u3H0W7XLmaq1VLNnVrGCZYgCC=3_odkifvaaQ@mail.gmail.com>
References: <20170202042817.8033-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:35287 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbdBDUgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Feb 2017 15:36:11 -0500
Received: by mail-it0-f43.google.com with SMTP id 203so33132926ith.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 Feb 2017 12:35:56 -0800 (PST)
In-Reply-To: <20170202042817.8033-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Thu, Feb 2, 2017 at 5:28 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> 1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
> unresolved review comments[1]. Address the comments by removing the use
> of macros from the consumer header (this patch represents the diff
> between v2 and v3[2]).
>
> [1] https://lkml.org/lkml/2017/1/26/337
> [2] https://lkml.org/lkml/2017/1/26/786
>
> Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with Joel's ACK.

Thank you for just tirelessly fixing my mistakes, I owe you one.

Yours,
Linus Walleij
