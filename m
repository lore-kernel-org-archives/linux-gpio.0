From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Fri, 14 Feb 2014 17:07:32 -0700
Message-ID: <52FEAFC4.1010700@wwwdotorg.org>
References: <4298328.sSSAEV5F8t@avalon> <7178755.iaUGSV8r4q@avalon> <52FCF7B5.3090308@wwwdotorg.org> <1685570.ksipjkfZzD@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40683 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752889AbaBOAHf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2014 19:07:35 -0500
In-Reply-To: <1685570.ksipjkfZzD@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 02/14/2014 04:48 PM, Laurent Pinchart wrote:
> Hi Stephen,
> 
> On Thursday 13 February 2014 09:49:57 Stephen Warren wrote:
>> On 02/13/2014 07:43 AM, Laurent Pinchart wrote:
>>> On Wednesday 12 February 2014 09:50:37 Stephen Warren wrote:
>>>> On 02/10/2014 04:21 PM, Laurent Pinchart wrote:
>>>>> On Monday 10 February 2014 16:04:30 Stephen Warren wrote:
>>>>>> On 02/10/2014 10:52 AM, Laurent Pinchart wrote:
>>>>>>> On Monday 10 February 2014 09:57:43 Stephen Warren wrote:
>>>>>>>> On 02/10/2014 09:56 AM, Stephen Warren wrote:
>>>>>> ...
>>>>>>
>>>>>>>>> I think the flag should represent the physical level of the signal
>>>>>>>>> on the board at the device pin. I'm pretty sure that's what's most
>>>>>>>>> consistent with existing DT properties.
>>>>>>>>
>>>>>>>> (That would have to be the GPIO source device, in order to account
>>>>>>>> for any board-induced inversion)
>>>>>>>
>>>>>>> Would that be the physical level at the GPIO source device output to
>>>>>>> achieve a high level at the target device input pin, or the physical
>>>>>>> level at the GPIO source device output to assert the signal at the
>>>>>>> target device input pin ? The first case wouldn't take the receiver
>>>>>>> device internal inverter into account while the second case would. In
>>>>>>> the second case, how should we handle receiver devices that have
>>>>>>> configurable signal polarities (essentially enabling/disabling the
>>>>>>> internal inverter from a software-controller configuration) ?
>>>>>>
>>>>>> I would expect the flag to represent the physical level that achieves
>>>>>> (or represents, for inputs) a logically asserted value at the device.
>>>>>
>>>>> I assume you mean "the physical level at the GPIO controller output".
>>>>
>>>> Yes.
>>>>
>>>>>> I don't think we should make the level flag influence any kind of
>>>>>> configurable level within the device; that's a separate orthogonal, but
>>>>>> related, concept. It'd be best if the DT binding for the device either
>>>>>> (a) provided a separate property to configure that, or (b) picked a
>>>>>> single one of the configurable values, and documented that all DTs
>>>>>> should assume that value.
>>>>>
>>>>> Agreed. I've phrased my question incorrectly though.
>>>>>
>>>>> My concern with devices that have configurable input polarities is that
>>>>> the
>>>>
>>>> s/input/output/ I assume?
>>>
>>> No, I mean input.
>>
>> OK, I guess I was thinking about GPIO inputs then; the same discussion
>> applies in reverse.
>>
>>> Think about video vertical/horizontal sync inputs, they usually have
>>> configurable polarities on the receiver side. In that case the physical
>>> level at the GPIO controller output that achieves a logically asserted
>>> value at the device depends on how the device is configured at runtime.
>>
>> Sure.
>>
>> I think the GPIO specifier should specify the signal polarity required
>> to get a logically asserted signal to the device. If the device can be
>> configured to accept different signal polarities as logically asserted,
>> then that must indeed be a separate DT property to the GPIO specifier,
>> since the GPIO specifier's format and semantics are only meaningful (and
>> parsable/interpretable) to the GPIO controller, and not the GPIO consumer.
> 
> Agreed, but that's not my point (or maybe I've just not understood that you 
> got my point). The small detail that made me concerned in the first place is 
> that, when the device input polarity is configurable, the "logically asserted 
> signal" state becomes dynamic. How do we define the DT GPIO polarity in that 
> case ?

Pick whichever polarity you want. Write that polarity into the GPIO
specifier's flags. If there's an inverter on the board between the GPIO
controller pin and the remote device pin, you need an extra property in
the device to specify how to program the polarity of the signal at the
device end too.

Perhaps the following will make my thoughts clearer:

http://www.spinics.net/lists/arm-kernel/msg307927.html
[PATCH 1/2] mfd: palmas: support IRQ inversion at the board level

http://www.spinics.net/lists/arm-kernel/msg307926.html
[PATCH 2/2] ARM: tegra: fix Dalmore PMIC IRQ polarity

> Let me take a (slightly made up) example. Let's assume a chip with a control 
> input signal connected to a GPIO output of an SoC without any inverter on the 
> board. The input polarity is runtime configurable (through I2C for instance). 
> The chip has two modes of operation (USB host or USB function for instance, or 
> ethernet link speed, ...), and for some reason, we need the input to be active 
> high in mode A and active low in mode B. This is handled in the chip device 
> driver that configures the input polarity based on the mode.

Oh, if you're talking about fiddling around at run-time, then that's
just something the driver has to deal with internally. In that case,
let's just make the GPIO active-high in DT. When the driver programs the
device into whatever mode requires it to be active-low, the driver needs
to be written to set that GPIO value correctly. I don't think DT has any
influence on this at all, since DT is about a static setup, whereas your
use-case is dynamic.

> The chip DT bindings will have a property that contains a reference to the 
> GPIO connected to the control input, and a flag to set the GPIO polarity. We 
> want that flag to express the physical level at the GPIO source to achieve an 
> asserted level at the chip input. That's active high in mode A and active low 
> in mode B (and would be the opposite if we had an inverter on the board). Now, 
> as the mode of operation is fully dynamic, what value should the DT flag have 
> (assuming there's no default mode from a chip point of view) ?
> 
>> Similarly, for inputs to the GPIO controller, the GPIO specifier should
>> specify the value at the GPIO controller too, and any configuration of
>> the output polarity of the device should be a separate property of that
>> device.
>>
>> The same argument applies to IRQs.

