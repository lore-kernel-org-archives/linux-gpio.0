From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio:mcp23s08 Fixed missing interrupts
Date: Tue, 14 Mar 2017 14:19:57 +0100
Message-ID: <CACRpkdae8rBKrbny3T47FXx+7=hpzDi7kNvQ-VSOjkvsW=zz3w@mail.gmail.com>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com> <1487777658-12951-2-git-send-email-robert.middleton@rm5248.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:32880 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751720AbdCNNUJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 09:20:09 -0400
Received: by mail-io0-f172.google.com with SMTP id f84so102743988ioj.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 06:20:03 -0700 (PDT)
In-Reply-To: <1487777658-12951-2-git-send-email-robert.middleton@rm5248.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: robert.middleton@rm5248.com
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Feb 22, 2017 at 4:34 PM,  <robert.middleton@rm5248.com> wrote:

> From: Robert Middleton <robert.middleton@rm5248.com>
>
> When an interrupt occurs on an MCP23S08 chip, the INTF register will only
> contain one bit as causing the interrupt.  If more than two pins change at
> the same time on the chip, this causes one of the pins to not be reported.
> This patch fixes the logic for checking if a pin has changed, so that
> multiple pins will always cause more than one change.
>
> Signed-off-by: Robert Middleton <robert.middleton@rm5248.com>

OMG that looks complicated. But good commit with proper comments,
so patch applied for fixes. I had to do some fuzzing patch -p1 < foo.patch
so please check the result.

Yours,
Linus Walleij
