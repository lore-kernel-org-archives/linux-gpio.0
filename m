From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: devres: Use global array of gpio suffixes
Date: Mon, 9 Jan 2017 19:57:30 +0100
Message-ID: <CACRpkda76kYCP5nOx3iqF7LnQFt8KLJZwyqOUiWxT9bs8P+1RA@mail.gmail.com>
References: <20170103170020.35844-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:33221 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758119AbdAIS5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 13:57:31 -0500
Received: by mail-qk0-f180.google.com with SMTP id s140so127752338qke.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2017 10:57:30 -0800 (PST)
In-Reply-To: <20170103170020.35844-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 3, 2017 at 6:00 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We have already a global array of possible GPIO suffixes. Use it here instead
> of another copy of them.
>
> Unfortunately this will not reduce the memory footprint, though allows to easy
> maintain list in only one place.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good catch.
Patch applied.

Yours,
Linus Walleij
