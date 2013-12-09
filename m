From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/4] gpiolib: clean up messaging part
Date: Mon, 9 Dec 2013 14:12:44 +0100
Message-ID: <CACRpkdaWczYSWdRc-_zf3b=niGCQjFoLs1hPCLCkn4iEVbpPYw@mail.gmail.com>
References: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<52A12AF0.1020406@nvidia.com>
	<1386578995.1871.98.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:42692 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933431Ab3LINMp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 08:12:45 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so3805360oag.33
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2013 05:12:45 -0800 (PST)
In-Reply-To: <1386578995.1871.98.camel@smile>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alex Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, Dec 9, 2013 at 9:49 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, 2013-12-06 at 10:40 +0900, Alex Courbot wrote:
>> Series looks good to me. Thanks for addressing the issues.
>
> Thank you for review.
> Linus, if you have no objections, could you apply this series?

Looking at it now, you had dependecies which had dependecies
which had dependecies so I'm working up the ladder starting
with merging in the fixes to the devel branch.

Yours,
Linus Walleij
