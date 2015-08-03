From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Mon, 3 Aug 2015 10:21:23 +0200
Message-ID: <CACRpkdYvqmJJV3-H+gSDNwj+zp7Caqb-_nLihq7CzcjrF3eL1g@mail.gmail.com>
References: <1435545357-4494-1-git-send-email-jun.nie@linaro.org>
	<1435545357-4494-2-git-send-email-jun.nie@linaro.org>
	<CACRpkdatFhHezJ9csU6WrOq88ekf+zNY_5xcLRi3KNZF_w+N+w@mail.gmail.com>
	<CABymUCPc_EA57fRDdVH7z5tRXQiPHRiczs_MKXBeq0pVCctceg@mail.gmail.com>
	<CACRpkdZToXL11wFKuDEWqVd8XKHzX8bfZWFUS2z+CTk4s-w9Rg@mail.gmail.com>
	<CABymUCOaHCjwpETawf==AvY-ZBjh=mbpURHJJJkN7csQ1G83ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:32775 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752569AbbHCIVX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 04:21:23 -0400
Received: by obdeg2 with SMTP id eg2so93720334obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 01:21:23 -0700 (PDT)
In-Reply-To: <CABymUCOaHCjwpETawf==AvY-ZBjh=mbpURHJJJkN7csQ1G83ow@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawn.guo@linaro.org>, "wan.zhijun" <wan.zhijun@zte.com.cn>, Jason Liu <jason.liu@linaro.org>

On Fri, Jul 31, 2015 at 10:42 AM, Jun Nie <jun.nie@linaro.org> wrote:

> We can wrap gpiochip_add into new function gpiochip_add_arg() and feed
> below info to it and assign the value in the common code. It is make
> the function argument list too long. Any better idea? Or you think it
> is OK, then I can draft a patch for review.
>
> gpio_chip members: direction_input, direction_output, get, set,
> request, free, ngpio, label, dev.

Nah I don't see that very different from assigning the vtable
directly in the code, it merely creates a function call to do the
same so don't bother with it.

Yours,
Linus Walleij
