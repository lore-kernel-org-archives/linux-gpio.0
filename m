From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: fix masking of pinmux functions
Date: Mon, 3 Oct 2016 15:31:29 +0200
Message-ID: <CACRpkdZgZiuLnbVK9bS9myYD7R4WirXo20XwmSMQtLPvDpN9SA@mail.gmail.com>
References: <1473673015-33124-1-git-send-email-john@phrozen.org>
 <CAJOFmgx3Y01DZvUU=wF68HLWRrUoiHAcOYtVjw6LsqvE3+Ds8w@mail.gmail.com> <20160926155209.GC7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160926155209.GC7509@tuxbot>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, John Crispin <john@phrozen.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 26, 2016 at 5:52 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Sun 25 Sep 23:36 PDT 2016, Stephen Boyd wrote:
>
>> On Mon, Sep 12, 2016 at 2:36 AM, John Crispin <john@phrozen.org> wrote:
>> > The following commit introduced a regression by not properly masking the
>> > calculated value.
>> >
>> > commit 47a01ee9a6c39fe1 ("pinctrl: qcom: Clear all function selection bits")
>
> Please use the format: Fixes: %h (\"%s\")
>
>> >
>> > Signed-off-by: John Crispin <john@phrozen.org>
>>
>> Now I'm confused how it ever worked.... but agreed, the code looks wrong.
>
> I agree, we should have seen some issues based on this, I presume we
> where "lucky".
>
>>
>> Reviewed-by: Stephen Boyd <stephen.boyd@linaro.org>
>>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> @Linus, the corrected patch appeared in v4.8-rc1, would you mind
> including this in a pull for v4.8?

I would have, had I been more attentive. And you even told me in person to
look at this :/ sorry.

Now I have the problem that I don't have the original patch in my inbox
at all: it might have been sent to some qcom-specific mailing list?

John: can you include the ACKs and resend with me on the To: line?

Yours,
Linus Walleij
