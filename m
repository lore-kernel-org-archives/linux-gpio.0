From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: single: Drop pointless macro
Date: Fri, 28 Oct 2016 13:54:29 +0200
Message-ID: <CACRpkdbpoVZ7Ln44tGyZEVP_zp9A9KVn=BZpjr8UuXCRhhMWAw@mail.gmail.com>
References: <20161025160900.2724-1-tony@atomide.com> <20161025160900.2724-3-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:36446 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754887AbcJ1Lya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2016 07:54:30 -0400
Received: by mail-qk0-f171.google.com with SMTP id o68so83070810qkf.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2016 04:54:30 -0700 (PDT)
In-Reply-To: <20161025160900.2724-3-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Nishanth Menon <nm@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>

On Tue, Oct 25, 2016 at 6:09 PM, Tony Lindgren <tony@atomide.com> wrote:

> This is left over from initial experiments with more properties.
> It's only used in one place, so let's just get rid of it to make
> the code more readable.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied.

Yours,
Linus Walleij
