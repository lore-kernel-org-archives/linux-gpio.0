From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [3/5] pinctrl: core: Add generic pinctrl functions for managing
 groups
Date: Mon, 2 Jan 2017 17:21:03 +0100
Message-ID: <20170102162103.xp5ekyyc6dwpeh4j@t450s.lan>
References: <20161227172003.6517-4-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35402 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756203AbdABQVP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jan 2017 11:21:15 -0500
Received: by mail-wm0-f46.google.com with SMTP id a197so368345702wmd.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jan 2017 08:21:15 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161227172003.6517-4-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Nishanth Menon <nm@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org

Hi Tony,

On Tue, Dec 27, 2016 at 09:20:01AM -0800, Tony Lindgren wrote:
> We can add generic helpers for function handling for cases where the pin
> controller driver does not need to use static arrays.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Shouldn't the patch title be:
pinctrl: core: Add generic pinmux functions for managing functions

It looks like a copy/paste issue since both patches have the same title:
824bef17d16c pinctrl: core: Add generic pinctrl functions for managing
groups
d70a0fb14682 pinctrl: core: Add generic pinctrl functions for managing
groups

That's actually my only remark, I had another comment about freeing the
trees but it is actually done in the unregister so everything is good.

Regards,
Gary
