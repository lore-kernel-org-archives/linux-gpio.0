From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: gpio-mxc: Fix: higher 16 GPIOs usable as wake source
Date: Tue, 1 Aug 2017 10:37:59 +0200
Message-ID: <CACRpkdbqugHn8A4qU=2tX256RxBf2GGEfoDrCsX2GdWrOcs4dw@mail.gmail.com>
References: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de> <1499848600-7233-2-git-send-email-p.rosenberger@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35975 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbdHAIiB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 04:38:01 -0400
Received: by mail-it0-f46.google.com with SMTP id 77so4356373itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 01:38:00 -0700 (PDT)
In-Reply-To: <1499848600-7233-2-git-send-email-p.rosenberger@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Rosenberger <p.rosenberger@linutronix.de>, Vladimir Zapolskiy <vz@mleia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Wed, Jul 12, 2017 at 10:36 AM, Philipp Rosenberger
<p.rosenberger@linutronix.de> wrote:

> In the function gpio_set_wake_irq(), port->irq_high is only checked for
> zero. As platform_get_irq() returns a value less then zero if no interrupt
> was found, any gpio >= 16 was handled like an irq_high interrupt was
> available. On iMX27 for example no high interrupt is available. This lead
> to the problem that only some gpios (the lower 16) were useable as wake
> sources.
>
> Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>

That looks like a clear bug, patch applied for fixes.

Yours,
Linus Walleij
