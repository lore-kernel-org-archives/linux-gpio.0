From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: em: depnd on ARCH_SHMOBILE
Date: Mon, 7 Nov 2016 10:01:59 +0100
Message-ID: <CACRpkdYC_fSPeJqaCK5ccH8b+4kb1kC8ateXojuYc2RzvW1qVA@mail.gmail.com>
References: <20161106185322.28372-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35616 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbcKGJCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 04:02:00 -0500
Received: by mail-qk0-f181.google.com with SMTP id n204so157622339qke.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2016 01:02:00 -0800 (PST)
In-Reply-To: <20161106185322.28372-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Nov 6, 2016 at 7:53 PM, Peter Robinson <pbrobinson@gmail.com> wrote:

> The GPIO_EM is part of the Renesas SoCs so depend on the arch.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

What about also enabling COMPILE_TEST?

Yours,
Linus Walleij
