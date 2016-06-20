From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 0/2] tools/gpio: switch to tools buildsystem
Date: Mon, 20 Jun 2016 21:17:13 +0900
Message-ID: <CAAVeFuKiB9cwJLS+AbAzEeZ0sAD84XFQKqS7cueOcpCK9Usf-Q@mail.gmail.com>
References: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33777 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408AbcFTMSI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2016 08:18:08 -0400
Received: by mail-io0-f194.google.com with SMTP id 5so18059003ioy.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2016 05:17:34 -0700 (PDT)
In-Reply-To: <1466368872-99495-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, Jun 20, 2016 at 5:41 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Current environment is not allowed to easily build the tools.
> Move to tools buildsystem to allow user build gpio tools using only existing
> kernel sources. Besides that support O=/path/to/build/dir option.

Cross-compilation working like a charm now!

Both patches,

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!
