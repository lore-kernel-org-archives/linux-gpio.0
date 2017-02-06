From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/7] gpio: mockup: add a dummy irqchip
Date: Mon, 6 Feb 2017 14:29:07 +0100
Message-ID: <CACRpkdbXmR_4-Acc2Pa27Svn5zny5UHF=mUuajDrUkQYhamTGg@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com> <1486383041-16758-6-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36395 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751473AbdBFN3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 08:29:09 -0500
Received: by mail-io0-f172.google.com with SMTP id j13so65164323iod.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 05:29:08 -0800 (PST)
In-Reply-To: <1486383041-16758-6-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 6, 2017 at 1:10 PM, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Setup a dummy irqchip that will allow us to inject line events for
> testing purposes.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is obviously exactly how we should do this.

However since it needs the devm* helpers from the irq
subsystem I can't apply them until the irqchip maintainers
merge or ack that patch.

If you want it in soon I suggest resending it with
non-memorymanaged accessors for the descs and later
make a separate patch to switch over to the devm_*
versions when/if it is accepted.

If you're not in a hurry, just wait :)

Yours,
Linus Walleij
