From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpioib: do not free unrequested descriptors
Date: Thu, 26 Apr 2018 18:44:36 +0200
Message-ID: <CAMRc=Mey7adAwUuYtcDXmvL3gBNzxQ6kg+fQ1WYRtmgMSZ0UMg@mail.gmail.com>
References: <1522348152-15024-1-git-send-email-timur@codeaurora.org> <CACRpkdb=PqqJLC72DWE1ynu6f5cwB99zG=ECW3dpX0t3cF9Wbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb=PqqJLC72DWE1ynu6f5cwB99zG=ECW3dpX0t3cF9Wbg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2018-04-26 11:17 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Mar 29, 2018 at 8:29 PM, Timur Tabi <timur@codeaurora.org> wrote:
>
>> If the main loop in linehandle_create() encounters an error, it
>> unwinds completely by freeing all previously requested GPIO
>> descriptors.  However, if the error occurs in the beginning of
>> the loop before that GPIO is requested, then the exit code
>> attempts to free a null descriptor.  If extrachecks is enabled,
>> gpiod_free() triggers a WARN_ON.
>>
>> Instead, keep a separate count of legitimate GPIOs so that only
>> those are freed.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
>> Signed-off-by: Timur Tabi <timur@codeaurora.org>
>
> Patch applied for fixes.
>
> Bartosz, can you have a quick look at this? Did you run into the
> problem at any point?
>

I have never seen this issue, but the patch looks correct to me.

Thanks,
Bartosz
