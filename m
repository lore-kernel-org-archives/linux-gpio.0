From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/17] gpio: remove unnecessary OOM messages
Date: Fri, 9 May 2014 10:56:45 +0200
Message-ID: <CACRpkda+UfzipwUWy3_PD6kSaPKUJGDjkG81LBfhET6FM3z-rQ@mail.gmail.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:41236 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752187AbaEII4q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 04:56:46 -0400
Received: by mail-ob0-f169.google.com with SMTP id vb8so4443158obc.14
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 01:56:46 -0700 (PDT)
In-Reply-To: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 29, 2014 at 10:29 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message. For example,
> k.alloc and v.alloc failures use dump_stack().

All 17 patches applied, thanks!

Yours,
Linus Walleij
