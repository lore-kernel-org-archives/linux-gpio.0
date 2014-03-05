From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: clamp returned values to the boolean range
Date: Wed, 5 Mar 2014 11:14:23 +0900
Message-ID: <CAAVeFuJdg-p4K1wdLpdv3byiEBUezGGUVjyScoOaZcLZxhPk7A@mail.gmail.com>
References: <1393378800-7220-1-git-send-email-acourbot@nvidia.com>
 <CACRpkdY-oBdxxWhsGraEU31qyu+RWJAiRA+KEip6QNW3jRwGUA@mail.gmail.com> <1393985087.3271.21.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393985087.3271.21.camel@joe-AO722>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 5, 2014 at 11:04 AM, Joe Perches <joe@perches.com> wrote:
> On Wed, 2014-03-05 at 09:49 +0800, Linus Walleij wrote:
>> On Wed, Feb 26, 2014 at 9:40 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>> > Nothing prevents GPIO drivers from returning values outside the
>> > boolean range, and as it turns out a few drivers are actually doing so.
>> > These values were passed as-is to unsuspecting consumers and created
>> > confusion.
>> >
>> > This patch makes the internal _gpiod_get_raw_value() function return a
>> > bool, effectively clamping the GPIO value to the boolean range no
>> > matter what the driver does.
>>
>> No, that will not be the semantic effect of this patch, bool is just
>> another name for an int, maybe some static checkers will be able
>> to use it however.
>
> No, a bool is not an int.
>
> It's really different.
> include/linux/types.h:typedef _Bool                     bool;

It indeed seems that _Bool is an actual boolean type in C99. However I
could not find in the C99 standard how ints are supposed to be
converted to it. So in the end it is probably safer to perform this
change the way Linus suggested.

Alex.
