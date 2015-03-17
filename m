From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: dwapb: enable for Quark
Date: Tue, 17 Mar 2015 13:20:30 +0100
Message-ID: <CACRpkdbcgJA4x_Xub_J2TiV6_uFD1x5EOwCxpQ3OgpzD=DFFTg@mail.gmail.com>
References: <1425573965-6971-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33672 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752299AbbCQMUa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 08:20:30 -0400
Received: by oibu204 with SMTP id u204so6370306oib.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 05:20:30 -0700 (PDT)
In-Reply-To: <1425573965-6971-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Raymond Tan <raymond.tan@intel.com>, "Ong, Boon Leong" <boon.leong.ong@intel.com>

On Thu, Mar 5, 2015 at 5:46 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The Intel Quark SoC contains the DW GPIO on board. While fixing the build error
> the commit 1972c97db5b0 (gpio: dwapb: fix compile errors) disables the
> possibility to build the driver on X86, i.e. Intel Quark.
>
> The patch reenables it for Intel Quark as well.
>
> Since we have Intel Quark SoC introduced in 4.0-rc1 I would like to make this
> fix available there as well, though the actual MFD driver [1] is not yet
> applied.
>
> [1] https://lkml.org/lkml/2015/2/1/217
>
> Fixes: 1972c97db5b0 (gpio: dwapb: fix compile errors)
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sorry commit b90f8f22ed86f4f1a38dd2178c4be558c0c70fb9
"gpio: dwapb: re-enable GPIO_DWAPB for arm64"
conflicts, re-enabling it for ARM64.

Can you rebase ... part of me just wanna enable this driver
for the whole world, don't see why we need to narrow it down
so much.

Yours,
Linus Walleij
