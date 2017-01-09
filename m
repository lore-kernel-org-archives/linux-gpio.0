From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 2/3] serial: exar: split out the exar code from 8250_pci
Date: Mon, 9 Jan 2017 02:50:59 +0200
Message-ID: <CAHp75VeGcHp6GCtZ=-XLbkkLncj3pD-2gM7+zogm2yc172FAhw@mail.gmail.com>
References: <1483914727-6076-1-git-send-email-sudipm.mukherjee@gmail.com>
 <1483914727-6076-2-git-send-email-sudipm.mukherjee@gmail.com> <CAHp75VficfU+BTgW_Mm_UTC8oDKJA0yxrUz_PBY=w4jT2LFbMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:36078 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758441AbdAIAvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Jan 2017 19:51:00 -0500
In-Reply-To: <CAHp75VficfU+BTgW_Mm_UTC8oDKJA0yxrUz_PBY=w4jT2LFbMA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

On Mon, Jan 9, 2017 at 2:14 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Port number is easily to get from device ID, I already said this.
> nr = subvendor == PCI_VENDOR_ID_IBM ? 1 : device & 0x0f;

Gave one more thought and using

nr = num_ports ? num_ports : device & 0x0f;

will allow you to use even in the v35 setup.

-- 
With Best Regards,
Andy Shevchenko
