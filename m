From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: ftgpio010: Fix platform_get_irq's error checking
Date: Sat, 2 Dec 2017 21:25:51 +0100
Message-ID: <CACRpkdYQ9ay4aUimY6D2Nz=75Et8D1z82wzAaa6nxo1tJ1Kmhw@mail.gmail.com>
References: <5abcacf8ee7ecb1e084f93c82cae1768e99fd4e6.1512233762.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:44527 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752121AbdLBUZw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 15:25:52 -0500
Received: by mail-it0-f44.google.com with SMTP id b5so6069131itc.3
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 12:25:52 -0800 (PST)
In-Reply-To: <5abcacf8ee7ecb1e084f93c82cae1768e99fd4e6.1512233762.git.arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Sat, Dec 2, 2017 at 6:01 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> The platform_get_irq() function returns negative if an error occurs.
> zero or positive number on success. platform_get_irq() error checking
> for zero is not correct.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
> changes in v2:
>              It's should be 'irq <= 0' instead of 'irq < 0'.

Yep that's the right patch! Patch applied.

Yours,
Linus Walleij
