From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Tue, 3 Nov 2015 18:06:36 +0100
Message-ID: <CACRpkdYkMYyJjCR9B0brD6yOT_NQv3kjzTZW+nQ0i+wJgM9Cug@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com>
	<20151101024144.GF28319@sirena.org.uk>
	<2109736.Oi4ERkUO0L@adelgunde>
	<20151103085052.GN20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34715 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512AbbKCRGh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 12:06:37 -0500
Received: by obbza9 with SMTP id za9so17445983obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2015 09:06:36 -0800 (PST)
In-Reply-To: <20151103085052.GN20228@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Tue, Nov 3, 2015 at 9:50 AM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 03, 2015 at 08:39:13AM +0100, Markus Pargmann wrote:
>
>> I think we need real gpio userspace tools for such a chardev interface and not
>> only a library. On the one hand there are all the kernel/userspace developers
>> that just want to test stuff. On the other hand there are really a lot of
>> people that are using small embedded devices (e.g. beaglebone, raspberry pi,
>> ...) for really simple applications like using GPIOs to control something. I am
>> sure many of them are just using some really simple bash code to reach their
>> goals.
>
> There's already some work going on on producing tooling for the maker
> community which is currently working with the existing interfaces,
> attempting to abstract them for users to handle things like base board
> differences - I believe that's part of the motivation behind this work.

You are right. It is adding to the long-term maintenance requirements for
the sysfs ABI which we want to ditch.

Yours,
Linus Walleij
