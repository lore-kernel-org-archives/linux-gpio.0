From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 7/9] gpio: 104-idi-48: make use of raw_spinlock variants
Date: Tue, 28 Mar 2017 14:55:57 +0200
Message-ID: <CACRpkdYUMOdCGWz0+-4BFLDiOGPXf_8-r4oJb8eGgkb2FMumWw@mail.gmail.com>
References: <cover.1490135047.git.julia@ni.com> <a9b84439c28b96a9b6a4cbfca85f1e13a457d25d.1490135047.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:35748 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755922AbdC1M5O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 08:57:14 -0400
Received: by mail-it0-f44.google.com with SMTP id y18so110748539itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 05:56:22 -0700 (PDT)
In-Reply-To: <a9b84439c28b96a9b6a4cbfca85f1e13a457d25d.1490135047.git.julia@ni.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-rt-users@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 21, 2017 at 11:43 PM, Julia Cartwright <julia@ni.com> wrote:

> The 104-idi-48 gpio driver currently implements an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
> Signed-off-by: Julia Cartwright <julia@ni.com>
> ---
> New patch as of v2 of series.

Patch applied with William's ACK.

Yours,
Linus Walleij
