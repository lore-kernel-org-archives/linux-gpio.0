From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Mon, 16 Nov 2015 14:33:39 +0100
Message-ID: <CACRpkdY7DycNLcOFHGKj7EEBhgFgbjL1mXn7umGnb1meskd+Mg@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<CACRpkdYqsGsYOALT3oQwc7fFho2gNe_=3qJ_cHcEO=YR4HAi8w@mail.gmail.com>
	<20151102101347.GA14066@localhost>
	<3389425.noBYZr9C6e@adelgunde>
	<20151103120605.GA18098@localhost>
	<CACRpkdaQYDk4s9b79xh+vL-3SFYp5GN3KpjgsSshzF0E+1-r5A@mail.gmail.com>
	<20151105094015.GC7561@localhost>
	<CACRpkdZsNNdFcJHdPoW=kyOJ0ONS6_sHX18CPwYcQybQ9pSx2g@mail.gmail.com>
	<20151106102121.GF22538@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34467 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752686AbbKPNdk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 08:33:40 -0500
Received: by obbbj7 with SMTP id bj7so102764686obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2015 05:33:39 -0800 (PST)
In-Reply-To: <20151106102121.GF22538@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Nov 6, 2015 at 11:21 AM, Johan Hovold <johan@kernel.org> wrote:
> On Thu, Nov 05, 2015 at 03:11:48PM +0100, Linus Walleij wrote:

>> Well libudev depends on libsystemd and is using it's subcomponent
>> sd-device to traverse sysfs. It's a pretty fat dependency for a
>> space-constrained embedded system, and the source code is not
>> maintained outside systemd anymore, leading to an
>> all-or-nothing approach it seems to me.
>
> Seems to me like you're trying to solve a user-space problem in the
> kernel. Even the network-device links you mentioned is something that
> udev provides.

Yeah :/

I will try to stay off trying to fix it for now, expecting people to make use of
the sysfs attributes. We can revisit it if problems arise for users.

Yours,
Linus Walleij
