From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] x86: apuv2: select LEDS_CLASS
Date: Fri, 8 Mar 2019 10:05:00 +0100
Message-ID: <CACRpkdad_HeZ9oKGZXmX2Yn2NcD8V+sAje=ELxSXeFeMGGjr8w@mail.gmail.com>
References: <20190304201930.1622839-1-arnd@arndb.de> <20190304201930.1622839-3-arnd@arndb.de>
 <24c191e1-f607-1320-2474-3db92383e383@metux.net> <e5f1511e-c750-8fb2-0bfe-c73bc7905b22@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e5f1511e-c750-8fb2-0bfe-c73bc7905b22@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 5, 2019 at 1:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/4/19 4:03 PM, Enrico Weigelt, metux IT consult wrote:
> > On 04.03.19 21:19, Arnd Bergmann wrote:
> >> LEDS_GPIO can only be selected when LEDS_CLASS is already enabled:
> >>
> >> WARNING: unmet direct dependencies detected for LEDS_GPIO
> >>   Depends on [m]: NEW_LEDS [=y] && LEDS_CLASS [=m] && (GPIOLIB [=y] || COMPILE_TEST [=y])
> >>   Selected by [y]:
> >>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT_KEYBOARD [=y]
> >>
> >> Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>  drivers/platform/x86/Kconfig | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> >> index 4d65d37b0c86..d64529352a9c 100644
> >> --- a/drivers/platform/x86/Kconfig
> >> +++ b/drivers/platform/x86/Kconfig
> >> @@ -1308,6 +1308,7 @@ config PCENGINES_APU2
> >>      depends on INPUT && INPUT_KEYBOARD
> >>      select GPIO_AMD_FCH
> >>      select KEYBOARD_GPIO_POLLED
> >> +    select LEDS_CLASS
> >>      select LEDS_GPIO
> >>      help
> >>        This driver provides support for the front button and LEDs on
> >>
> >
> > ACK. Just was about to post the same :)
> >
> > Reviewed-by: Enrico Weigelt, metux It consult <info@metux.net>
> >
>
> Enrico, you were also cc-ed on this patch on Feb.25, 2019:
>
> https://marc.info/?l=linux-kernel&m=155113875310485&w=2

I applied Randy's more extensive patch.

Yours,
Linus Walleij
