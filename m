From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/7] gpio: mockup: improve the debugfs input sanitization
Date: Wed, 31 May 2017 12:52:13 +0200
Message-ID: <CAMRc=MeEFLyLzEeAy552mk+-CSSR6e_cu0kmpQEqEOF2_7zkSA@mail.gmail.com>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
 <1496134720-5363-2-git-send-email-brgl@bgdev.pl> <CAHp75VeJdqsXJ_ASTABijcj=-6BWkbAy8PofFyFTZ_1rtGVjQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeJdqsXJ_ASTABijcj=-6BWkbAy8PofFyFTZ_1rtGVjQg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2017-05-30 20:52 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Tue, May 30, 2017 at 11:58 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> We're currently only checking the first character of the input to the
>> debugfs event files, so a string like '0sdfdsf' is valid and indicates
>> a falling edge event.
>>
>> Be more strict and only allow '0', '1', '0\n' & '1\n'.
>>
>> While we're at it: move the sanitization code before the irq_enabled
>> check so that we indicate an error on invalid input even if nobody is
>> waiting for events.
>
>> -       int val;
>> -       char buf;
>> +       int rv, val;
>
>> +       rv = kstrtoint_from_user(usr_buf, size, 0, &val);
>> +       if (rv)
>> +               return rv;
>
>> +       if (val != 0 && val != 1)
>
> Wouldn't be easier to have
>
> u8 rv;
>
> ret = kstrtu8_from_user();
> if (ret >= 2)
>  return ...;
>
> ?

kstrtu8_from_user() doesn't return the converted value, so you won't
skip an if anyway and by using the int variant, we're avoiding a cast.
I'd prefer it this way frankly.

Thanks,
Bartosz
