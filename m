From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: ingenic: add CONFIG_OF dependency
Date: Tue, 30 May 2017 11:57:18 +0200
Message-ID: <CACRpkdY9eBh0fe_G+a=8XqtNTVyYLJQfh1XJGxDzEwx5XqrneQ@mail.gmail.com>
References: <20170529125802.163127-1-arnd@arndb.de> <CACRpkdZn4j6CAwa=ymzGtxkKh3g35ffqvKEDxs5AEDf6pYtdJQ@mail.gmail.com>
 <CAMuHMdX8V+2vWpq2oJOQ5m8RRJrrVpmSBO4Tgcg=N9OrWOFmxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX8V+2vWpq2oJOQ5m8RRJrrVpmSBO4Tgcg=N9OrWOFmxg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Cercueil <paul@crapouillou.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 30, 2017 at 11:03 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, May 29, 2017 at 6:45 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, May 29, 2017 at 2:57 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>>> The driver cannot access the of_node field when CONFIG_OF is disabled:
>>>
>>> drivers/gpio/gpio-ingenic.c: In function 'ingenic_gpio_probe':
>>> drivers/gpio/gpio-ingenic.c:324:10: error: 'struct gpio_chip' has no member named 'of_node'
>>>
>>> Fixes: b0653ce39a0d ("gpio: Add gpio-ingenic driver")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> I already sent a combined patch fixing these two deps earlier today,
>> good that we are several at it :)
>
> Hmm... issues like these are actually the reasons why the of_node member
> of struct device does not depend on CONFIG_OF?

It's a bit of kludginess-vs-footprint thing I guess, you gain a pointer,
you loose a bit of Kconfig and #ifdefs.

Yours,
Linus Walleij
