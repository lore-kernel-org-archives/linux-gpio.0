From: John Crispin <john@phrozen.org>
Subject: Re: [PATCH] pinctrl: qcom: fix masking of pinmux functions
Date: Mon, 3 Oct 2016 16:24:43 +0200
Message-ID: <33879b14-5114-d994-335c-b2e7e8d8dd4d@phrozen.org>
References: <1473673015-33124-1-git-send-email-john@phrozen.org>
 <CAJOFmgx3Y01DZvUU=wF68HLWRrUoiHAcOYtVjw6LsqvE3+Ds8w@mail.gmail.com>
 <20160926155209.GC7509@tuxbot>
 <CACRpkdZgZiuLnbVK9bS9myYD7R4WirXo20XwmSMQtLPvDpN9SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:47745 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751201AbcJCOYr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Oct 2016 10:24:47 -0400
In-Reply-To: <CACRpkdZgZiuLnbVK9bS9myYD7R4WirXo20XwmSMQtLPvDpN9SA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On 03/10/2016 15:31, Linus Walleij wrote:
> On Mon, Sep 26, 2016 at 5:52 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>> On Sun 25 Sep 23:36 PDT 2016, Stephen Boyd wrote:
>>
>>> On Mon, Sep 12, 2016 at 2:36 AM, John Crispin <john@phrozen.org> wrote:
>>>> The following commit introduced a regression by not properly masking the
>>>> calculated value.
>>>>
>>>> commit 47a01ee9a6c39fe1 ("pinctrl: qcom: Clear all function selection bits")
>>
>> Please use the format: Fixes: %h (\"%s\")
>>
>>>>
>>>> Signed-off-by: John Crispin <john@phrozen.org>
>>>
>>> Now I'm confused how it ever worked.... but agreed, the code looks wrong.
>>
>> I agree, we should have seen some issues based on this, I presume we
>> where "lucky".
>>
>>>
>>> Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>
>>>
>>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> @Linus, the corrected patch appeared in v4.8-rc1, would you mind
>> including this in a pull for v4.8?
> 
> I would have, had I been more attentive. And you even told me in person to
> look at this :/ sorry.
> 
> Now I have the problem that I don't have the original patch in my inbox
> at all: it might have been sent to some qcom-specific mailing list?
> 
> John: can you include the ACKs and resend with me on the To: line?
> 
> Yours,
> Linus Walleij
> 

Sure, is there a patchwork where i can export it with all the Acks ?

	John
