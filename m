From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 07/23] gpio: sysfs: rename gpiochip registration functions
Date: Tue, 28 Apr 2015 12:27:16 +0900
Message-ID: <CAAVeFuKXArYBGNjUW8Dug0avGJoHTHZWD=FSxrTqTF+nRjBcOw@mail.gmail.com>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
 <1429630951-27082-8-git-send-email-johan@kernel.org> <CAAVeFuLOwa53YgcHVj9uGa+KLpV2Et-iEAwKEK3vhtJgQSJH4Q@mail.gmail.com>
 <20150427082753.GB27877@localhost> <CAAVeFuKRF2x+88Yz_64XYstSuk-BZGuYuZrRC-wWtaiwbLrJUw@mail.gmail.com>
 <20150427090510.GE27877@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:37589 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932132AbbD1D1h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 23:27:37 -0400
In-Reply-To: <20150427090510.GE27877@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 27, 2015 at 6:05 PM, Johan Hovold <johan@kernel.org> wrote:
> On Mon, Apr 27, 2015 at 05:50:54PM +0900, Alexandre Courbot wrote:
>> On Mon, Apr 27, 2015 at 5:27 PM, Johan Hovold <johan@kernel.org> wrote:
>> > On Mon, Apr 27, 2015 at 12:54:36PM +0900, Alexandre Courbot wrote:
>> >> On Wed, Apr 22, 2015 at 12:42 AM, Johan Hovold <johan@kernel.org> wrote:
>> >> > Rename the gpio-chip export/unexport functions to the more descriptive
>> >> > names gpiochip_register and gpiochip_unregister.
>> >>
>> >> Since these functions are related to sysfs, wouldn't
>> >> gpiochip_sysfs_export (or gpiochip_sysfs_register, although the former
>> >> sounds better to me) be even more descriptive?
>> >
>> > I'm trying to get rid of the made up notion of "exporting" things. What
>> > we are doing is to register devices with driver core, and that involves
>> > a representation is sysfs.
>> >
>> > Eventually, a gpio chip should always be registered with driver core and
>> > this is not directly related to the (by then hopefully legacy)
>> > sysfs-interface.
>>
>> I understand and agree, but even after your patch series, registration
>> of a gpio chip with the driver core is still dependent on the
>> CONFIG_GPIO_SYSFS option. So maybe you could push the logic further
>> and either always register GPIO chips (effectively moving the call to
>> device_create into gpiolib.c) and only keep the legacy bits in
>> gpiolib-sysfs.c?
>
> That is the plan yes, but there's only so much I can do in one series.
> ;) The current crazy sysfs API also prevents the decoupling of the sysfs
> interface from chip device registration.

Sounds good then. This patch series is great anyway, so if Linus has
nothing against it I hope we can merge it quickly.
