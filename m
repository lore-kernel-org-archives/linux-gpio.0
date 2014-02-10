From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Correct meaning of the GPIO active low flag
Date: Mon, 10 Feb 2014 16:04:30 -0700
Message-ID: <52F95AFE.4070904@wwwdotorg.org>
References: <4298328.sSSAEV5F8t@avalon> <52F904B3.2010304@wwwdotorg.org> <52F90507.6030400@wwwdotorg.org> <3858007.V4FxlF8qeO@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45352 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbaBJXEd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2014 18:04:33 -0500
In-Reply-To: <3858007.V4FxlF8qeO@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 02/10/2014 10:52 AM, Laurent Pinchart wrote:
> On Monday 10 February 2014 09:57:43 Stephen Warren wrote:
>> On 02/10/2014 09:56 AM, Stephen Warren wrote:
...
>>> I think the flag should represent the physical level of the signal on
>>> the board at the device pin. I'm pretty sure that's what's most
>>> consistent with existing DT properties.
>>
>> (That would have to be the GPIO source device, in order to account for
>> any board-induced inversion)
> 
> Would that be the physical level at the GPIO source device output to achieve a 
> high level at the target device input pin, or the physical level at the GPIO 
> source device output to assert the signal at the target device input pin ? The 
> first case wouldn't take the receiver device internal inverter into account 
> while the second case would. In the second case, how should we handle receiver 
> devices that have configurable signal polarities (essentially 
> enabling/disabling the internal inverter from a software-controller 
> configuration) ?

I would expect the flag to represent the physical level that achieves
(or represents, for inputs) a logically asserted value at the device.

I don't think we should make the level flag influence any kind of
configurable level within the device; that's a separate orthogonal, but
related, concept. It'd be best if the DT binding for the device either
(a) provided a separate property to configure that, or (b) picked a
single one of the configurable values, and documented that all DTs
should assume that value.
