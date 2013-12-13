From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH V2] gpio: rcar: Fix level interrupt handling
Date: Fri, 13 Dec 2013 21:31:34 +0900
Message-ID: <CANqRtoTTur+8_VTV4AQiVqZ+TQfHVH3ONHbOBcByE_4JSNqo8Q@mail.gmail.com>
References: <1385748249-27170-1-git-send-email-valentine.barshak@cogentembedded.com>
	<CACRpkdbeT8fp4i-ahpzZN2MnC7uYAcuLH7SOgJnpL54XBaoTqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:44526 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751697Ab3LMMbg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2013 07:31:36 -0500
In-Reply-To: <CACRpkdbeT8fp4i-ahpzZN2MnC7uYAcuLH7SOgJnpL54XBaoTqw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Valentine Barshak <valentine.barshak@cogentembedded.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Fri, Dec 13, 2013 at 4:54 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 29, 2013 at 7:04 PM, Valentine Barshak
> <valentine.barshak@cogentembedded.com> wrote:
>
>> According to the manual, if a port is set for level detection using
>> the corresponding bit in the edge/level select register and an external
>> level interrupt signal is asserted, the corresponding bit in INTDT
>> does not use the FF to hold the input.
>> Thus, writing 1 to the corresponding bits in INTCLR cannot clear the
>> corresponding bits in the INTDT register. Instead, when an external
>> input signal is stopped, the corresponding bit in INTDT is cleared
>> automatically.
>>
>> Since the INTDT bit cannot be cleared for the level interrupts until
>> the interrupt signal is stopped, we end up with the infinite loop
>> when using deferred (threaded) IRQ handling.
>>
>> Since a deferred interrupt is disabled by the low-level handler and
>> re-enabled only when the deferred handler is completed, Fix the issue
>> by dropping disabled interrupts from the pending mask as suggested by
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Changes in V2:
>> * Drop disabled interrupts from pending mask altogether instead of
>>   dropping level interrupts one by one once they get handled.
>>
>> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
>
> This v2 version applied to fixes with Laurent's and Magnus' ACKs,
> tell me if it also need to go into -stable.

Thanks for your help, Linus! I don't think there is any need to involve -stable.

Cheers,

/ magnus
