From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] [v11] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 28 Dec 2017 13:36:01 +0100
Message-ID: <CACRpkda5FQg3W4rnxihVB9y2yv-oF1CwBzFJsKB8cxzQ+zoHNg@mail.gmail.com>
References: <1513797033-9494-1-git-send-email-timur@codeaurora.org>
 <CACRpkdYtMbACG0D2zjgw-kN_3pb_VDGH_3DDhyMQD92eE5P0Gw@mail.gmail.com> <20171227020142.GZ7997@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:37842 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751431AbdL1MgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Dec 2017 07:36:02 -0500
Received: by mail-io0-f174.google.com with SMTP id n14so14965946iob.4
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2017 04:36:02 -0800 (PST)
In-Reply-To: <20171227020142.GZ7997@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Andrew Cooks <andrew.cooks@opengear.com>

On Wed, Dec 27, 2017 at 3:01 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/21, Linus Walleij wrote:
>> Hi Timur,
>>
>> thank you for your perseverance. I am sorry that I am sometimes not
>> fast to respond :(
>>
>> On Wed, Dec 20, 2017 at 8:10 PM, Timur Tabi <timur@codeaurora.org> wrote:
>>
>> > Patch 1 reverts an old patch that triggers a get_direction of every
>> > pin upon init, without attempting to request the pins first.  The
>> > direction is already being queried when the pin is requested.
>> >
>> > Patch 2 adds support to pinctrl-msm for "unavailable" GPIOs.
>>
>> I have applied both of these to the pinctrl "devel" branch so we
>> can see if all is fine.
>>
>> They have Stephen's ACK so I am happy with them, I am just
>> still slightly worried about possible regressions because of
>> patch 1.
>>
>> > Patch 3 extends that support to pinctrl-qdf2xxx.  A recent ACPI change
>> > on QDF2400 platforms blocks access to most pins, so the driver can only
>> > register a subset.
>>
>> I see this one is still under discussion.
>>
>> If nothing drastic happens with patch 1/2 in linux-next
>> it should be fine if you just resend this single patch in subsequent
>> submissions.
>>
>
> If we go with my suggestion, patch 2 is not necessary and should
> be dropped.

OK I have reverted it.

> The different approaches come down to expressing
> which pins are available through the gpio valid mask, or through
> the npins field of the msm pinctrl driver. Also, my approach
> covers more than just GPIOs, it covers irqs and adjusts the
> pinctrl pin request function so that pinctrl can't request
> unavailable pins.

I agree, this is better.

Would even patch 1 be needed after this? Maybe I should
revert that too. Leaving that code in has the upside of showing
the actual initial directions of GPIO lines even if they have
not been requested, in e.g. debugfs.

Yours,
Linus Walleij
