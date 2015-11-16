From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 16 Nov 2015 15:27:46 +0100
Message-ID: <CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<20151102103116.GE8676@localhost>
	<CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
	<CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
	<20151105094411.GD7561@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36841 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbbKPO1r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2015 09:27:47 -0500
Received: by obdgf3 with SMTP id gf3so123802641obd.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2015 06:27:46 -0800 (PST)
In-Reply-To: <20151105094411.GD7561@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Nov 5, 2015 at 10:44 AM, Johan Hovold <johan@kernel.org> wrote:
> On Wed, Nov 04, 2015 at 11:48:47AM +0100, Linus Walleij wrote:

>> Thinking about it maybe it's simplest to just make ->dev a pointer
>> and kzalloc() it at gpiochip_add().
>>
>> That should solve this.

Turns out that it's a bad idea to have a struct device as pointer because
it makes it impossible to use container_of() in e.g. .remove.

> You'd avoid ever reregistering the same struct device, but that would
> not solve the bigger life-time issue by itself.

Since device_del() unconditionally kills off the devince from the system
this is equivalent to saying device_add() and device_del() should really
not be used by subsystems, am I right?

Right now there is a cryptic comment in device_del() that says it should
"only be used if device_add() was also used manually" I wonder who this
man is that is using things manually inside the kernel, I guess it actually
means they must be paired.

If I don't use device_add()/device_del(), I see this must mean I have to use
device_register()/device_unregister() as the latter only decrease the refcount
and wait for the instance to die off.

So am I reading it correctly if I understand that this is what we should be
doing? I.e device_register()/device_unregister() and then wait for the
.remove() call to do its deed, so the kobj/struct device is kept around if
e.g. sysfs or the chardev has open files.

(It makes sense. Harder to code up, but makes sense.)

Yours,
Linus Walleij
