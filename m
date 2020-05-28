Return-Path: <SRS0=117c=7K=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEE6C433DF
	for <linux-gpio@archiver.kernel.org>; Thu, 28 May 2020 14:20:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AECDC207D3
	for <linux-gpio@archiver.kernel.org>; Thu, 28 May 2020 14:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="XUhRFuuI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390954AbgE1OUa (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 28 May 2020 10:20:30 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:58367 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390924AbgE1OU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 May 2020 10:20:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eJOQjnPsJDazBeJOTjriE7; Thu, 28 May 2020 16:20:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590675626; bh=RLMkUvwdHzJ0rkII+qmpdU3AJCwc8eOQShgJ6HasaAw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XUhRFuuIFgZ0gqAf6RiTS/ZFTBiFtN97X52Ra2X0+cApgbFv1hmiJTmbzgNdRS9kZ
         NqCmnCPiAIQLJRerRZnJGXDwlAaTGsqZVXDqUHIqmghWG/jVJAe72UFeMn4ZGbS20E
         L5rXDW3R+WWfH+kZRziubw7b6dwPDnu2uboDCefa5+bjGvDUnJ3D7ZLlbugNLKsm0N
         TZhDcW/A062lQXE3NHK4sCpRgx6PjQ6PR2T7rs3P3QHFvovCDg3dMfnq44F60e4pws
         AfIMfWlrFTsVgpKS8WfOKZCa/Jue/9aim5PwRwhz4Fh1OZkElliQQMawAJPvHl30zG
         o52CSVH2aaDFQ==
Subject: Re: [PATCH] gpio: fix locking open drain IRQ lines
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        stable <stable@vger.kernel.org>
References: <20200527140758.162280-1-linus.walleij@linaro.org>
 <20200527141807.GQ1551@shell.armlinux.org.uk>
 <CACRpkdbnLS2G6UH3L5u71RvP-heDqoOk+k9cW=9_4pJ_u3w0zg@mail.gmail.com>
 <20200528135825.GV1551@shell.armlinux.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fb7fd3d3-ad77-aefc-b257-d48777027ea7@xs4all.nl>
Date:   Thu, 28 May 2020 16:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200528135825.GV1551@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAsgfI+GHk9CH3sLeIcTXQYh1PNZiQHWSmlxic8QvMHL8euuH3lUnzID+rACzasfPRHVNUDYTFXGd9y22Povgk/ypaepbogV5AlOqDvfGE0YSxccpEDb
 so1xo76106F+M0TIWuBMqdXDD8mGMfNPvFfJsRSpzMJyGUyw0vt36XUkD8mqcGjSgSsu8ZNy9GKnfTApaBzoGEJXv2Y5STgbX/tYDMTtVMioLU7zDaqhyZL+
 Rl08RfOLmJlIDLvl+5PMNqbOxjKmAlGNXqsphDimJgn5DVeXjnHITGk+Ru9+12XDE71JrAYINrG+OlpozipKPA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/05/2020 15:58, Russell King - ARM Linux admin wrote:
> On Thu, May 28, 2020 at 03:46:04PM +0200, Linus Walleij wrote:
>> On Wed, May 27, 2020 at 4:18 PM Russell King - ARM Linux admin
>> <linux@armlinux.org.uk> wrote:
>>> On Wed, May 27, 2020 at 04:07:58PM +0200, Linus Walleij wrote:
>>
>>>> We provided the right semantics on open drain lines being
>>>> by definition output but incidentally the irq set up function
>>>> would only allow IRQs on lines that were "not output".
>>>>
>>>> Fix the semantics to allow output open drain lines to be used
>>>> for IRQs.
>>>>
>>>> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
>>>> Cc: Russell King <linux@armlinux.org.uk>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 256efaea1fdc ("gpiolib: fix up emulated open drain outputs")
>>>
>>> As I've pointed out in the reporting thread, I don't think it can be
>>> justified as a regression - it's a bug in its own right that has been
>>> discovered by unifying the gpiolib semantics, since the cec-gpio code
>>> will fail on hardware that can provide real open-drain outputs
>>> irrespective of that commit.
>>>
>>> So, you're really fixing a deeper problem that was never discovered
>>> until gpiolib's semantics were fixed to be more uniform.
>>
>> You're right, I was thinking of Fixes: as more of a mechanical
>> instruction to the stable kernel maintainers administrative machinery.
>>
>> I will use the other way to signal to stable where to apply this.
> 
> I think it makes sense to apply this patch to stable kernels prior to
> the commit mentioned in the Fixes tag - but how far back is a good
> question.  Certainly to the point that we ended up with code relying
> on this behaviour (so when cec-gpio was introduced?)
> 

For the record, cec-gpio started to rely on this behavior in kernel 5.3.
There is no need to go back to pre-5.3 kernels.

Regards,

	Hans
