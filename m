From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] GPIO: Add GPIO support for the ACCES 104-IDIO-16
Date: Mon, 5 Oct 2015 17:47:36 -0500
Message-ID: <CAErSpo6F_ShDuR=7VKebhS=T3qtvYfQKxoM2x7C2NGYT=7n8RA@mail.gmail.com>
References: <20151001015832.GA11317@sophia> <CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34075 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752032AbbJEWr5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 18:47:57 -0400
Received: by wicfx3 with SMTP id fx3so141185078wic.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 15:47:56 -0700 (PDT)
In-Reply-To: <CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi William and Linus,

On Mon, Oct 5, 2015 at 3:29 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Oct 1, 2015 at 3:58 AM, William Breathitt Gray
> <vilhelm.gray@gmail.com> wrote:
>
>> The ACCES 104-IDIO-16 family of PC/104 utility boards
>
> Sounds like a PC104 keyboard :D
>
>> feature 16
>> optically isolated inputs and 16 optically isolated FET solid state
>> outputs. This driver provides GPIO support for these 32 channels of
>> digital I/O. Change-of-State detection interrupts are not supported.
>
> So it has IRQ support but it's not supported yet I take it.
>
>> GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
>> correspond to digital inputs 0-15.
>>
>> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>
>> +menu "ISA GPIO expanders"
>
> Interesting submenu. I guess it is proper to have so OK.
>
> Add:
> depends on PCI
>
> As they all will need that, I guess?

Why do they need PCI?  I don't see any PCI interfaces used here.

>> +menuconfig GPIO_104_IDIO_16
>> +       tristate "ACCES 104-IDIO-16 GPIO support"
>> +       help
>> +         Enables GPIO support for the ACCES 104-IDIO-16 family.
>> +
>> +config 104_IDIO_16_BASE
>> +       hex "ACCES 104-IDIO-16 base address"
>> +       depends on GPIO_104_IDIO_16
>> +       default 0x000
>
> This can't be right. PCI devices have their config space for a reason
> I'm told. On other platforms we use device tree or ACPI to set this
> up but PCI is either hotplug or wrong I think.
>
> The driver is full of ISA style inb/outb stuff, I get all confused. Why
> is this not using the PCI infrastructure?

I'm really not familiar with PC/104, but wikipedia claims it only uses
ISA.  Apparently PCI/104-Plus, PCI-104, PCI/104-Express, and PCIe/104
*do* have PCI and/or PCIe, but it looks like the base PC/104 does not.

Bjorn
