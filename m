From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/19] gpio: bcm-kona: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 10:56:45 +0100
Message-ID: <CACRpkdZ9RFa=akJedME2-qCKddjzkB5LdPpr2Zzhc1cWLCgsLg@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <77d635877e765a6b4b0935debfe5836e554572c0.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34732 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751756AbdCOJ4r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:56:47 -0400
Received: by mail-io0-f182.google.com with SMTP id b140so16612532iof.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:56:46 -0700 (PDT)
In-Reply-To: <77d635877e765a6b4b0935debfe5836e554572c0.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 9, 2017 at 5:21 PM, Julia Cartwright <julia@ni.com> wrote:

> The bcm-kona gpio driver currently implements an irq_chip for handling
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
