From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: don't auto-enable for COMPILE_TEST
Date: Fri, 22 Jul 2016 15:39:36 +0200
Message-ID: <CACRpkdY1gojATRmNL0GUo6Nw1q6t45r7fzLq_DyX90Ja=scYCw@mail.gmail.com>
References: <20160706125424.1687264-1-arnd@arndb.de> <CACRpkda95YM2ZA2_w-peq-gDvSs6KLggn_ZbLXGWxVEY+HM7Ow@mail.gmail.com>
 <20160720104148.GA5362@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36406 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753803AbcGVNji (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 09:39:38 -0400
Received: by mail-oi0-f53.google.com with SMTP id w18so162955054oiw.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 06:39:37 -0700 (PDT)
In-Reply-To: <20160720104148.GA5362@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, Alexander Stein <alexanders83@web.de>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 20, 2016 at 12:41 PM, Ingo Molnar <mingo@kernel.org> wrote:

>> Patch applied.
>
> This is still not upstream and this build failure is very prominent in the
> upstream kernel right now.

Sent it off to Torvalds, sorry for the delay. A case of bad connectivity
in my resort or I would have dealt with it quicker :(

>> I'm starting to get a bit tired about anything related to compile testing.
>
> They are very useful in finding real problems as well, and some people
> (like me! :-) rely on being able to generate random kernel images and
>  boot them.

Yeah that is good. I have a huge pile of enablement patches in my
tree, I just need to find someone to merge them one-by-one preceded
by fixes to the problems they bring to the surface...

Yours,
Linus Walleij
