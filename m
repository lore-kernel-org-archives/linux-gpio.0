From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpio/mvebu: convert to use irq_domain_add_simple()"
Date: Mon, 24 Oct 2016 01:11:23 +0200
Message-ID: <CACRpkdatYim3=tKeO-E1GazB7RV9XPdE-EBQs+FW+DrryATzRA@mail.gmail.com>
References: <1476831396-24359-1-git-send-email-jgunthorpe@obsidianresearch.com>
 <871szcerxl.fsf@free-electrons.com> <20161019210341.GA3746@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:34918 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753636AbcJWXLZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Oct 2016 19:11:25 -0400
Received: by mail-qk0-f170.google.com with SMTP id z190so214319594qkc.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Oct 2016 16:11:24 -0700 (PDT)
In-Reply-To: <20161019210341.GA3746@obsidianresearch.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Grant Likely <grant.likely@secretlab.ca>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Wed, Oct 19, 2016 at 11:03 PM, Jason Gunthorpe
<jgunthorpe@obsidianresearch.com> wrote:

> From 7566f05ac445b652ba7607cc1899fed10fea1c76 Mon Sep 17 00:00:00 2001
> From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> Date: Wed, 19 Oct 2016 14:57:45 -0600
> Subject: [PATCH] gpio/mvebu: Use irq_domain_add_linear
>
> This fixes the irq allocation in this driver to not print:
>  irq: Cannot allocate irq_descs @ IRQ34, assuming pre-allocated
>  irq: Cannot allocate irq_descs @ IRQ66, assuming pre-allocated
>
> Which happens because the driver already called irq_alloc_descs()
> and so the change to use irq_domain_add_simple resulted in calling
> irq_alloc_descs() twice.
>
> Modernize the irq allocation in this driver to use the
> irq_domain_add_linear flow directly and eliminate the use of
> irq_domain_add_simple/legacy
>
> Fixes: ce931f571b6d ("gpio/mvebu: convert to use irq_domain_add_simple()")
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

So can I just apply this?
Gregory?

Yours,
Linus Walleij
