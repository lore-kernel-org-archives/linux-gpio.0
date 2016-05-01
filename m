From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Sun, 1 May 2016 20:30:50 +0200
Message-ID: <CACRpkdbwb9v=7qOdqNuvJhstfzv3M7OxCRM=ipOLiEp7=C5z3w@mail.gmail.com>
References: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
	<CACRpkdbDww+JdAD6BXKc_PnXFRD5o=0OTqOfTjTYNdTMsqtH2g@mail.gmail.com>
	<CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33982 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976AbcEASav (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 May 2016 14:30:51 -0400
Received: by mail-ob0-f173.google.com with SMTP id dm5so12757178obc.1
        for <linux-gpio@vger.kernel.org>; Sun, 01 May 2016 11:30:51 -0700 (PDT)
In-Reply-To: <CAOMFOmWTc11KrzGhWzowM7LW0F6S5qRshNG1KWm_NZZ7R3MJ_g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatol Pomozov <anatol.pomozov@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Matt DeVillier <matt.devillier@gmail.com>

On Sun, May 1, 2016 at 4:36 PM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:
> On Sun, May 1, 2016 at 1:38 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Sun, May 1, 2016 at 2:33 AM, Anatol Pomozov <anatol.pomozov@gmail.com> wrote:

> Starting from 4.2/4.3 kernel release I see numerous problems with this
> driver. For example there are regular crashes at the boot time when
> tries to load this driver https://goo.gl/photos/fGk2U6PgUFtxUk9w5    I
> have to stick with Arch 4.1 kernel that does not have this problem.

Hm atleast it is not due to my recent refactorings of GPIO then.

Any chance you can run a bisect and nail the commit?

Yours,
Linus Walleij
