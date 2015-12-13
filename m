From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 135/182] MIPS: alchemy: switch to gpiochip_add_data()
Date: Sun, 13 Dec 2015 21:25:48 +0100
Message-ID: <CACRpkdbmpE5i4_WmUcG-EZZBrTKpAtLwjLwrH48F6hxGEA9JvQ@mail.gmail.com>
References: <1449668342-4446-1-git-send-email-linus.walleij@linaro.org>
	<CAOLZvyGe5SV044P+uje5ro+F5yHoUVqz6or4QBMfdCgXW92sbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35198 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036AbbLMUZt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 15:25:49 -0500
Received: by obc18 with SMTP id 18so117400087obc.2
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 12:25:48 -0800 (PST)
In-Reply-To: <CAOLZvyGe5SV044P+uje5ro+F5yHoUVqz6or4QBMfdCgXW92sbA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Manuel Lauss <manuel.lauss@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>, Linux-MIPS <linux-mips@linux-mips.org>

On Wed, Dec 9, 2015 at 10:44 PM, Manuel Lauss <manuel.lauss@gmail.com> wrote:
> On Wed, Dec 9, 2015 at 2:39 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> ---
>> Ralf: please ACK this so I can take it through the GPIO tree.
>> BTW: would be nice if the MIPS GPIO drivers could move down
>> to drivers/gpio in the long run.
>
> Is there a specific reason?  I have no objections to moving it, but
> on the other hand I also like that (in this case) most/all chip-specific
> code is grouped together and not scattered around the tree.

Here is a reason. This patch series. If I could just change all that and have
the dependencies inside the GPIO tree, refactoring struggles would be
so much easier.

Yours,
Linus Walleij
