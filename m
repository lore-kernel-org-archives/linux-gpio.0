From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/3] x86: apuv2: fix input dependencies
Date: Tue, 5 Mar 2019 14:50:33 +0100
Message-ID: <54a7d035-155f-c47b-1db1-acb851b3aec6@metux.net>
References: <20190304201930.1622839-1-arnd@arndb.de>
 <20190304201930.1622839-2-arnd@arndb.de>
 <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net>
 <CAK8P3a0vdhCTNTF-K0mXjRWkPvv0qr3nf_52=8n6zTa7p3ELLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0vdhCTNTF-K0mXjRWkPvv0qr3nf_52=8n6zTa7p3ELLw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 05.03.19 09:23, Arnd Bergmann wrote:

(CC'ing kbuild maintainer + list, hoping for better ideas :)


> No, that wouldn't be good here. In effect that means that with INPUT disabled,
> most of the x86 platform drivers are disabled, until you enable the
> PCENGINES_APU2 symbol, which then ends up showing all the other
> symbols at once, and changing them to their default states.

Okay, I didn't consider the defaults.

Maybe we should talk about step by step getting away from these defaults
(perhaps move them to the defconfigs ?) on a broader scale ... but yeah,
that's far out of scope now.

So, you've conviced me.
Add me to Reviewed-By to your patches and forget about mine.

> Another problem is that you likely run into circular dependency chains
> after trying that. The best practice for select vs. depends are

hmm, if circular deps happen, wouldn't that mean we've got some deeper
problems in here ? IMHO, dependencies should always form a DAG (except
for some really rare cases).

Do you recall any actual problem w/ input vs gpio vs. drivers ?
I'd like to have a closer look at it.

> 1. try to use 'depends on' if you can

Well, this has the unpleasant side effect that we often have to enable
a lot of things, just to even see the individual driver. For people who
just wanna configure a kernel for their board, this is a bit nasty.

But, okay, I'm going to do this w/ my own tool - I've written a small
tool that allows easy kernel reconfiguration on a higher level: you
can just pick some board templates and enable high level features like
eth, gpu, etc - it automatically creates a .config for you. I'm going
announce it on lkml soon.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
