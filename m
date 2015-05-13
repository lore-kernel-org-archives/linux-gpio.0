From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Wed, 13 May 2015 10:44:06 +0200
Message-ID: <CACRpkdbxfb5C+Mny_J+LXmHqAaYO_aPYzdVUJDyenRefVsaysA@mail.gmail.com>
References: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
	<CACRpkdbYpTHrALrYkLNhOBxx5H7dnGrkjbBr1rO6aGPN-4Bnvw@mail.gmail.com>
	<CAD3Xx4LQOR=W6iXkFsGJMfXLrdM39HwUphqX7j=S=EPzUz73yw@mail.gmail.com>
	<CACRpkdaeJKsrZrn4o0BAyCWREUg-QuJ5LGF39bca8YuzM95f0Q@mail.gmail.com>
	<20150512145749.GA2324@station.rsr.lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34871 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753760AbbEMIoG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 04:44:06 -0400
Received: by obcus9 with SMTP id us9so24604394obc.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2015 01:44:06 -0700 (PDT)
In-Reply-To: <20150512145749.GA2324@station.rsr.lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>

On Tue, May 12, 2015 at 4:57 PM, Valentin Rothberg
<valentinrothberg@gmail.com> wrote:
> [Me]:
>> The answer to whether a certain maintainer will dare to do so
>> or not is per individual preference. The crucial point is that
>> "time savings" trumps "nothing can ever go wrong".
>
> I understand your point completely.  However, I see some cases critical,
> especially when configuration conditional code is added that cannot be
> compiled since the Kconfig option is not added yet or due to some other
> reason.  In precise, I see a conflict in the golden rule of "don't break
> the build".  As the code cannot be compiled, nobody knows if it's broken
> or not.  I see such things happening nearly daily.

I would say it is based on individual trust. Some contributors do not
send me untested patch sets so I know I can apply one or two of them
in isolation and trust the end result to be good if they work like this.

Individual trust is at odds with process. Process is based on the
bureaucratic ambition to work predictably and impersonal, such as
works the planets, or the plants. But maintainers in practice, while
applying some process, eventually work by personal trust which
is more ephemeral.

Yours,
Linus Walleij
