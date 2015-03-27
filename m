From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] MIPS: Cleanup Loongson-2F's gpio driver
Date: Fri, 27 Mar 2015 11:29:08 +0100
Message-ID: <CACRpkdZRr4yLxQy0rps7cqyei519nhL4PXAqnG=zGxLaNK=Ofg@mail.gmail.com>
References: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33851 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751284AbbC0K3I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 06:29:08 -0400
Received: by oigz129 with SMTP id z129so27471633oig.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 03:29:08 -0700 (PDT)
In-Reply-To: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>

On Thu, Mar 26, 2015 at 3:34 AM, Huacai Chen <chenhc@lemote.com> wrote:

> This cleanup is prepare to move the driver to drivers/gpio. Custom
> definitions of gpio_get_value()/gpio_set_value() are dropped.
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Looks neat, and I do want to collect GPIO drivers into drivers/gpio if
possible.

Can I take this patch in the GPIO tree or do you want it in
through the MIPS tree?

In the latter case Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
