From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/10] gpio: mockup: add prefixes to the direction enum
Date: Mon, 29 May 2017 13:28:37 +0200
Message-ID: <CACRpkdZCd02qCdW1JcnKUrUi7BLUDmfzPndHpXZrfmTFYNne=A@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl> <1495701227-28809-3-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:35736 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750871AbdE2L2j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:28:39 -0400
Received: by mail-io0-f174.google.com with SMTP id f102so39461697ioi.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 04:28:38 -0700 (PDT)
In-Reply-To: <1495701227-28809-3-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 25, 2017 at 10:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> All internal symbols except for the direction enum follow the same
> convention and use the gpio_mockup prefix. Add the prefix to the
> DIR_IN and DIR_OUT definitions as well for consistency across the
> file.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
