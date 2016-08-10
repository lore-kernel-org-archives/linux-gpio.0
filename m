From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: merrifield: Add missed header
Date: Wed, 10 Aug 2016 15:47:40 +0200
Message-ID: <CACRpkda3zE2CVpNOH-P-qfU+rR6x03jzgwPG+cMWrX8XL6_13A@mail.gmail.com>
References: <1470151113-75409-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34640 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934899AbcHJTXd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Aug 2016 15:23:33 -0400
Received: by mail-oi0-f48.google.com with SMTP id l203so72722718oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Aug 2016 12:23:33 -0700 (PDT)
In-Reply-To: <1470151113-75409-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 2, 2016 at 5:18 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> On x86 builds the absense of <linux/io.h> makes static analyzer and compiler
> unhappy which fails to build the driver.

Patch applied. Thanks a lot Andy!

Yours,
Linus Walleij
