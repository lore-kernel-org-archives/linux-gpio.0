From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 00/17] gpio: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 11:21:56 +0200
Message-ID: <CABxcv=mPyOE2uYC_F83Uvb=b6oH-B=j3aBFCAaV+1bXUjMnXeA@mail.gmail.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:43645 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756563AbaD2JV6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 05:21:58 -0400
Received: by mail-wg0-f46.google.com with SMTP id a1so2063451wgh.29
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2014 02:21:56 -0700 (PDT)
In-Reply-To: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>

On Tue, Apr 29, 2014 at 10:29 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message. For example,
> k.alloc and v.alloc failures use dump_stack().
>

Not necessary indeed since besides the dump_stack(), a more complete
message is printed by warn_alloc_failed() in mm/page_alloc.c.

For the complete series:

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
