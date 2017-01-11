From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] pinctrl: baytrail: Convert to use devm_*()
Date: Wed, 11 Jan 2017 14:14:30 +0100
Message-ID: <CACRpkdbWkVwd8kv_q9PT53TwTcgkZgxWgcp0+jp3qCzCNSqc6w@mail.gmail.com>
References: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com> <20170110201139.129737-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:34817 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751802AbdAKNOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 08:14:31 -0500
Received: by mail-qt0-f173.google.com with SMTP id x49so128466037qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 05:14:31 -0800 (PST)
In-Reply-To: <20170110201139.129737-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Robert R . Howell" <rhowell@uwyo.edu>

On Tue, Jan 10, 2017 at 9:11 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This simplifies error handling and allows us to drop error path handlers
> completely.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
