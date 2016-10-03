From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: fix masking of pinmux functions
Date: Mon, 3 Oct 2016 13:53:55 -0700
Message-ID: <CAJOFmgzfEoxOPnfaZOBtt6TVKcuKqFR5_O3nP5pNHHuL_+5eeQ@mail.gmail.com>
References: <1473673015-33124-1-git-send-email-john@phrozen.org>
 <CAJOFmgx3Y01DZvUU=wF68HLWRrUoiHAcOYtVjw6LsqvE3+Ds8w@mail.gmail.com>
 <20160926155209.GC7509@tuxbot> <CACRpkdZgZiuLnbVK9bS9myYD7R4WirXo20XwmSMQtLPvDpN9SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35611 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752362AbcJCUyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2016 16:54:17 -0400
Received: by mail-it0-f46.google.com with SMTP id r192so127088345ita.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2016 13:54:16 -0700 (PDT)
In-Reply-To: <CACRpkdZgZiuLnbVK9bS9myYD7R4WirXo20XwmSMQtLPvDpN9SA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, John Crispin <john@phrozen.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 3, 2016 at 6:31 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Sep 26, 2016 at 5:52 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>> On Sun 25 Sep 23:36 PDT 2016, Stephen Boyd wrote:
>>
>>> On Mon, Sep 12, 2016 at 2:36 AM, John Crispin <john@phrozen.org> wrote:
>>> > The following commit introduced a regression by not properly masking the
>>> > calculated value.
>>> >
>>> > commit 47a01ee9a6c39fe1 ("pinctrl: qcom: Clear all function selection bits")
>>
>> Please use the format: Fixes: %h (\"%s\")
>>
>>> >
>>> > Signed-off-by: John Crispin <john@phrozen.org>
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

It hit my (linaro) spam for some reason. Must be a problem between the
sending side and how google mail classifies spam.
