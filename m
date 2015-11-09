From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: 74xx: fix a possible NULL dereference
Date: Mon, 9 Nov 2015 16:16:16 +0200
Message-ID: <CAHp75VdfzUhK1dOjxkkj_0ZCZyWFPRwvyE8CGgsUfdgj6Afe4w@mail.gmail.com>
References: <1446738939-22320-1-git-send-email-clabbe.montjoie@gmail.com>
	<CAAVeFuJK9iLOtgdja3RxXzuosQYBGxQKYA+oQ4f2buQh8G-Kbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuJK9iLOtgdja3RxXzuosQYBGxQKYA+oQ4f2buQh8G-Kbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2015 at 2:21 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Nov 6, 2015 at 12:55 AM, LABBE Corentin
> <clabbe.montjoie@gmail.com> wrote:
>> of_match_device could return NULL, and so cause a NULL pointer
>> dereference later at line 132:
>> priv->flags = (uintptr_t) of_id->data;
>>
>> Reported-by: coverity (CID 1324141)
>> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
>> ---
>>  drivers/gpio/gpio-74xx-mmio.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
>> index 6ed7c0f..4a7be0f 100644
>> --- a/drivers/gpio/gpio-74xx-mmio.c
>> +++ b/drivers/gpio/gpio-74xx-mmio.c
>> @@ -120,6 +120,9 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
>>         void __iomem *dat;
>>         int err;
>>
>> +       if (!of_id)
>> +               return -ENODEV;
>> +
>
> Nit: in that case, could you also move the assignment of of_id to its
> own line right above these added lines? It would keep things in the
> same place

I think it's more that just a nit. +1 to move assignment.

-- 
With Best Regards,
Andy Shevchenko
