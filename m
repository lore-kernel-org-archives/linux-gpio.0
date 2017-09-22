From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: thunderx: remove unused .map() hook from irq_domain_ops
Date: Fri, 22 Sep 2017 15:32:58 +0200
Message-ID: <CACRpkdbTrA16oRU_2cm_qyfdFy05PrdsSaZqULMdsm-CQsOyqQ@mail.gmail.com>
References: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:53127 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbdIVNc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 09:32:59 -0400
Received: by mail-it0-f43.google.com with SMTP id c195so1306839itb.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 06:32:59 -0700 (PDT)
In-Reply-To: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Daney <david.daney@cavium.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 14, 2017 at 4:37 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This driver implements .alloc() hook, so .map() is not used.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with David's Tested-by.

Yours,
Linus Walleij
