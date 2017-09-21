From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: thunderx: remove unused .map() hook from irq_domain_ops
Date: Thu, 21 Sep 2017 13:30:28 +0200
Message-ID: <CACRpkdbEvV8H=QPqp+zcN6sN8NfPRUGcSmhfSL1+2vwSG_ijYA@mail.gmail.com>
References: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:55434 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751450AbdIULa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 07:30:29 -0400
Received: by mail-it0-f42.google.com with SMTP id 4so219043itv.4
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 04:30:29 -0700 (PDT)
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

Waiting for David to test this patch before applying.

Yours,
Linus Walleij
