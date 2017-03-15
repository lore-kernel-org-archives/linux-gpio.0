From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/19] gpio: ath79: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 10:59:08 +0100
Message-ID: <CACRpkdZKgTrRj+MJf8f3mi9bvKPn1ZzVG0L2SHLzk3UQZUZFvw@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <1774d7bad8bbc672372480f540dfc8f3d1592533.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:35135 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751573AbdCOJ7K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 05:59:10 -0400
Received: by mail-it0-f43.google.com with SMTP id m27so62710253iti.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 02:59:09 -0700 (PDT)
In-Reply-To: <1774d7bad8bbc672372480f540dfc8f3d1592533.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Alban Bedel <albeu@free.fr>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 9, 2017 at 5:21 PM, Julia Cartwright <julia@ni.com> wrote:

> The ath79 gpio driver currently implements an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
> Signed-off-by: Julia Cartwright <julia@ni.com>

Patch applied with Alban's ACK.

Yours,
Linus Walleij
