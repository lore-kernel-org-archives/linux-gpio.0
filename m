From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: add get_direction function
Date: Wed, 22 Feb 2017 16:49:49 +0100
Message-ID: <CACRpkdaoHTZa+XjEBAMtO2dS1jevi5h-QYe90SrZDuJghQSyYw@mail.gmail.com>
References: <1486768860-18237-1-git-send-email-timur@codeaurora.org> <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:35442 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932452AbdBVPt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:49:56 -0500
Received: by mail-io0-f169.google.com with SMTP id j18so4589617ioe.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:49:51 -0800 (PST)
In-Reply-To: <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Timur Tabi <timur@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Feb 11, 2017 at 12:25 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 02/10/2017 03:21 PM, Timur Tabi wrote:

>> +     return val & BIT(g->oe_bit) ? 0 : 1;
>
> Maybe we can use the macros GPIOF_DIR_IN and GPIOF_DIR_OUT here instead?

Actually no. The GPIOF* #defines are for the consumer side of GPIO,
not the driver side. We actually just use 0/1 in drivers.

So I merged this v1 version.

Yours,
Linus Walleij
