From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: mockup: return -EFAULT if copy_from_user() fails
Date: Thu, 23 Feb 2017 14:52:53 +0100
Message-ID: <CACRpkdYtcY2Jp2_Uc-wooKA5U7H4mz4foX+vMCVsUXYUdfx_Dg@mail.gmail.com>
References: <20170214230206.GA4048@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:35731 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbdBWNxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 08:53:34 -0500
Received: by mail-it0-f52.google.com with SMTP id 203so175748665ith.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 05:52:55 -0800 (PST)
In-Reply-To: <20170214230206.GA4048@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 15, 2017 at 12:02 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> copy_from_user() returns the number of bytes remaining to be copied but
> we want to return negative error codes on failue.
>
> Fixes: 9202ba2397d1 ("gpio: mockup: implement event injecting over debugfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij
