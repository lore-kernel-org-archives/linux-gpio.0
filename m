From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Tue, 12 May 2015 12:40:09 +0200
Message-ID: <CACRpkdbYpTHrALrYkLNhOBxx5H7dnGrkjbBr1rO6aGPN-4Bnvw@mail.gmail.com>
References: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35518 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752914AbbELKkK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 06:40:10 -0400
Received: by obcus9 with SMTP id us9so2039623obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 03:40:09 -0700 (PDT)
In-Reply-To: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>

On Wed, May 6, 2015 at 10:02 AM, Valentin Rothberg
<valentinrothberg@gmail.com> wrote:

> Hi Joachim,
>
> there are two of your commits [1, 2] in today's linux-next (i.e.,
> next-20150506).  Both of them add Kconfig options that depend on
> ARCH_LPC18XX, which is not defined in Kconfig, see:
>
> +       depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
>
> Is there a patch queued somewhere to add ARCH_LPC18XX ?

Yes, and in this case it solves more problems to merge these
patches out-of-order than not to.

Yours,
Linus Walleij
