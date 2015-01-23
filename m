From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: gpio: ARCH_MB86S7X?
Date: Fri, 23 Jan 2015 11:55:33 +0100
Message-ID: <CACRpkdbikHEU57nKDxKTm9fm8S4dTAnCcH_3Fh18JEfDrqL=vw@mail.gmail.com>
References: <1422008501.30730.22.camel@x220>
	<CAJe_ZhcVZNzbEiVBsvHDqsYOdCXA9fmZuHrQMQ-jFDWuoobovQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJe_ZhcVZNzbEiVBsvHDqsYOdCXA9fmZuHrQMQ-jFDWuoobovQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, Andy Green <andy.green@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 23, 2015 at 11:34 AM, Jassi Brar <jaswinder.singh@linaro.org> wrote:
> On 23 January 2015 at 15:51, Paul Bolle <pebolle@tiscali.nl> wrote:

>> So, for what it's worth, that dependency appears to be not needed to
>> build this driver.
>>
> Linus.W, what do you suggest? Just drop the dependency?

Nah, not right now atleast. As there is a plan to get the platform
in it will just cause trouble.

What we can do is to say that it will be available also for
CONFIG_COMPILE_TEST, so it gets built on the servers
etc.

depends on ARCH_MB86S7X || COMPILE_TEST

But then you better test it a lot because then it will be
compiled on X86_64 and such.

Yours,
Linus Walleij
