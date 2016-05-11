From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Wed, 11 May 2016 11:22:02 +0200
Message-ID: <CACRpkdZjc6YQmnNg81HVybeDXTer6t-F=qXrGV+D7gtD+8MKqw@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
	<CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
	<CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:32864 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932109AbcEKJWE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 05:22:04 -0400
Received: by mail-oi0-f43.google.com with SMTP id v145so57864849oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 02:22:02 -0700 (PDT)
In-Reply-To: <CAOMFOmVUj_KRU20bpkqTUaCWNTVCoALz-vskgPKaW1TTR2gRPQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatol Pomozov <anatol.pomozov@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

On Tue, May 3, 2016 at 5:23 AM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
> On Sun, May 1, 2016 at 11:30 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Sun, May 1, 2016 at 4:36 PM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
>>> On Sun, May 1, 2016 at 1:38 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> On Sun, May 1, 2016 at 2:33 AM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
>>
>>> Starting from 4.2/4.3 kernel release I see numerous problems with this
>>> driver. For example there are regular crashes at the boot time when
>>> tries to load this driver https://goo.gl/photos/fGk2U6PgUFtxUk9w5    I
>>> have to stick with Arch 4.1 kernel that does not have this problem.
>>
>> Hm atleast it is not due to my recent refactorings of GPIO then.
>>
>> Any chance you can run a bisect and nail the commit?
>
> I compiled lynx gpio into kernel instead of compiling it as a module.
> And the system got more stable - I rebooted my devices ~50 times
> already and I do not see the boot problem I had before. 'CONFIG_..=y'
> definitely makes the situation better.
>
> As of bisecting - it will require time do find the commit. I might do
> it if I find some spare time.

If nothing else works I'm happy to accept a patch turning the
driver into a bool and removing all module handling code.

Yours,
Linus Walleij
