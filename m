From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: lynxpoint: avoid potential warning on error path
Date: Thu, 23 Jun 2016 10:04:33 +0200
Message-ID: <CACRpkdZd92zcx-FgojoE9jQXiBd+yjXZewDY2XfY9cH3Q1ShEQ@mail.gmail.com>
References: <1466352404-23685-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34137 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbcFWIEf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 04:04:35 -0400
Received: by mail-oi0-f42.google.com with SMTP id s66so58907942oif.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 01:04:35 -0700 (PDT)
In-Reply-To: <1466352404-23685-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Sun, Jun 19, 2016 at 6:06 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When devres API is in use we are not supposed to call plain gpiochip_remove().
> Remove redundant call to gpiochip_remove().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
