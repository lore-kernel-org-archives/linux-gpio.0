From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: GPIO IN LINUX KERENL 4.8
Date: Fri, 18 Nov 2016 08:09:49 +0100
Message-ID: <CACRpkdbLkLcR2uf8TKWogtmhLbDgLefGPvCqd7-XyA7c09grZQ@mail.gmail.com>
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
 <CAGyKHxK6ng1wnWDdr=VxrbUyOZQT5hfvPLTHoZp8ZuQED85fqw@mail.gmail.com>
 <CAGyKHxL+Hf70c4+_oeO-4nVEH_iqSL5yn7MWdp1LGjZntNHzBg@mail.gmail.com>
 <CACRpkdbqRmtXbQePWuGkfksS=act-01zwjcwmZtPrf5=gzC1+A@mail.gmail.com>
 <CAGyKHx+_gGt-Bn7S4oE21u1nY5QBpG0pSzg+oth3+QxYYdjMfA@mail.gmail.com>
 <CAGyKHxLge3XUO3f9DHZ+5YhnODrexXZ-voB2PGJg-QNOZ2+wdA@mail.gmail.com>
 <CAGyKHx+-+m+mDpmXW69RRnA2wWgqUcxDm2RvxXT2LEofkMB1VA@mail.gmail.com> <CACRpkdbpqWNYAiFvVu-utua4xH2_6tAk+mkE01-Fx5z6vh9uWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:34931 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbcKRHJv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2016 02:09:51 -0500
Received: by mail-qt0-f174.google.com with SMTP id c47so151170523qtc.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2016 23:09:50 -0800 (PST)
In-Reply-To: <CACRpkdbpqWNYAiFvVu-utua4xH2_6tAk+mkE01-Fx5z6vh9uWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rahul Mahajan <rahulcmahajan.84@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 17, 2016 at 9:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 17, 2016 at 12:01 PM, Rahul Mahajan
> <rahulcmahajan.84@gmail.com> wrote:
>
>> Can you please tell ,
>> 1) i need to change modify pin control for gpio then how to do that ?
>
> Like any other driver? I don't understand the question. You have
> to be more specific.

I understand the question now, after private mail.

There are two clasess of pin control/GPIO interaction:

- Drivers where GPIO and pin control is orthogonal: there the
  pin control settings in device tree or similar, that configure the
  pin to be used as GPIO.

- Drivers where GPIO and pin control interact, so the GPIO
  driver calls back into the pin controller using GPIO ranges
  and the pin controller driver has a set of special callbacks
  to configure the line as GPIO.

Yours,
Linus Walleij
