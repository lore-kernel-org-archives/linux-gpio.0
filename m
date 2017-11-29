From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags simultaneously
Date: Wed, 29 Nov 2017 14:16:47 +0100
Message-ID: <CACRpkdZE0OufEXQtpkFqSoei_jkrEbJW07ekmpYTx=MEQ2qsYw@mail.gmail.com>
References: <20171115154743.5921-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:44322 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753083AbdK2NQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Nov 2017 08:16:49 -0500
Received: by mail-io0-f176.google.com with SMTP id w127so3614351iow.11
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2017 05:16:48 -0800 (PST)
In-Reply-To: <20171115154743.5921-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 15, 2017 at 4:47 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Do not allow OPEN_SOURCE & OPEN_DRAIN flags in a single request. If
> the hardware actually supports enabling both at the same time the
> electrical result would be disastrous.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> There was a misunderstanding as to what the goal of my previous commit
> 609aaf6a6029 ("gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags for
> input") was, which resulted in discovering another thing that needs
> fixing. This change was suggested to me by Linus earlier today.

Awesome, thanks.

Patch applied.

I wonder if we should even put some swear words into dmesg
for this.

Yours,
Linus Walleij
