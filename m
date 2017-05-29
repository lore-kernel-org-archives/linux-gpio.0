From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/10] gpio: mockup: fix direction values
Date: Mon, 29 May 2017 13:27:43 +0200
Message-ID: <CACRpkdY5Oo3E8gEde4Q2LQHNES7mGhcaoXVrqqRoeT6DorjqNA@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-2-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35487 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750871AbdE2L1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:27:45 -0400
Received: by mail-it0-f46.google.com with SMTP id c15so25490023ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 04:27:45 -0700 (PDT)
In-Reply-To: <1495701227-28809-2-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 25, 2017 at 10:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> The comment in linux/gpio/driver.h says:
>
>  @get_direction: returns direction for signal "offset", 0=out, 1=in
>
> We got those switched at some point. Fix the values.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
