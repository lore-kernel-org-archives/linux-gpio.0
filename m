From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/7] gpio: mockup: improve the debugfs input sanitization
Date: Wed, 31 May 2017 20:58:51 +0300
Message-ID: <CAHp75VdcNDa++5D6znb8+Dha80tmwPetsGjZ3pafj=D84Fi6TQ@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
 <1496134720-5363-2-git-send-email-brgl@bgdev.pl> <CAHp75VeJdqsXJ_ASTABijcj=-6BWkbAy8PofFyFTZ_1rtGVjQg@mail.gmail.com>
 <CAMRc=MeEFLyLzEeAy552mk+-CSSR6e_cu0kmpQEqEOF2_7zkSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=MeEFLyLzEeAy552mk+-CSSR6e_cu0kmpQEqEOF2_7zkSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 31, 2017 at 1:52 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2017-05-30 20:52 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
>> On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

>>> +       if (val != 0 && val != 1)
>>
>> Wouldn't be easier to have
>>
>> u8 rv;
>>
>> ret = kstrtu8_from_user();
>> if (ret >= 2)
>>  return ...;
>>
>> ?
>
> kstrtu8_from_user() doesn't return the converted value, so you won't
> skip an if anyway

Oh, yes.

> and by using the int variant, we're avoiding a cast.
> I'd prefer it this way frankly.

Fair enough. (Though I would go with (val < 0 && val > 1) condition,
of course it's matter of taste)

-- 
With Best Regards,
Andy Shevchenko
