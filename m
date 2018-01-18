From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: omap: Fix error path on chip init
Date: Thu, 18 Jan 2018 14:07:42 +1100
Message-ID: <20180118030742.GD3286@localhost>
References: <20180102102314.12906-1-linus.walleij@linaro.org>
 <7804f4c8-c9c3-ccd7-83b3-88b83fa6c518@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:43139 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752403AbeARDI1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jan 2018 22:08:27 -0500
Received: by mail-pf0-f194.google.com with SMTP id y26so5596356pfi.10
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2018 19:08:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <7804f4c8-c9c3-ccd7-83b3-88b83fa6c518@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>

On Fri, Jan 12, 2018 at 03:13:44PM -0600, Grygorii Strashko wrote:
> 
> 
> On 01/02/2018 04:23 AM, Linus Walleij wrote:
> > The error path was leaking a gpio_chip at one point.
> > 
> > Cc: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> 
> Sry, but this seems not in sync with gpio-next [1]
> 
> https://patchwork.kernel.org/patch/10060049/

Indeed. That patch inadvertently fixed the broken error path.

Thanks,
Johan
