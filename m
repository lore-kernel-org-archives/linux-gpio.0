From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: mvebu: guard sub-directory with CONFIG_PINCTRL_MVEBU
Date: Tue, 1 Dec 2015 10:41:31 +0100
Message-ID: <CACRpkdbhirz6LaKoyH5VcYh2BpLoQk7GeMCuH69BDmjCEj0gtg@mail.gmail.com>
References: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
	<1448365524-12605-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35048 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754902AbbLAJlc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 04:41:32 -0500
Received: by obbnk6 with SMTP id nk6so357053obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 01:41:31 -0800 (PST)
In-Reply-To: <1448365524-12605-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 24, 2015 at 12:45 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_MVEBU is more suitable than CONFIG_PLAT_ORION
> to guard the drivers/pinctrl/mvebu/ directory.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
