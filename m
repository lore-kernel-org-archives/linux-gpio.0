From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V6 2/5] of: move of_parse_phandle()
Date: Fri, 30 Aug 2013 19:32:09 -0500
Message-ID: <CAL_JsqL0XO1o25a4kLmDcgiZw4Jp-1kotAw3cDUT0NT-O2tv_A@mail.gmail.com>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
	<1376515632-12594-2-git-send-email-swarren@wwwdotorg.org>
	<CACRpkdYK75uSXLmzkQ9uNQfSBW86bSz3D0nYSr_XSXfixKSDGg@mail.gmail.com>
	<5220FC13.4070708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vb0-f47.google.com ([209.85.212.47]:46447 "EHLO
	mail-vb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab3HaAcK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2013 20:32:10 -0400
In-Reply-To: <5220FC13.4070708@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>

On Fri, Aug 30, 2013 at 3:09 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 08/28/2013 01:30 PM, Linus Walleij wrote:
>> On Wed, Aug 14, 2013 at 11:27 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>
>>> From: Stephen Warren <swarren@nvidia.com>
>>>
>>> Move of_parse_phandle() after __of_parse_phandle_with_args(), since a
>>> future patch will call __of_parse_phandle_with_args() from
>>> of_parse_phandle(). Moving the function avoids adding a prototype. Doing
>>> the move separately highlights the code changes separately.
>>>
>>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>>> ---
>>> v5: New patch.
>>
>> Still no feedback from Rob || Grant on this quite important cleanup?
>>
>> I would like to nominate Stephen Warren as co-maintainer of
>> drivers/of/*, he definately knows his way around the code.
>> I'm just worried that he may not accept due to a lot of work in the
>> bindings already.
>
> I would prefer not to be flooded with any more email. That said,
> /swapping/ my DT binding reviewer position with a drivers/of reviewer
> position would reduce the email load.

I would be happy with your help either way. But don't get your hopes
up, drivers/of is not much of a relief from the flood of DT bindings.
:)

Rob
