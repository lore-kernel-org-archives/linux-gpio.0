From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] GPIO fixes for v4.16
Date: Mon, 26 Feb 2018 10:54:43 +0100
Message-ID: <CACRpkdYdnHqU6gujqLhX1xqPJQWBNUuLQwicpVVLqs5AeYeMMw@mail.gmail.com>
References: <CACRpkdYGQUynZJu+4-Bj=TzL5=C4qt2cYav__9aHSnwD2NERDA@mail.gmail.com>
 <20180226094630.c4yh4fyfjdeurqo7@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226094630.c4yh4fyfjdeurqo7@flea.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 26, 2018 at 10:46 AM, Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
> On Mon, Feb 26, 2018 at 10:36:00AM +0100, Linus Walleij wrote:
>> Hi Linus,
>>

>> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
>>
>>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
>> tags/gpio-v4.16-2
>>
>> for you to fetch changes up to c2b3eec47c1b2161adbc70676f1422e6f56aaa32:
>>
>>   gpio: Handle deferred probing in of_find_gpio() properly (2018-02-21
>> 09:37:34 +0100)
>>
>> ----------------------------------------------------------------
>> GPIO fixes for the v4.16 kernel:
>>
>> - Two patches fixing up my mistakes with device tree properties
>>   compatible for SPI and regulators. Nice to smoke this out for
>>   v4.16 though, when we actually use it in v4.17 it will be
>>   in nice shape.
>
> As I told you as an answer to my patch, it still needs to be amended
> in order to work as expected. The one queued in the PR doesn't work.

Sorry I must have missed it :(

Torvalds: hold your horses. New pull request(s) coming.

Yours,
Linus Walleij
