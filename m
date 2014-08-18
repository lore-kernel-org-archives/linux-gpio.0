From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Bring a new x86_64 device to Linux
Date: Mon, 18 Aug 2014 09:03:59 -0700
Message-ID: <CAAVeFuKws9MgVUoB0-SDJ5fMx-gaorhpOkf8_RRifD8fdWLpHA@mail.gmail.com>
References: <CA+_PYyuy_4Y+YfVnW7yPLP2AA6vbpqvwLaW7w5PyKHxVDhaD8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:58666 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbaHRQEU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Aug 2014 12:04:20 -0400
Received: by mail-ig0-f174.google.com with SMTP id c1so8542628igq.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2014 09:04:19 -0700 (PDT)
In-Reply-To: <CA+_PYyuy_4Y+YfVnW7yPLP2AA6vbpqvwLaW7w5PyKHxVDhaD8Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Agron Selimaj <as9902613@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 18, 2014 at 8:59 AM, Agron Selimaj <as9902613@gmail.com> wrote:
> Hello,
>
> I am making a GPIO driver for a custom x86_64 motherboard.
>
> It came with a windows driver which is fairly simple but before
> reading or witting to a certain GPIO pin I have to keep reading an
> other ioport with inb() until GPIO data is ready.
>
> However, I need to make sure this is the right motherboard so I am
> reading a 10 byte string where the model information is located, but
> just before I read the last byte the kernel is killing my kernel
> module and marking it as tainted. Why would this happen?

Backtrace, module source code?

> I also noticed that detection and probing is now done using platform
> drivers on ARM platform. I would like to follow the same on x86_64 but
> I don't find any documentation/examples to help me.

Documentation/driver-model/platform.txt should be a good start.
