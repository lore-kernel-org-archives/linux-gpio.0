From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: em: depnd on ARCH_SHMOBILE
Date: Tue, 22 Nov 2016 10:23:26 +0100
Message-ID: <CACRpkdbBMzU02NXpu7tes5V7JQkfcVUm7KCGOYgbSLj8LOhBDw@mail.gmail.com>
References: <20161120174836.1787-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:36262 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754825AbcKVJX1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2016 04:23:27 -0500
Received: by mail-qk0-f173.google.com with SMTP id n21so14371216qka.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Nov 2016 01:23:27 -0800 (PST)
In-Reply-To: <20161120174836.1787-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Nov 20, 2016 at 6:48 PM, Peter Robinson <pbrobinson@gmail.com> wrote:

> The GPIO_EM is part of the Renesas SoCs so depend on the arch.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Patch applied.

Yours,
Linus Walleij
