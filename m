From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Bug report - gpio: improve error path in gpiolib
Date: Sat, 5 Oct 2013 22:50:17 +0200
Message-ID: <51948145-0CAD-48E7-B3E2-BDE52BEE2CA4@goldelico.com>
References: <F7C544E1-F25D-4E83-9896-A761ADBEBA93@goldelico.com> <524E199C.8030108@nvidia.com> <DD75C018-FCE8-42D1-8836-01990062B1D5@goldelico.com> <CAAVeFuKYechF5UPVqau6nRpVDnT5fYDGmypN2pLJaz6wiritfQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo-p00-ob.rzone.de ([81.169.146.162]:34368 "EHLO
	mo-p00-ob.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752354Ab3JEUuV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2013 16:50:21 -0400
In-Reply-To: <CAAVeFuKYechF5UPVqau6nRpVDnT5fYDGmypN2pLJaz6wiritfQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Alex Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Frank Rowand <frank.rowand@sonymobile.com>, NeilBrown Brown <neilb@suse.de>, Belisko Marek <marek.belisko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Alexandre,

Am 04.10.2013 um 20:02 schrieb Alexandre Courbot:

> On Fri, Oct 4, 2013 at 3:21 PM, Dr. H. Nikolaus Schaller
> <hns@goldelico.com> wrote:
>> Hi all,
>> 
>> Am 04.10.2013 um 03:27 schrieb Alex Courbot:
>> 
>>> Hi Nikolaus,
>>> 
>>> On 10/03/2013 01:22 AM, Dr. H. Nikolaus Schaller wrote:
>>>> Hi Alexandre,
>>>> i think have traced down one problem we have to the latest patch in 3.12-rc:
>>>> 
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpiolib.c?id=be1a4b13089b1e18da83a549d49163ccad3c19ba
>>>> 
>>>> The problem is that by this patch a desc == NULL now returns -EINVAL while earlier it did return an -EPROBE_DEFER, which I consider the better option.
>>>> 
>>>> By this -EINVAL, now some dependent drivers are no longer initialized.
>>>> 
>>>> So I't suggest to revert that.
>>> 
>>> Adding Linus since he authored the patch.
>>> 
>>> I suppose the behavior should not change indeed. But could you specify which use-case now returns -EINVAL instead of -EPROBE_DEFER? It is not obvious by just looking at the patch alone.
>> 
>> To give some more background information and how we use the gpio system to run
>> into this issue:
>> 
>> We are currently in the middle of preparing patches for upstreaming for the ARM
>> based GTA04 board.
>> 
>> One of these additions needs a "reverse gpio-regulator" driver. It presents itself
>> as a virtual GPIO to other drivers that expect to control a GPIO but internally controls
>> a regulator. We need this to enable some external power e.g. if the DTR line of
>> an UART is asserted by the UART driver so that an external GPS chip&antenna
>> gets powered on.
>> 
>> The code of that driver is here:
>> 
>> https://github.com/goldelico/gta04-kernel/blob/master/drivers/gpio/gpio-reg.c
>> 
>> It was developed from 3.4 to 3.7 and I have started to forward-port it to 3.12-rc
>> to make it ready for future submission.
>> 
>> There I found that this GPIO is now being treated as invalid instead of
>> -EPROBE_DEFER and is therefore no longer deferring the probing of the
>> UART. I.e. the whole UART probing process fails.
>> 
>> This appears to have its root in the function gpiod_request() that the descriptor
>> exists but not the chip pointer.
>> 
>> If I understand the old code correctly it did return -EINVAL only for a NULL
>> descriptor but did return the default value of the variable 'status' if desc != NULL
>> but desc->chip == NULL. This default is -EPROBE_DEFER.
>> 
>> I don't know the exact interworking of gpiolib and gpiod_request() with our
>> driver and it's probe function, but adding this line at the beginning of gpiod_request
>> did make the whole deferring chain work again (after IMHO restoring the "older"
>> logic of gpiod_request up to 3.11):
>> 
>>        if (desc && !desc->chip)
>>                return -EPROBE_DEFER;
> 
> I see - that's fair enough, the return value of gpiod_request() should
> not change, especially when it bears such useful information.
> 
> I have just sent 2 patches that should fix this issue.

Great.

> Could you test
> them and give your Tested-by after confirming they work?

Yes, these patches work for us as well and have the intended
effect (like my quick hack).

Tested-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>

> 

> Then I think
> Linus can safely merge them (disclaimer: I have not tested them myself
> yet).
> 
> Thanks,
> Alex.

Thanks to you,
Nikolaus

