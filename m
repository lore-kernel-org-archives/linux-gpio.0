From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: 104-dio-48e: make array 'ports' static, shrinks
 object size
Date: Thu, 26 Apr 2018 09:02:42 -0400
Message-ID: <20180426130242.GA10587@sophia>
References: <20180405120012.7671-1-colin.king@canonical.com>
 <CACRpkdZ2zRJfcSWbi_zwvtMnu_eGqAi684Wh3qWfjMazJqNsUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ2zRJfcSWbi_zwvtMnu_eGqAi684Wh3qWfjMazJqNsUA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Colin King <colin.king@canonical.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 26, 2018 at 11:06:05AM +0200, Linus Walleij wrote:
>On Thu, Apr 5, 2018 at 2:00 PM, Colin King <colin.king@canonical.com> wrote:
>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate the const read-only array 'ports' on the stack but instead
>> make it static. Makes the object code smaller by over 100 buytes:
>>
>> Before:
>>    text    data     bss     dec     hex filename
>>   10959    4952     832   16743    4167 drivers/gpio/gpio-104-dio-48e.o
>>
>> After:
>>    text    data     bss     dec     hex filename
>>   10790    5008     832   16630    40f6 drivers/gpio/gpio-104-dio-48e.o
>>
>> (gcc version 7.2.0 x86_64)
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
>Patch applied with William's ACK.
>
>Yours,
>Linus Walleij

Hi Linus,

A more recent version of this patch including similar changes to
gpio-gpio-mm.c and gpio-104-idi-48.c is located here:
https://lkml.org/lkml/2018/4/18/613

William Breathitt Gray
