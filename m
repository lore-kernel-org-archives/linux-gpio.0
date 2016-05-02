From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: at91: Merge clk_prepare and clk_enable into clk_prepare_enable
Date: Mon, 2 May 2016 13:53:31 +0200
Message-ID: <CACRpkdYcbVtCkrhmC0Wu8-_miGdi1y+Ja8kcHnY1a7GKPiHSeg@mail.gmail.com>
References: <1461934203-3206-1-git-send-email-alexanders83@web.de>
	<1461934203-3206-2-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34627 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544AbcEBLxc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 07:53:32 -0400
Received: by mail-ob0-f179.google.com with SMTP id dm5so19193456obc.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 04:53:31 -0700 (PDT)
In-Reply-To: <1461934203-3206-2-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 29, 2016 at 2:50 PM, Alexander Stein <alexanders83@web.de> wrote:

> This simplifies the normal as well as the error path.
>
> Signed-off-by: Alexander Stein <alexanders83@web.de>

Patch applied.

Yours,
Linus Walleij
