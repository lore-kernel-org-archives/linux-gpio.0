From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Sat, 7 Oct 2017 12:39:16 +0200
Message-ID: <CACRpkdYFct4VWe7AUJR_CCw25bRQDjSLCgDb1phMaTKuNz6bxA@mail.gmail.com>
References: <AM5PR0701MB2657A33A85F675C4A0175CE0E4670@AM5PR0701MB2657.eurprd07.prod.outlook.com>
 <CACRpkda39LU8hynYtnMyKxm+A8Behkam8CWBTSkt+0U_Fw_VtQ@mail.gmail.com> <8da7f1f2-7934-0b88-6eb1-8cdce8d5a7ea@hotmail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:52108 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750990AbdJGKjR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 06:39:17 -0400
Received: by mail-it0-f41.google.com with SMTP id o135so100764itb.0
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 03:39:16 -0700 (PDT)
In-Reply-To: <8da7f1f2-7934-0b88-6eb1-8cdce8d5a7ea@hotmail.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Sep 30, 2017 at 3:15 PM, Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:
> On 09/27/17 02:20, Linus Walleij wrote:
>> On Fri, Sep 22, 2017 at 8:41 PM, Bernd Edlinger

> Though I must admit, that I have copied most of this code verbatim
> from gpio-dwapb.c ;)

All right, so then we need to keep this in mind in the future, we are going
to see more of these kind of layouts.

>> Please read Thierry's proposed changes that I will merge as soon as
>> he respins them, he creates a "bank" abstraction for gpiolib:
>> https://marc.info/?l=linux-gpio&m=150429237121695&w=2
>>
>> I strongly feel you should use this infrastructure, even if Thierry's work
>> is much centered around being able to have per-bank IRQs.
>>
>
> I hope that does not mean both ports have to share the same
> interrupt spin lock.  While it is necessary to synchronize write
> accesses to the same port, this driver has no need to synchronize
> with the other port.
>
> Interesting point is that this patch does not touch gpio-dwapb.c
> at all.  Although gpio-dwapb.c has even irq support.

It came up, and it is pretty evident that when we add a port/bank abstraction
it should be possible to reuse with dwapb as well, we need to cover a
few basic cases like that.

> I have probably never tested the unregister code path at all.

You can do this in sysfs using the "bind" and "unbind"
files. Echo the bus ID into these to unbind/bind the driver.

> From 223be945bf0a7d7d4bc979eccd77075b0a447ece Mon Sep 17 00:00:00 2001
> From: Bernd Edlinger <bernd.edlinger@hotmail.de>
> Date: Thu, 21 Sep 2017 15:50:36 +0200
> Subject: [PATCH] Add a GPIO driver for Altera FPGA Manager Fabric I/O.

Just resend the patch with a v2 suffix after PATCH.

Else I get confused!

Yours,
Linus Walleij
