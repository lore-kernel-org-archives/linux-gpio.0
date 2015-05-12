From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Tue, 12 May 2015 12:48:28 +0200
Message-ID: <CAD3Xx4LQOR=W6iXkFsGJMfXLrdM39HwUphqX7j=S=EPzUz73yw@mail.gmail.com>
References: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
 <CACRpkdbYpTHrALrYkLNhOBxx5H7dnGrkjbBr1rO6aGPN-4Bnvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:33644 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753248AbbELKs7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 06:48:59 -0400
In-Reply-To: <CACRpkdbYpTHrALrYkLNhOBxx5H7dnGrkjbBr1rO6aGPN-4Bnvw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joachim Eastwood <manabian@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>

Hi Linus,

On Tue, May 12, 2015 at 12:40 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, May 6, 2015 at 10:02 AM, Valentin Rothberg
> <valentinrothberg@gmail.com> wrote:
>
>> Hi Joachim,
>>
>> there are two of your commits [1, 2] in today's linux-next (i.e.,
>> next-20150506).  Both of them add Kconfig options that depend on
>> ARCH_LPC18XX, which is not defined in Kconfig, see:
>>
>> +       depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
>>
>> Is there a patch queued somewhere to add ARCH_LPC18XX ?
>
> Yes, and in this case it solves more problems to merge these
> patches out-of-order than not to.

Could you explain those problems?  I have some research interest in
such cases and want to understand and identify reasons for such
things.

Kind regards,
 Valentin

> Yours,
> Linus Walleij
