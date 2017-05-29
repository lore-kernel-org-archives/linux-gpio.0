From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: ml-ioh: check the return value of irq_alloc_generic_chip()
Date: Mon, 29 May 2017 13:34:44 +0200
Message-ID: <CACRpkdb+otANCC78tUK7xdX1pBGWgY76o2P1Y_BJMH+M3PH3kg@mail.gmail.com>
References: <1495701458-12444-1-git-send-email-brgl@bgdev.pl> <1495701458-12444-4-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:37555 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750913AbdE2Leq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:34:46 -0400
Received: by mail-it0-f44.google.com with SMTP id g126so25461696ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 04:34:45 -0700 (PDT)
In-Reply-To: <1495701458-12444-4-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 25, 2017 at 10:37 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This function can fail, so check the return value before dereferencing
> the returned pointer.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
