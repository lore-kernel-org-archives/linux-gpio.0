From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 05/10] gpio: mockup: improve the debugfs input sanitization
Date: Mon, 29 May 2017 08:57:22 +0200
Message-ID: <CAMRc=McSvqYDekQfH0=xpR_W4w8Z33ecKAx9tJqJD22AT2_oEQ@mail.gmail.com>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
 <1495701227-28809-6-git-send-email-brgl@bgdev.pl> <CAHp75Vfx_Ft50ha1FNzzLi-Pp8ex27M05-bChn-uLBZ7H_ThNg@mail.gmail.com>
 <CAHp75Ve2ne5Y76kG0rvuGO0_QtTRu1hM3GW+d7se2m_M3MwiZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve2ne5Y76kG0rvuGO0_QtTRu1hM3GW+d7se2m_M3MwiZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2017-05-27 18:47 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Sat, May 27, 2017 at 7:45 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, May 25, 2017 at 11:33 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>> We're currently only checking the first character of the input to the
>>> debugfs event files, so a string like '0sdfdsf' is valid and indicates
>>> a falling edge event.
>>>
>>> Be more strict and only allow '0', '1', '0\n' & '1\n'.
>>
>> Why not to be so strict and use
>>
>> kstrtobool_from_user();
>>
>> instead?
>

Because it doesn't really make sense here - we're indicating a RISING
or FALLING edge event. This doesn't really correspond well with
boolean values IMO.

> Or if you still wish to be strict,
> ret = kstrtou8_from_user();
> if (ret)
>  return ret;
>
> if (val > 1)
>  return -ERANGE;
>
> or alike.

This one looks good, I'll include it in v2.

Thanks,
Bartosz
