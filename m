From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Mon, 30 Jan 2017 17:18:17 +0100
Message-ID: <1e309179-26d1-392d-efdd-2c6ccf815da5@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
 <20170130155356.GD7399@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:41906 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932523AbdA3Q0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 11:26:33 -0500
In-Reply-To: <20170130155356.GD7399@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Tony,

On 30/01/2017 16:53, Tony Lindgren wrote:
> * Linus Walleij <linus.walleij@linaro.org> [170130 05:53]:
>> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>>
>>>    after having discussed in great detail the RZ series per-pin PFC hardware
>>> peculiarities, this is a proposal for a possible pin-based pin controller
>>> driver for SoC devices of Renesas RZ family.
>>>
>>> This RFC series adds a minimal driver infrastructure which supports pin
>>> multiplexing via explicit per-pin settings performed in device tree sources.
>>
>> I think this is what Laurent had in mind when he said something about
>> that he should have taken the per-pin approach from day 1.
>>
>> I would especially like to see Laurent's review and ACK on this series
>> for that reason so we don't create something less than what he is
>> expecting for the future of Renesas pin control.
>>
>> The series as such seems fine and is reusing Tony's work to generalize
>> pin controllers putting functions and groups into the device tree in a nice
>> way, which makes it relevant for him to have a look as well, if he has
>> time.
>
> Well I don't have the series in my inbox, but browsing through
> the patchwork seems OK. The things to check would be:

Sorry about this, I thought sending to linux-gpio was enough.
We'll keep you in the loop now...

>
> 1. Do you guys really need RZ_PIN_DESC? Just let pinctrl
>    framework generate the names, then do some simple user
>    space tool that decodes the debugfs output. If you really
>    need names, allow the consumer to set the name like we do
>    for GPIOs and interrupts when requesting the resource.
>

Well, more than names I have used the RZ_PIN_DESC macro as an extended 
version of the PINCTRL_PIN one, to set bank and pin fields of the 
rz_pin_desc structure that describes a pin.

The proposed DTS syntax identifies pins by their position (bank:pin) 
instead that by index, so I need to have those information available in 
pin description to identify them.

> 2. Make sure you're using hardware offsets for any indexing
>    to avoid adding artificial mapping tables between the driver
>    and the the dts file. Many times new features are enabled
>    between SoC revisions and a numbered index gets out of sync
>    and needs constant patching just like we have for interrupt
>    numbers earlier.. I don't think that's an issue with this
>    series, but please check one more time for easy maintenance :)
>

As we describe pins "by position", if I got your comment properly, we 
should be safe, as indexes are purely incremental values from [0-npins].

I know pinctrl-single (and other drivers such as imx one if I'm not 
wrong) uses pin indexes to calculate register offsets. This series 
doesn't but uses the [bank:pin] couple for that purpose instead.

Thanks
    j


> Regards,
>
> Tony
>

