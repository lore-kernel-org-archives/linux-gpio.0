From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Tue, 3 Nov 2015 22:20:59 +0100
Message-ID: <CACRpkdY_Y6j209M+03SzkVKUxVzc2r98Gba2CeCZkLhFhKAuhw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<CAAVeFuLMqCE81c8_e009uu1bYypmbagHS1DnPkZ1vxcuU=ukQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34476 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679AbbKCVVA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 16:21:00 -0500
Received: by obbza9 with SMTP id za9so23511754obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2015 13:20:59 -0800 (PST)
In-Reply-To: <CAAVeFuLMqCE81c8_e009uu1bYypmbagHS1DnPkZ1vxcuU=ukQg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sun, Oct 25, 2015 at 8:06 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Thu, Oct 22, 2015 at 5:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> GPIO chips have been around for years, but were never real devices,
>> instead they were piggy-backing on a parent device (such as a
>> platform_device or amba_device) but this was always optional.
>> GPIO chips could also exist without any device at all, with its
>> struct device *dev pointer being set to null.
>>
>> When sysfs was in use, a mock device would be created, with the
>> optional parent assigned, or just floating orphaned with NULL
>> as parent.
>>
>> For a proper userspace ABI we need gpiochips to *always have a
>> populated struct device, so add this in the gpio_chip struct.
>> The name "dev" is unfortunately already take so we use "device"
>> to name it.
>>
>> If sysfs is active, it will use this device as parent, and the
>> former parent device "dev" will be set as parent of the new
>> "device" struct member.
>
> Why not rename "dev" to "parent" so "dev" becomes what we expect it to
> be? The two members being of the same type, keeping it that way seems
> error-prone to me.

It's because that is set all over the universe. But I'll cook some
separate patch renaming it across the tree I guess... Could
use Cocinelle for it maybe.

Yours,
Linus Walleij
