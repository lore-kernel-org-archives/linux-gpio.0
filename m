From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] GPIO: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 6 Oct 2015 09:14:47 +0200
Message-ID: <CACRpkdZe1bvQvqErQM+_Tii=4A15DSFOsRwH1r5qjmcb62WMPQ@mail.gmail.com>
References: <20151001015832.GA11317@sophia>
	<CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
	<CAErSpo6F_ShDuR=7VKebhS=T3qtvYfQKxoM2x7C2NGYT=7n8RA@mail.gmail.com>
	<5613038D.4050302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34175 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114AbbJFHOs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 03:14:48 -0400
Received: by oiev17 with SMTP id v17so103880340oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2015 00:14:48 -0700 (PDT)
In-Reply-To: <5613038D.4050302@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 6, 2015 at 1:11 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On 10/05/2015 06:47 PM, Bjorn Helgaas wrote:

>> I'm really not familiar with PC/104, but wikipedia claims it only uses
>> ISA.  Apparently PCI/104-Plus, PCI-104, PCI/104-Express, and PCIe/104
>> *do* have PCI and/or PCIe, but it looks like the base PC/104 does not.
>
> This is correct: PC/104 is only ISA.

OK then let's drop that confusing "PCI GPIO expanders" menu.

Maybe "ISA GPIO cards" or similar is more apropriate.

> The ACCES 104-IDIO-16 board is a
> PC/104 stackable GPIO board, whose port address is configured via
> physical jumper switches on the board; it is not "hotpluggable." For
> this reason, the CONFIG_104_IDIO_16_BASE option should be set to the
> same port address physically configured on the board.

I think the pattern in the kernel is to support such configuration for ISA
is with module parameters, not with compile-time constants. So switch
that base to use a module parameter.

Yours,
Linus Walleij
