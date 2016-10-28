From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpio/mvebu: convert to use irq_domain_add_simple()"
Date: Fri, 28 Oct 2016 14:24:27 +0200
Message-ID: <CACRpkdaWQCEJjNpAVSFeJVFPX9HVLeduLj+cOpSH7Y3CX8gWog@mail.gmail.com>
References: <1476831396-24359-1-git-send-email-jgunthorpe@obsidianresearch.com>
 <871szcerxl.fsf@free-electrons.com> <20161019210341.GA3746@obsidianresearch.com>
 <CACRpkdatYim3=tKeO-E1GazB7RV9XPdE-EBQs+FW+DrryATzRA@mail.gmail.com> <87twbyb65j.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:36771 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753763AbcJ1MY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2016 08:24:29 -0400
Received: by mail-qt0-f173.google.com with SMTP id 12so43159576qtm.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2016 05:24:28 -0700 (PDT)
In-Reply-To: <87twbyb65j.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Grant Likely <grant.likely@secretlab.ca>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Thu, Oct 27, 2016 at 9:30 AM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
>  On lun., oct. 24 2016, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Oct 19, 2016 at 11:03 PM, Jason Gunthorpe
>> <jgunthorpe@obsidianresearch.com> wrote:
>>
>>> From 7566f05ac445b652ba7607cc1899fed10fea1c76 Mon Sep 17 00:00:00 2001
>>> From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
>>> Date: Wed, 19 Oct 2016 14:57:45 -0600
>>> Subject: [PATCH] gpio/mvebu: Use irq_domain_add_linear
>>>
>>> This fixes the irq allocation in this driver to not print:
>>>  irq: Cannot allocate irq_descs @ IRQ34, assuming pre-allocated
>>>  irq: Cannot allocate irq_descs @ IRQ66, assuming pre-allocated
>>>
>>> Which happens because the driver already called irq_alloc_descs()
>>> and so the change to use irq_domain_add_simple resulted in calling
>>> irq_alloc_descs() twice.
>>>
>>> Modernize the irq allocation in this driver to use the
>>> irq_domain_add_linear flow directly and eliminate the use of
>>> irq_domain_add_simple/legacy
>>>
>>> Fixes: ce931f571b6d ("gpio/mvebu: convert to use irq_domain_add_simple()")
>>> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
>>
>> So can I just apply this?
>> Gregory?
>
> For me it's OK.

APplied this inline version.

Yours,
Linus Walleij
