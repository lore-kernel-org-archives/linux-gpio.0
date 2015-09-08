From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch 15/22] pinctrl: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Tue, 8 Sep 2015 16:00:10 +0200
Message-ID: <CACRpkdb+Pi11u7dwHn0JPvbBERm5qKPuw=iVVUSg6ZL+E6zz4Q@mail.gmail.com>
References: <20150713072703.919712512@linutronix.de>
	<20150713072815.548358316@linutronix.de>
	<CAP=VYLrx3rJSvCEgZz47Ka1fye5EK6yetQKna=7fMGn3kOwiLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLrx3rJSvCEgZz47Ka1fye5EK6yetQKna=7fMGn3kOwiLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2015 at 11:28 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On Mon, Jul 13, 2015 at 4:47 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
>> From: Jiang Liu <jiang.liu@linux.intel.com>
>>
>> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
>> already have a pointer to corresponding irq_desc.
>
> Hi Linus,
>
> It seems that linux-next has this copy of the patch as 5663bb27dec1, which
> has a stray irq_desc_get_irq_chip in s3c24xx ; (2nd instance of "irq" is
> bogus looking.)   I first assumed it was from tglx since it did not have any
> additional SOB lines, but on further investigation I traced it back to sfr's
> merge of pinctrl/for-next.

Hm, saw this a bit late I guess.

Torvalds has merged my trees, is there a problem in mainline
that need to be addressed or did this fix itself?

Yours,
Linus Walleij
