From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mvebu: add suspend/resume support to Armada XP
 pinctrl driver
Date: Fri, 27 Mar 2015 09:37:19 +0100
Message-ID: <CACRpkdZ_2FJLJJaDuqw=9cxxJwacz06KssfSK_HVg2jZ6E-6eQ@mail.gmail.com>
References: <1426761047-3103-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35957 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753478AbbC0IhT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2015 04:37:19 -0400
Received: by oicf142 with SMTP id f142so61215888oic.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2015 01:37:19 -0700 (PDT)
In-Reply-To: <1426761047-3103-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Mar 19, 2015 at 11:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> This commit adds suspend/resume support to the Armada XP pinctrl
> driver, by simply saving and restoring the MPP registers.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch applied, but:

>  static void __iomem *mpp_base;
> +static u32 *mpp_saved_regs;

I didn't notice this singleton design pattern in this driver before :(
I see the legacy Dove driver have a few more.

Can we have a mvebu refactoring patch bringing these things into a state
container? Like a per-subdriver kmalloc:ed struct foo_state {}?

Yours,
Linus Walleij
