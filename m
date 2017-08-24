From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Thu, 24 Aug 2017 21:52:02 +0200
Message-ID: <CACRpkda52Ci1vreCUUPZbJHOk3yZOT0X1wgUS-J4CbnNvho_9A@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
 <CACRpkdaa7JXhjgGxG=eMZxh2kfC3MJ4O_Sc5h5qZsmL5sWNVmg@mail.gmail.com> <1503508187.2484.9.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35863 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753041AbdHXTwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2017 15:52:04 -0400
Received: by mail-oi0-f45.google.com with SMTP id r9so4444137oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2017 12:52:03 -0700 (PDT)
In-Reply-To: <1503508187.2484.9.camel@wdc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bart Van Assche <Bart.VanAssche@wdc.com>
Cc: "lukas@wunner.de" <lukas@wunner.de>, "agk@redhat.com" <agk@redhat.com>, "phil@raspberrypi.org" <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "m.duckeck@kunbus.de" <m.duckeck@kunbus.de>, "snitzer@redhat.com" <snitzer@redhat.com>

On Wed, Aug 23, 2017 at 7:09 PM, Bart Van Assche <Bart.VanAssche@wdc.com> wrote:
> On Wed, 2017-08-23 at 09:32 +0200, Linus Walleij wrote:
>> Can someone explain when I use the bitop_foo() and when I
>> use the __bitop_foo(). I am asking so I can understand patch
>> 2/4 in this series.
>
> That's easy. From Documentation/core-api/atomic_ops.rst:
>
> ----------------------------------------------------------------------
> Finally, there are non-atomic versions of the bitmask operations
> provided.  They are used in contexts where some other higher-level SMP
> locking scheme is being used to protect the bitmask, and thus less
> expensive non-atomic operations may be used in the implementation.
> They have names similar to the above bitmask operation interfaces,
> except that two underscores are prefixed to the interface name. ::
>
>         void __set_bit(unsigned long nr, volatile unsigned long *addr);
>         void __clear_bit(unsigned long nr, volatile unsigned long *addr);
>         void __change_bit(unsigned long nr, volatile unsigned long *addr);
>         int __test_and_set_bit(unsigned long nr, volatile unsigned long *addr);
>         int __test_and_clear_bit(unsigned long nr, volatile unsigned long *addr);
>         int __test_and_change_bit(unsigned long nr, volatile unsigned long *addr);
>
> These non-atomic variants also do not require any special memory
> barrier semantics.

All right that makes sense.

On Rusty Russell's API ladder
http://sweng.the-davies.net/Home/rustys-api-design-manifesto
this scores 3/10 "read the documentation and you will get
it right".

We could raise it to 6-7 by renaming them all
set_bit_nonatomic() etc (or even set_bit_na()), I almost feel like
sending a script to Torvalds to do that after the merge window, but I
fear some people would beat me up for it.

Yours,
Linus Walleij
