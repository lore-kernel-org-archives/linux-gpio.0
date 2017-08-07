From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: merrifield: Correct UART pin lists
Date: Mon, 7 Aug 2017 15:23:57 +0200
Message-ID: <CACRpkdZrN+p+rG46eQ4dBXcjttGHVT0MunKav-rwa+HOy1k2vA@mail.gmail.com>
References: <20170804162634.25854-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:36038 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751919AbdHGNX7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 09:23:59 -0400
Received: by mail-it0-f46.google.com with SMTP id 77so3383711itj.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 06:23:59 -0700 (PDT)
In-Reply-To: <20170804162634.25854-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Fri, Aug 4, 2017 at 6:26 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> UART pin lists consist GPIO numbers which is simply wrong.
> Replace it by pin numbers.
>
> Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
