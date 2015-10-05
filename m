From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: fix BG2CD field widths
Date: Mon, 05 Oct 2015 20:07:45 +0200
Message-ID: <5612BC71.1060807@gmail.com>
References: <56074059.10806@gmail.com> <560D89BA.1000203@gmail.com> <CACRpkdZ9HJtmEs6KhFRwh4=i2kOqeKV_WPDoi5zppNBc2FUDFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ9HJtmEs6KhFRwh4=i2kOqeKV_WPDoi5zppNBc2FUDFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Hebb <tommyhebb@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>
List-Id: linux-gpio@vger.kernel.org

On 05.10.2015 09:24, Linus Walleij wrote:
> On Thu, Oct 1, 2015 at 9:30 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth@gmail.com> wrote:
>> On 27.09.2015 03:03, Thomas Hebb wrote:
>>>
>>> The previous register layout was incorrect, many of the fields having
>>> fewer bits than were needed to represent all their modes. The new layout
>>> is taken from the bootloader source of a BG2CD device.
>>>
>>> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
>>> ---
>>>    drivers/pinctrl/berlin/berlin-bg2cd.c | 62
>>> ++++++++++++++++++-----------------
>>>    1 file changed, 32 insertions(+), 30 deletions(-)
>>
>>
>> Applied to berlin/fixes.
>>
>> There seems to be something wrong with the patch.
>> Please base your patches on the recent -rc1 kernel
>> and use git send-email. I fixed this patch manually.
>
> I don't understand. Is this for the upstream kernel or not?
>
> I should take it into the pinctrl tree if you ACK it I think?

Linus,

sorry, of course it is up to you to take it. I haven't sent a
PR for the branch I precipitately applied this patch to.

As the patch has issues with latest -rc1 I can provide you
a -rc1 compatible version of it. You can also pull it from
my branch if you prefer.

Please let me know you want the patch and sorry again for
the confusion.

Sebastian
