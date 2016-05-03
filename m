From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Mon, 2 May 2016 20:23:22 -0700
Message-ID: <CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
	<CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:38902 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755238AbcECDXX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 23:23:23 -0400
Received: by mail-ig0-f172.google.com with SMTP id m9so9610539ige.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 20:23:23 -0700 (PDT)
In-Reply-To: <CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

Hi

On Sun, May 1, 2016 at 11:30 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, May 1, 2016 at 4:36 PM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
>> On Sun, May 1, 2016 at 1:38 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Sun, May 1, 2016 at 2:33 AM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
>
>> Starting from 4.2/4.3 kernel release I see numerous problems with this
>> driver. For example there are regular crashes at the boot time when
>> tries to load this driver https://goo.gl/photos/fGk2U6PgUFtxUk9w5    I
>> have to stick with Arch 4.1 kernel that does not have this problem.
>
> Hm atleast it is not due to my recent refactorings of GPIO then.
>
> Any chance you can run a bisect and nail the commit?

I compiled lynx gpio into kernel instead of compiling it as a module.
And the system got more stable - I rebooted my devices ~50 times
already and I do not see the boot problem I had before. 'CONFIG_..=y'
definitely makes the situation better.

As of bisecting - it will require time do find the commit. I might do
it if I find some spare time.
