From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 3/7] gpio: brcmstb: switch to handle_level_irq flow
Date: Tue, 3 Oct 2017 18:59:51 -0700
Message-ID: <CADtm3G5VBDZd9Z-QFCEJnUvprVB2coub0u2OjNg9qMh-B-Zt7A@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-4-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:55049 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdJDCAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 22:00:23 -0400
In-Reply-To: <20170930034057.15166-4-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 29, 2017 at 8:40 PM, Doug Berger <opendmb@gmail.com> wrote:
> Reading and writing the gpio bank status register each time a pending
> interrupt bit is serviced could cause new pending bits to be cleared
> without servicing the associated interrupts.
>
> By using the handle_level_irq flow instead of the handle_simple_irq
> flow we get proper handling of interrupt masking as well as acking
> of interrupts.  The irq_ack method is added to support this.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
