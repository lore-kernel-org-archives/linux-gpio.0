From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Thu, 13 Feb 2014 09:49:57 -0700
Message-ID: <52FCF7B5.3090308@wwwdotorg.org>
References: <4298328.sSSAEV5F8t@avalon> <1848152.lIn8ApGfEn@avalon> <52FBA65D.8060405@wwwdotorg.org> <7178755.iaUGSV8r4q@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45813 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820AbaBMQuA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2014 11:50:00 -0500
In-Reply-To: <7178755.iaUGSV8r4q@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 02/13/2014 07:43 AM, Laurent Pinchart wrote:
> Hi Stephen,
> 
> On Wednesday 12 February 2014 09:50:37 Stephen Warren wrote:
>> On 02/10/2014 04:21 PM, Laurent Pinchart wrote:
>>> On Monday 10 February 2014 16:04:30 Stephen Warren wrote:
>>>> On 02/10/2014 10:52 AM, Laurent Pinchart wrote:
>>>>> On Monday 10 February 2014 09:57:43 Stephen Warren wrote:
>>>>>> On 02/10/2014 09:56 AM, Stephen Warren wrote:
>>>> ...
>>>>
>>>>>>> I think the flag should represent the physical level of the signal on
>>>>>>> the board at the device pin. I'm pretty sure that's what's most
>>>>>>> consistent with existing DT properties.
>>>>>>
>>>>>> (That would have to be the GPIO source device, in order to account for
>>>>>> any board-induced inversion)
>>>>>
>>>>> Would that be the physical level at the GPIO source device output to
>>>>> achieve a high level at the target device input pin, or the physical
>>>>> level at the GPIO source device output to assert the signal at the
>>>>> target device input pin ? The first case wouldn't take the receiver
>>>>> device internal inverter into account while the second case would. In
>>>>> the second case, how should we handle receiver devices that have
>>>>> configurable signal polarities (essentially enabling/disabling the
>>>>> internal inverter from a software-controller configuration) ?
>>>>
>>>> I would expect the flag to represent the physical level that achieves (or
>>>> represents, for inputs) a logically asserted value at the device.
>>>
>>> I assume you mean "the physical level at the GPIO controller output".
>>
>> Yes.
>>
>>>> I don't think we should make the level flag influence any kind of
>>>> configurable level within the device; that's a separate orthogonal, but
>>>> related, concept. It'd be best if the DT binding for the device either
>>>> (a) provided a separate property to configure that, or (b) picked a
>>>> single one of the configurable values, and documented that all DTs
>>>> should assume that value.
>>>
>>> Agreed. I've phrased my question incorrectly though.
>>>
>>> My concern with devices that have configurable input polarities is that
>>> the
>>
>> s/input/output/ I assume?
> 
> No, I mean input.

OK, I guess I was thinking about GPIO inputs then; the same discussion
applies in reverse.

> Think about video vertical/horizontal sync inputs, they 
> usually have configurable polarities on the receiver side. In that case the 
> physical level at the GPIO controller output that achieves a logically 
> asserted value at the device depends on how the device is configured at 
> runtime.

Sure.

I think the GPIO specifier should specify the signal polarity required
to get a logically asserted signal to the device. If the device can be
configured to accept different signal polarities as logically asserted,
then that must indeed be a separate DT property to the GPIO specifier,
since the GPIO specifier's format and semantics are only meaningful (and
parsable/interpretable) to the GPIO controller, and not the GPIO consumer.

Similarly, for inputs to the GPIO controller, the GPIO specifier should
specify the value at the GPIO controller too, and any configuration of
the output polarity of the device should be a separate property of that
device.

The same argument applies to IRQs.
