From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio:mcp23s08 Fixed missing interrupts
Date: Fri, 17 Mar 2017 09:21:33 +0100
Message-ID: <CACRpkdbnov_E1ZV3B4T1Xm3-0Zzt2q+SFUHmrcXMDSRAr0by4w@mail.gmail.com>
References: <1489611407-23884-1-git-send-email-robert.middleton@rm5248.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:36484 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbdCQIa1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2017 04:30:27 -0400
Received: by mail-it0-f46.google.com with SMTP id w124so15546571itb.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2017 01:30:26 -0700 (PDT)
In-Reply-To: <1489611407-23884-1-git-send-email-robert.middleton@rm5248.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Mar 15, 2017 at 9:56 PM,  <robert.middleton@rm5248.com> wrote:

> From: Robert Middleton <robert.middleton@rm5248.com>
>
> When an interrupt occurs on an MCP23S08 chip, the INTF register will only
> contain one bit as causing the interrupt.  If more than two pins change at
> the same time on the chip, this causes one of the pins to not be reported.
> This patch fixes the logic for checking if a pin has changed, so that
> multiple pins will always cause more than one change.
>
> Signed-off-by: Robert Middleton <robert.middleton@rm5248.com>

Patch applied for fixes with Phil's Tested-by and tagged for stable.

Yours,
Linus Walleij
