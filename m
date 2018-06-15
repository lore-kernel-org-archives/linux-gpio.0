From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: max732x: add error handling for i2c_new_dummy
Date: Fri, 15 Jun 2018 12:01:25 +0300
Message-ID: <CAHp75Vf+NijTozdZVXq8TX_SFT0ScCy4VdzM4Y+31V4twgo+0Q@mail.gmail.com>
References: <1528774132-38287-1-git-send-email-jiazhouyang09@gmail.com> <CACRpkdbjMLiJtxUpuSuvOBKD-rbybF8baJUBjvP6Hv5baeWY7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbjMLiJtxUpuSuvOBKD-rbybF8baJUBjvP6Hv5baeWY7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 14, 2018 at 5:27 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jun 12, 2018 at 5:28 AM, Zhouyang Jia <jiazhouyang09@gmail.com> wrote:
>
>> When i2c_new_dummy fails, the lack of error-handling code may
>> cause unexpected results.
>>
>> This patch adds error-handling code after calling i2c_new_dummy.
>>
>> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
>
> Patch applied for non-critical fixes.

It might potentially be a regression if the driver used to work when
dummy device creation failed.

>
> Yours,
> Linus Walleij



-- 
With Best Regards,
Andy Shevchenko
