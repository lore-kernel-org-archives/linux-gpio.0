From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mockup: fix a return value check
Date: Fri, 8 Dec 2017 15:34:42 +0100
Message-ID: <CACRpkda1t2bYZNgdjfSkey4RsSmnzT_NWJJUV8B_-0S06qN3gg@mail.gmail.com>
References: <20171206163002.26742-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:39686 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753802AbdLHOeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Dec 2017 09:34:44 -0500
Received: by mail-it0-f52.google.com with SMTP id 68so5109329ite.4
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2017 06:34:43 -0800 (PST)
In-Reply-To: <20171206163002.26742-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 6, 2017 at 5:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> The return value of platform_device_register_resndata() on error is
> an error code converted to pointer with ERR_PTR(), not NULL.
>
> Check the return value correctly.
>
> Fixes: 8a39f597bcfd ("gpio: mockup: rework device probing")
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
