From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] gpio: ingenic: add CONFIG_OF dependency
Date: Tue, 30 May 2017 11:03:24 +0200
Message-ID: <CAMuHMdX8V+2vWpq2oJOQ5m8RRJrrVpmSBO4Tgcg=N9OrWOFmxg@mail.gmail.com>
References: <20170529125802.163127-1-arnd@arndb.de> <CACRpkdZn4j6CAwa=ymzGtxkKh3g35ffqvKEDxs5AEDf6pYtdJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36469 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750929AbdE3JD0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 05:03:26 -0400
In-Reply-To: <CACRpkdZn4j6CAwa=ymzGtxkKh3g35ffqvKEDxs5AEDf6pYtdJQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Cercueil <paul@crapouillou.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 29, 2017 at 6:45 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, May 29, 2017 at 2:57 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>> The driver cannot access the of_node field when CONFIG_OF is disabled:
>>
>> drivers/gpio/gpio-ingenic.c: In function 'ingenic_gpio_probe':
>> drivers/gpio/gpio-ingenic.c:324:10: error: 'struct gpio_chip' has no member named 'of_node'
>>
>> Fixes: b0653ce39a0d ("gpio: Add gpio-ingenic driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I already sent a combined patch fixing these two deps earlier today,
> good that we are several at it :)

Hmm... issues like these are actually the reasons why the of_node member
of struct device does not depend on CONFIG_OF?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
