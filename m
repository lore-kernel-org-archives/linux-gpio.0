From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: merrifield: Add pin config group handlers
Date: Sat, 29 Oct 2016 10:34:19 +0200
Message-ID: <CACRpkdatvanaiSK6GrHT7jaBcDA4g_rBH+JWLpuMO++AYUfc1A@mail.gmail.com>
References: <20161027161015.138390-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:36128 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756860AbcJ2IeU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2016 04:34:20 -0400
Received: by mail-qk0-f173.google.com with SMTP id o68so113148619qkf.3
        for <linux-gpio@vger.kernel.org>; Sat, 29 Oct 2016 01:34:20 -0700 (PDT)
In-Reply-To: <20161027161015.138390-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Oct 27, 2016 at 6:10 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Pin config get() and set() handlers for pin groups were previously not
> implemented by this driver. The pin_config_group_set() is particularly useful
> for applying a common config setting to all pins in a specified group with a
> single call, without the caller needing to reference each individual pin by
> name.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
