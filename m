From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: max732x: Fix irq-events handler
Date: Wed, 6 May 2015 15:09:45 +0200
Message-ID: <CACRpkdZqftDFEaXTFYV=9hmoCmDH+FDmNHdMN9_Se9dgiuc7xQ@mail.gmail.com>
References: <1429708841-31189-1-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35818 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751947AbbEFNJq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 09:09:46 -0400
Received: by oign205 with SMTP id n205so6696546oig.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2015 06:09:45 -0700 (PDT)
In-Reply-To: <1429708841-31189-1-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@globallogic.com>

On Wed, Apr 22, 2015 at 3:20 PM, Semen Protsenko
<semen.protsenko@globallogic.com> wrote:

> MAX732X clears all pending interrupts on I2C read (when interrupts
> register is being read). Driver doesn't need to send any ACKs when
> interrupt was handled. So replace handle_edge_irq() with
> handle_simple_irq().
>
> Using handle_edge_irq() (w/o .irq_ack callback set) may lead to NULL
> pointer dereference in some cases. E.g. this was observed on
> hibernation process:
>
>   Unable to handle kernel NULL pointer dereference at virtual address 0
>   Backtrace:
>   (handle_edge_irq) from (resend_irqs)
>   (resend_irqs) from (tasklet_action)
>   (tasklet_action) from (__do_softirq)
>   (__do_softirq) from (run_ksoftirqd)
>   (run_ksoftirqd) from (smpboot_thread_fn)
>   (smpboot_thread_fn) from (kthread)
>   (kthread) from (ret_from_fork)
>
> Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>

Patch applied with Grygorii's Review tag.

Yours,
Linus Walleij
