From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: remove redundant assignments
Date: Thu, 2 Jun 2016 14:24:28 +0200
Message-ID: <CACRpkdamr+ZQH8bFNVZyY-8bJf5tFPJA-maZ2ROVEjdhaELhbw@mail.gmail.com>
References: <1464703557-60539-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36673 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473AbcFBMY3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 08:24:29 -0400
Received: by mail-oi0-f41.google.com with SMTP id j1so73907694oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 05:24:29 -0700 (PDT)
In-Reply-To: <1464703557-60539-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 31, 2016 at 4:05 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are few redundant assignments of ret variable which is updated anyway.
> Remove them for good.
>
> While here, correct indentation of the constant definition and remove one empty
> line.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
