From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/7] irqdesc: add memory managed version of irq_alloc_descs()
Date: Mon, 6 Feb 2017 14:26:42 +0100
Message-ID: <CACRpkdbc5zfD7GQmi1EU0oTMhnrEksHnuAZxECzC-H-DMBqfLg@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com> <1486383041-16758-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34584 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdBFN0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 08:26:43 -0500
Received: by mail-io0-f174.google.com with SMTP id l66so65232271ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 05:26:43 -0800 (PST)
In-Reply-To: <1486383041-16758-5-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 6, 2017 at 1:10 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Add a devres flavor of __devm_irq_alloc_descs() and corresponding
> helper macros.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Oh that was interesting. I will leave the IRQ subsystems specific
review to Thomas and Marc, but I think you need to also update
Documentation/driver-model/devres.txt
where you find a long list of all memorymanaged API calls.

Maybe the list is a bit silly actually, but anyway.

Yours,
Linus Walleij
