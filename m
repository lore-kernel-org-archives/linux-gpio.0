From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [gpio:devel 12/12] drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27:
 error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Thu, 19 Oct 2017 15:17:25 +0200
Message-ID: <CACRpkdaw6xzd9c=XBYDTwhUU52FRtMZbogGhi_uv4AK4Ztwx-w@mail.gmail.com>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com> <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
 <20171016080502.GB17369@ulmo> <20171016080821.GC17369@ulmo>
 <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com> <20171016124656.GA6539@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:43480 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdJSNR1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2017 09:17:27 -0400
Received: by mail-io0-f195.google.com with SMTP id 134so9781335ioo.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2017 06:17:26 -0700 (PDT)
In-Reply-To: <20171016124656.GA6539@ulmo>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 16, 2017 at 2:46 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> Something like the below should do. Cc += Gregory.

Thanks for helping fixing this!

Patch applied with Gregory's review tag.

Yours,
Linus Walleij
