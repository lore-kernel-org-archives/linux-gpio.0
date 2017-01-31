From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/7] gpiolib: allow injecting line events
Date: Tue, 31 Jan 2017 14:24:44 +0100
Message-ID: <CACRpkdZZCAhjXrv=GT+t+bLXHi4jd5c1eOvw=POzEPKopQD4VQ@mail.gmail.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com> <1485358461-24070-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36795 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752090AbdAaNb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 08:31:57 -0500
Received: by mail-oi0-f45.google.com with SMTP id u143so213920062oif.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 05:31:49 -0800 (PST)
In-Reply-To: <1485358461-24070-5-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 25, 2017 at 4:34 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Implement a routine visible inside the drivers/gpio directory, that
> allows to inject line events for testing/debugging purposes.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hm OK it is clever, but would also need #ifdef.

Also this kludge would go away if we had a real mockup
irqchip...

Yours,
Linus Walleij
