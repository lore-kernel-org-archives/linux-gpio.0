From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] x86: apuv2: fix input dependencies
Date: Tue, 5 Mar 2019 09:23:06 +0100
Message-ID: <CAK8P3a0vdhCTNTF-K0mXjRWkPvv0qr3nf_52=8n6zTa7p3ELLw@mail.gmail.com>
References: <20190304201930.1622839-1-arnd@arndb.de> <20190304201930.1622839-2-arnd@arndb.de>
 <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 5, 2019 at 1:18 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 04.03.19 21:19, Arnd Bergmann wrote:
>
> > This could be fixed using either a dependency or a 'select' statement.
> > I'm chosen 'depends on' here since it is simpler has a lower risk of
> > introducing circular dependencies.
>
> I'd rather prefer using 'select'.
>
> Otherwise the driver won't appear at all if INPUT or INPUT_KEYBOARD
> aren't enabled (eg. when you start w/ minimal config - which I do
> frequently), and people have a hard time actually finding/enabling it.

No, that wouldn't be good here. In effect that means that with INPUT disabled,
most of the x86 platform drivers are disabled, until you enable the
PCENGINES_APU2 symbol, which then ends up showing all the other
symbols at once, and changing them to their default states.

Another problem is that you likely run into circular dependency chains
after trying that. The best practice for select vs. depends are

1. try to use 'depends on' if you can
2. use 'select' on hidden symbols, but not user visible ones
3. for each symbol, use either 'depends on'  or 'select' from all other
    drivers that need it, and do it consistently
4. never select entire subsystems, only helper code.

Those are sometimes at odds. I used 'select' for the LEDS code
because of 3. and 4, even though that goes against 2. For INPUT,
there is no real debate though.

   Arnd
