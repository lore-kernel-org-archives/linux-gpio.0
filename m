From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [gpio:devel 12/12] drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27:
 error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Mon, 16 Oct 2017 13:50:08 +0200
Message-ID: <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com> <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
 <20171016080502.GB17369@ulmo> <20171016080821.GC17369@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:49636 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752383AbdJPLuJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 07:50:09 -0400
Received: by mail-io0-f179.google.com with SMTP id n137so15787168iod.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 04:50:09 -0700 (PDT)
In-Reply-To: <20171016080821.GC17369@ulmo>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 16, 2017 at 10:08 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> Nevermind, I see there is now yet another conflict that would require
> yet another rebase of that series.

Sorry about this :(

It sucks with moving targets, there was some fallout from Grygorii's patch
to map IRQs dynamically and remove irq_base so we need to clean that
up first.

This particular bug from the autobuilder seems to be constrained to the
armada driver though.

Yours,
Linus Walleij
