From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 03/10] gpio: mockup: be quiet unless something goes wrong
Date: Mon, 29 May 2017 13:29:19 +0200
Message-ID: <CACRpkdY=+ashj-uod=GuRG29FE1FXVRGvTLXJ3yH5Tp6q3-AfA@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-4-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:34891 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbdE2L3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:29:20 -0400
Received: by mail-io0-f173.google.com with SMTP id f102so39469583ioi.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 04:29:20 -0700 (PDT)
In-Reply-To: <1495701227-28809-4-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 25, 2017 at 10:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> When inserting and removing the module repeatedly (e.g. when running
> the libgpiod test-suite) the kernel log gets clobbered with messages
> reporting successful creation of dummy gpiochips.
>
> Remove this message and only emit logs when something bad happens.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
