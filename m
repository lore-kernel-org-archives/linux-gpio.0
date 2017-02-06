From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 5/7] gpio: mockup: add a dummy irqchip
Date: Mon, 6 Feb 2017 14:31:56 +0100
Message-ID: <CAMpxmJXuW9avh6Abc_+H=-c-G-kcnC_mhw-1oHWQAwOcKhpjcw@mail.gmail.com>
References: <1486383041-16758-1-git-send-email-bgolaszewski@baylibre.com>
 <1486383041-16758-6-git-send-email-bgolaszewski@baylibre.com> <CACRpkdbXmR_4-Acc2Pa27Svn5zny5UHF=mUuajDrUkQYhamTGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbXmR_4-Acc2Pa27Svn5zny5UHF=mUuajDrUkQYhamTGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2017-02-06 14:29 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
> On Mon, Feb 6, 2017 at 1:10 PM, Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
>> Setup a dummy irqchip that will allow us to inject line events for
>> testing purposes.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This is obviously exactly how we should do this.
>
> However since it needs the devm* helpers from the irq
> subsystem I can't apply them until the irqchip maintainers
> merge or ack that patch.
>
> If you want it in soon I suggest resending it with
> non-memorymanaged accessors for the descs and later
> make a separate patch to switch over to the devm_*
> versions when/if it is accepted.
>
> If you're not in a hurry, just wait :)
>
> Yours,
> Linus Walleij

I think I'll do it, since it would be nice to have it go in for 4.11
(if you're ready to merge it that late into the release cycle).

Thanks,
Bartosz
