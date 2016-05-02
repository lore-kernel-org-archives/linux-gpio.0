From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: at91: Make at91_gpio_template const
Date: Mon, 2 May 2016 13:52:31 +0200
Message-ID: <CACRpkdbLB3s3AbgB7rexY8GFueAY_ywpKY3krX6tTVrq1X4Wcg@mail.gmail.com>
References: <1461934203-3206-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34976 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544AbcEBLwc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 07:52:32 -0400
Received: by mail-oi0-f49.google.com with SMTP id x19so185722125oix.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 04:52:32 -0700 (PDT)
In-Reply-To: <1461934203-3206-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 29, 2016 at 2:50 PM, Alexander Stein <alexanders83@web.de> wrote:

> This template is only assigned, so make it const.
>
> Signed-off-by: Alexander Stein <alexanders83@web.de>

Patch applied.

Yours,
Linus Walleij
