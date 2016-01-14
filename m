From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH] gpiolib: fix chip order in gpio list
Date: Thu, 14 Jan 2016 15:09:23 +0800
Message-ID: <CAFy1USTQLpnV4ZtOf0dC+hk5j4M7WbU7Cis=PxLWuu8sqO4FEA@mail.gmail.com>
References: <1452203205-4660-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
	<CACRpkdZb1wWy-19y9BX9T0xeKUfmC2ym-sd4JEoLqhqVeb6GFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZb1wWy-19y9BX9T0xeKUfmC2ym-sd4JEoLqhqVeb6GFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@savoirfairelinux.com>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 01/13/2016 06:11 PM, Linus Walleij wrote:
> On Thu, Jan 7, 2016 at 10:46 PM, Julien Grossholtz
> <julien.grossholtz@savoirfairelinux.com> wrote:
>
>> In some situations the gpio_list order is not correct.
>> As a consequence gpiochip_find_base returns the same
>> base number twice. This happens when a first ship is added
>> with manual base number, then other ships are added using
>> automatic base number.
>>
>> To prevent this behaviour, this patch add the new ship after
s/ship/chip
>> the last element of the gpio list.
>>
>> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
>
> Patch looks correct to me so applied.
>
> Bamvor: please comment if you see some problems.
Nope, it could pass all the testcases I wrote.

Regards

Bamvor
>
> Yours,
> Linus Walleij
>
