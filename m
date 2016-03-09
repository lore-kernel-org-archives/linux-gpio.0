From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/8] drivers/pinctrl: sunxi/pinctrl-sunxi.c does not need module.h
Date: Wed, 9 Mar 2016 09:59:48 +0700
Message-ID: <CACRpkdZ0_qmkyfBOBwXFL-HV+PvQxz-Emv0qiMv7EaEJaR1BkQ@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-2-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36567 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766AbcCIC7t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 21:59:49 -0500
Received: by mail-oi0-f42.google.com with SMTP id r187so25843013oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 18:59:49 -0800 (PST)
In-Reply-To: <1456778924-20730-2-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Mar 1, 2016 at 3:48 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> This file is not modular, nor is it using modular functions. The
> only thing close is the global THIS_MODULE which comes from export.h
> so lets replace it appropriately and cut back on the amount of
> header stuff we draw in by several thousand lines.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
