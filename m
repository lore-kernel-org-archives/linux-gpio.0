From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/4] gpio: Introduce ->get_multiple callback
Date: Thu, 12 Oct 2017 13:15:19 +0200
Message-ID: <20171012111519.nchlhwniklo5njju@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
 <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
 <20171004203203.GC9195@wunner.de>
 <CACRpkdb4uKLTKUa_fwzMmvSHps8aXM4FQgXzhtf-UNmzt6=Q0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:55109 "EHLO
        mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752824AbdJLLPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2017 07:15:22 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb4uKLTKUa_fwzMmvSHps8aXM4FQgXzhtf-UNmzt6=Q0g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 07, 2017 at 01:23:17PM +0200, Linus Walleij wrote:
> On Wed, Oct 4, 2017 at 10:32 PM, Lukas Wunner <lukas@wunner.de> wrote:
> > So I'm wondering if the const keyword does more harm than good in this case.
> > Let me know what you think.
> 
> I've had similar experiences.
> 
> I'm not very sensitive about it, do whatever makes most sense to you.
> 
> What is important is that we get get_mutiple() in place.

Yes.  My apologies for the delay.

I've dropped the const qualifier, the rationale for the compiler error
it triggers is given in:

http://c-faq.com/ansi/constmismatch.html

Briefly, it is legal to pass a pointer to non-const if the function
signature specifies const, but not for a pointer-to-pointer, i.e.
a second level of indirection.  The error is supposed to "help" the
developer keep the const promises but I don't find it helpful at all.
It necessitates a cast unless a const struct gpio_desc ** is passed in.
When would that be the case in reality?  Only if the array is statically
declared, but usually the gpio_desc structs are obtained at runtime,
so the the cast would likely *always* be needed.

Thanks,

Lukas
