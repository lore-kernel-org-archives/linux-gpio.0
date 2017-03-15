From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 19/19] pinctrl: sunxi: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 11:14:13 +0100
Message-ID: <CACRpkdb=mpYxABtkjD4s1+jAPCsLvMNrJpbCOQ6On7sFUkvtww@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <6b509f22ec93562892e787507e62137cee7c9114.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36820 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751642AbdCOKOP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 06:14:15 -0400
Received: by mail-io0-f172.google.com with SMTP id l7so16729294ioe.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 03:14:14 -0700 (PDT)
In-Reply-To: <6b509f22ec93562892e787507e62137cee7c9114.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Mar 9, 2017 at 5:22 PM, Julia Cartwright <julia@ni.com> wrote:

> The sunxi pinctrl driver currently implement an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
> Signed-off-by: Julia Cartwright <julia@ni.com>

Patch applied.

Yours,
Linus Walleij
