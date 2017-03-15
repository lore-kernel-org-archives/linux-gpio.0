From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/19] gpio: etraxfs: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 11:00:12 +0100
Message-ID: <CACRpkdatFAgVWmzGBz9b0sZPK67JTgm5Z1meU6ZicLMs=iNOYA@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <c4411b58e928a3c2cf0375342051a31d71190eb5.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:33891 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751885AbdCOKAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 06:00:15 -0400
Received: by mail-io0-f170.google.com with SMTP id b140so16659739iof.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 03:00:14 -0700 (PDT)
In-Reply-To: <c4411b58e928a3c2cf0375342051a31d71190eb5.1489015238.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>, Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 9, 2017 at 5:21 PM, Julia Cartwright <julia@ni.com> wrote:

> The etraxfs gpio driver currently implements an irq_chip for handling
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
