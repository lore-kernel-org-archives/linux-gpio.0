From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: mockup: use irq_sim
Date: Sun, 13 Aug 2017 14:16:00 +0200
Message-ID: <CACRpkdaaNdOz-gAZRKbhE60wj0N7wEWWT3eNXK79iZ0wfXBhqg@mail.gmail.com>
References: <20170801145028.7558-1-brgl@bgdev.pl> <20170801145028.7558-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:34444 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752457AbdHMMQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Aug 2017 08:16:02 -0400
Received: by mail-it0-f41.google.com with SMTP id m34so7326883iti.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Aug 2017 05:16:01 -0700 (PDT)
In-Reply-To: <20170801145028.7558-4-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>

On Tue, Aug 1, 2017 at 4:50 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Shrink the driver by removing the code dealing with dummy interrupts
> and replacing it with calls to the irq_sim API.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Tglx/Marc: feel free to merge this with the rest into the irqchip tree.

Yours,
Linus Walleij
