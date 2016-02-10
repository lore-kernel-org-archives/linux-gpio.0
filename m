From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Wed, 10 Feb 2016 11:04:39 +0100
Message-ID: <CACRpkdbbFvGdMX4VSom_87-au5CVLkfch5+-chRDHauUK8evbg@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
	<CAFy1USR62NooHEjHw0nJmsuHRuq0QDhKentjf40gDOqC+HPrdg@mail.gmail.com>
	<CACRpkdZS-=2EH7gKZaHqcVhL6a_5huGtbQUv4F5_XJoV0pHdbA@mail.gmail.com>
	<CAFy1USQ0UM_i1rT68dY0kU2r5_m5QKP2wzT+8rQFKNA024ZE-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35140 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbcBJKEk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 05:04:40 -0500
Received: by mail-ob0-f181.google.com with SMTP id xk3so20129388obc.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2016 02:04:40 -0800 (PST)
In-Reply-To: <CAFy1USQ0UM_i1rT68dY0kU2r5_m5QKP2wzT+8rQFKNA024ZE-A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Fri, Jan 29, 2016 at 11:24 AM, Bamvor Zhang Jian
<bamvor.zhangjian@linaro.org> wrote:
> On 01/28/2016 07:14 PM, Linus Walleij wrote:
>> On Wed, Jan 27, 2016 at 11:05 AM, Bamvor Zhang Jian
>> <bamvor.zhangjian@linaro.org> wrote:
>>
>>> From the api(ioctl GPIO_GET_CHIPINFO_IOCTL: gpiochip_info), it seems
>>> that I could list all the gpiochips or list only one gpiochip. But
>>> I could not list gpiochip belongs to one gpio driver.
>>
>> I think you can get that information from parsing sysfs?
> Yeap, I could get the directory:
> "/sys/devices/platform/gpio-mockup/gpio/"
>
> I notice that you mark the sysfs ABI as obsolete in these series. I
> am not sure whether it is reasonable to read it from syfs when using
> chardev.

They can probably be used in parallel. I don't have a Kconfig
option for the chardev, it is always turned on, so as to make
people use it.

I even consider putting nasty stuff in dmesg and the boot crawl
for people using the sysfs at some point.

Yours,
Linus Walleij
