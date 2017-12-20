From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpiolib: use kstrdup_const() for gpio_device label
Date: Wed, 20 Dec 2017 09:17:21 +0100
Message-ID: <CACRpkda+D6XidgDtfciMCq+Av-vizUQzK=S2eg+36gk_E65kZQ@mail.gmail.com>
References: <20171214142920.32683-1-brgl@bgdev.pl> <20171214142920.32683-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:35982 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932536AbdLTIRW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 03:17:22 -0500
Received: by mail-it0-f42.google.com with SMTP id d16so5897552itj.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 00:17:22 -0800 (PST)
In-Reply-To: <20171214142920.32683-3-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Joe Perches <joe@perches.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 14, 2017 at 3:29 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Users often pass a pointer to a static string to gpiochip_add_data()
> family of functions. Avoid unnecessary memory allocations with the
> provided helper routine.
>
> While at it: use a ternary operator instead of an if else for brevity.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied. (Patch 1/2 was already applied from an earlier
version).

Yours,
Linus Walleij
