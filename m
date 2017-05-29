From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Mon, 29 May 2017 13:55:57 +0200
Message-ID: <CACRpkdbkEnLpZtLKz+x6FLQZTdsyxKsFexFa_UQwNxgZJGDExQ@mail.gmail.com>
References: <alpine.DEB.2.20.1705232307330.2409@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:36131 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdE2Lz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 07:55:59 -0400
Received: by mail-it0-f50.google.com with SMTP id o5so25791110ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 04:55:59 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.20.1705232307330.2409@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Ken Xue <Ken.Xue@amd.com>

On Tue, May 23, 2017 at 11:23 PM, Thomas Gleixner <tglx@linutronix.de> wrote:

> The AMD pinctrl driver uses a chained interrupt to demultiplex the GPIO
> interrupts. Kevin Vandeventer reported, that his new AMD Ryzen locks up
> hard on boot when the AMD pinctrl driver is initialized. The reason is an
> interrupt storm. It's not clear whether that's caused by hardware or
> firmware or both.
>
> Using chained interrupts on X86 is a dangerous endavour. If a system is
> misconfigured or the hardware buggy there is no safety net to catch an
> interrupt storm.
>
> Convert the driver to use a regular interrupt for the demultiplex
> handler. This allows the interrupt storm detector to catch the malfunction
> and lets the system boot up.
>
> This should be backported to stable because it's likely that more users run
> into this problem as the AMD Ryzen machines are spreading.
>
> Reported-by: Kevin Vandeventer
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1034261
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Patch applied for fixes.

Hm, I wonder if there is a bunch of other x86 drivers that should just
request the IRQ?

Yours,
Linus Walleij
