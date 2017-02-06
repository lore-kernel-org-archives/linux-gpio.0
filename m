From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 0/7] gpio: mockup: extensions for testing purposes
Date: Mon, 6 Feb 2017 13:12:40 +0100
Message-ID: <CAMpxmJUiyYz_38hf=X66cm0f5ZB0sKvk2j9p0Zhe6ff+r+wGZg@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34684 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751903AbdBFMMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 07:12:41 -0500
Received: by mail-io0-f182.google.com with SMTP id l66so63908971ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 04:12:41 -0800 (PST)
In-Reply-To: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

2017-02-06 13:10 GMT+01:00 Bartosz Golaszewski <bgolaszewski@baylibre.com>:
> I would like to create an automated test-suite for libgpiod, but
> the gpio-mockup driver is quite limited when it comes to current
> user space functionality - I can't test neither line event
> notifications nor finding GPIO lines by name.
>
> This series proposes to extend the gpio framework by allowing to
> inject line events from the kernel code and by providing a debugfs
> interface for that to the gpio-mockup driver. We also allow the
> user to request that the mockup driver name the lines.
>
> The first two patches only contain coding style changes which, I
> believe, will make the driver easier to maintain.
>
> The third patch adds the option to have the lines named.
>
> The fourth patch adds a devres flavor of irq_alloc_descs() to be used
> in patch 5, which actually adds the dummy irqchip.
>
> The last two patches implement the debugfs directory structure that
> can be used by the user space to inject line events.
>
> v1 -> v2:
> - made the event injection self-contained within the driver by using
>   the irq_work as suggested by Lars-Peter Clauses

s/ Lars-Peter Clauses/ Lars-Peter Clausen/

sorry!

Thanks,
Bartosz
