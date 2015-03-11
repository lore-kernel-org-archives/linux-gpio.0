From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 6/8] pinctrl: cygnus: add gpio/pinconf driver
Date: Wed, 11 Mar 2015 10:15:20 +0100
Message-ID: <CACRpkdZbxTyYWpxWCmdN8a7p+MjcUo6UxEwfgStPWsNzf4NZ=g@mail.gmail.com>
References: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
	<1425933902-20652-7-git-send-email-rjui@broadcom.com>
	<CACRpkdZ1ErfikdF41aANTM-7LE6AExizHtCZTq1_TTxwYjeSQA@mail.gmail.com>
	<54FF306C.7020407@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33301 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbbCKJPV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 05:15:21 -0400
Received: by obcvb8 with SMTP id vb8so7544165obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2015 02:15:21 -0700 (PDT)
In-Reply-To: <54FF306C.7020407@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback->

On Tue, Mar 10, 2015 at 6:57 PM, Ray Jui <rjui@broadcom.com> wrote:
> On 3/10/2015 3:20 AM, Linus Walleij wrote:
>> On Mon, Mar 9, 2015 at 9:45 PM, Ray Jui <rjui@broadcom.com> wrote:
>>
>>> This adds the initial support of the Broadcom Cygnus GPIO/PINCONF driver
>>> that supports all 3 GPIO controllers on Cygnus including the ASIU GPIO
>>> controller, the chipCommonG GPIO controller, and the always-on GPIO
>>> controller. Basic PINCONF configurations such as bias pull up/down, and
>>> drive strength are also supported in this driver.
>>>
>>> Pins from the ASIU GPIO controller can be individually muxed to GPIO
>>> function, through interaction with the Cygnus IOMUX controller
>>>
>>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>>> Tested-by: Dmitry Torokhov <dtor@chromium.org>
>>
>> Patch applied! But please look at this:
>>
>>> +#include <linux/gpio.h>
>>
>> Doesn't just #include <linux/gpio/driver.h> work?
>>
>
> I think I need linux/gpio.h for gpiochip_add_pin_range and some related
> APIs.

OK you're right ... I need to fix this.

Yours,
Linus Walleij
