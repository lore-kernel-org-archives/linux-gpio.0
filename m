From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: intel-mid: Make it depend to X86_INTEL_MID
Date: Mon, 11 Jul 2016 11:00:07 +0200
Message-ID: <CACRpkdZDMqqzP8r6pK2KACKPaU=2JvFuksY8p=5cuXgjdTy+qQ@mail.gmail.com>
References: <1467924308-137452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36064 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075AbcGKJAI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 05:00:08 -0400
Received: by mail-oi0-f47.google.com with SMTP id n8so36684067oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 02:00:08 -0700 (PDT)
In-Reply-To: <1467924308-137452-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Cohen <david.a.cohen@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, Jul 7, 2016 at 10:45 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This GPIO controller is a part of Intel MID platforms which are somehow
> different to pure PCs. Thus, there is no need that driver is compiled for them.
>
> Replace dependency to X86_INTEL_MID.
>
> While here, fix capitalization of MID abbreviation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Previously I might have complained about the loss of compilation
coverage and "what about COMPILE_TEST" but it bit me so hard
in -next that I'm not pushing the point anymore...

Yours,
Linus Walleij
