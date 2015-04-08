From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Wed, 8 Apr 2015 17:03:55 +0200
Message-ID: <CACRpkdYTpLKXRdeCVMkCnXmBg84HEsc0qzfPai5dFOnQ1G+ZVg@mail.gmail.com>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:38458 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866AbbDHPDz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 11:03:55 -0400
Received: by igbqf9 with SMTP id qf9so40661009igb.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 08:03:55 -0700 (PDT)
In-Reply-To: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Mar 31, 2015 at 10:30 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:

> From: Vineet Gupta <vgupta@synopsys.com>
>
> Synopsys SDP platform uses DW GPIO controller in design with
> ARC cores. So adding ARC to architectures that may select this
> GPIO controller.
>
> Even though support for Synopsys SDP is yet to be submitted we'll need
> this tiny option enabled at least for properly working interrupts (DW
> GPIO controller is used as interrupt controller).
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied.

But ...

> -       depends on ((ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK
> +       depends on ((ARC || ARM || ARM64) && OF_GPIO) || X86_INTEL_QUARK

This is getting a bit silly. What stops us from actually just enabling
it for any architecture?

Yours,
Linus Walleij
