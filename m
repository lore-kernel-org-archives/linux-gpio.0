From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] pinctrl: amd: don't load pinctrl-amd on Gigabyte AM4 boards
Date: Fri, 26 May 2017 18:18:51 +0800
Message-ID: <CAAd53p75fbX7gJe9jkzkYVLTmn5SRq9AH5SBf6avhDYQNFOMyw@mail.gmail.com>
References: <20170525040006.22654-1-kai.heng.feng@canonical.com> <alpine.DEB.2.20.1705261206180.1902@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1705261206180.1902@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 26, 2017 at 6:09 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Thu, 25 May 2017, Kai-Heng Feng wrote:
>
>> On Gigabyte AM4 boards, pinctrl-amd generates tons of irq, makes the
>> system not able to boot properly.
>>
>> Don't load the module until Gigabyte fixes the issue.
>
> NAK.
>
> That's the completely wrong approach. This crap will surface on a gazillion
> of other boards and will hit users faster than you can keep that DMI list
> up to date.

Yea. I'll try to understand your patch, and hopefully I can find
correct solutions next time.

>
> There is a proper solution to this problem:
>
> http://lkml.kernel.org/r/alpine.DEB.2.20.1705232307330.2409@nanos

Wow, this is great news for Gigabyte AM4 users!

Thanks for the patch, I'll build a custom Ubuntu kernel and get
feedback from users.

>
> Thanks,
>
>         tglx
