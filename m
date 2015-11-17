From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-tegra: Do not create the debugfs entry by default
Date: Tue, 17 Nov 2015 15:20:07 +0100
Message-ID: <CACRpkdYO93V0+B_NW6bCoxr1wDHkUgcuyi=pFaL0bTy650u8kQ@mail.gmail.com>
References: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35710 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918AbbKQOUH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:20:07 -0500
Received: by oige206 with SMTP id e206so5424651oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 06:20:07 -0800 (PST)
In-Reply-To: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Nov 16, 2015 at 5:07 PM, Suzuki K. Poulose
<suzuki.poulose@arm.com> wrote:

> The tegra gpio driver creates the debugfs entry irrespective of
> whether the device exists or not. This is enabled on an arm64_defconfig
> and leaves an entry in debugfs on all platforms where it is not
> useful. This patch fixes the issue by creating the entry only when
> a device exists.
>
> Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>

Patch applied for fixes with Thierry's ACK.

Yours,
Linus Walleij
