From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: GPIO IN LINUX KERENL 4.8
Date: Wed, 9 Nov 2016 09:25:30 +0100
Message-ID: <CACRpkdbqRmtXbQePWuGkfksS=act-01zwjcwmZtPrf5=gzC1+A@mail.gmail.com>
References: <CAGyKHxLN+oV485upVkBp-fL2=4aO6Q_29jzSCFCdCsetj=FW-A@mail.gmail.com>
 <CAGyKHxK7+CGhd_P0An0Ja4iFSP=Rez9bdsLnzs122BCrw8ZiHQ@mail.gmail.com>
 <CAGyKHx+F_M3_nsC=GPn2fkrZg8CPedTPv4iZMQnAa9aSU3=Pmw@mail.gmail.com>
 <CAGyKHx+MWr17X7vAFo9y4fV+S+29o52+AqLAk4h9kPQ8r8D81Q@mail.gmail.com>
 <CAGyKHxLtsFwxK9C2BQp5BLH-5wNMvma2MA3ROKVna2u938Th+g@mail.gmail.com>
 <CAGyKHxKppFcC-QEv0LrvLdn+eyPW26yZyKm8sLk9KTcNMhyBXA@mail.gmail.com>
 <CAGyKHxJuHwy37aeOKmajjN66GdxCr1CTfp004mF5_PqG2mW6kw@mail.gmail.com>
 <CAGyKHx+2g4S=spaqQnB4AH+WMbqNBkyc5c-dm0txvFEFVY5Y6w@mail.gmail.com>
 <CAGyKHxJXQBC9qRa9h25GiBwuiEya1j73N4zNhGE0qb=YzVXzNg@mail.gmail.com>
 <CAGyKHxLTqTBMd42EVKGVp2VSQHk9nixvfApqqO7Z8AJw_A9wCw@mail.gmail.com>
 <CAGyKHxK6ng1wnWDdr=VxrbUyOZQT5hfvPLTHoZp8ZuQED85fqw@mail.gmail.com> <CAGyKHxL+Hf70c4+_oeO-4nVEH_iqSL5yn7MWdp1LGjZntNHzBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35481 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcKIIZb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2016 03:25:31 -0500
Received: by mail-qk0-f181.google.com with SMTP id n204so237085965qke.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2016 00:25:31 -0800 (PST)
In-Reply-To: <CAGyKHxL+Hf70c4+_oeO-4nVEH_iqSL5yn7MWdp1LGjZntNHzBg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rahul Mahajan <rahulcmahajan.84@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 8, 2016 at 7:18 PM, Rahul Mahajan
<rahulcmahajan.84@gmail.com> wrote:

> 1) why we remove gpio system not uses /sys/class/gpio. ?

Class devices are generally deprecated in favor of bus devices.
(Source: Greg Kroah-Hartman.)

The new devices appear in /sys/bus/gpio/*

> 2) if i want to use old kernel gpio driver with linux 4.8 driver. So how to
> port because any impact with other system or api change.

You should submit your drivers to the upstream Linux kernel
so you do not face the situation of maintaining out-of-tree code.
The changes made to the kernel for drivers recently are detailed
in that talk. Further consult this document:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/stable_api_nonsense.txt

> 3) Old Approach is very easy just we give export through /sys  and how to
> exoort from user space?

The new ABI does not use exporting. It uses anonymous file handles,
and GPIOs are marked for userspace use on-demand.

It could be argued that the sysfs ABI is "easy" but is it really?
If your script or program using a few exported GPIOs crashes,
the exported GPIOs are never unexported and you have a leak
that you need to work around with more scripts. And that is not
"easy".

> Hello Linus,
>
> Can you please reply on my question?

Take it easy, I have lots of stuff to do.

Yours,
Linus Walleij
