From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: imx7d: make of_device_ids const.
Date: Thu, 29 Jun 2017 14:56:57 +0200
Message-ID: <CACRpkdbmyvaJ9b-Wxx_-_8Sb0ZA15B8p1y03N_d2He18h3nHJQ@mail.gmail.com>
References: <d854989da39127f5008ad7332eae63a01631dab6.1498564430.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:36261 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752536AbdF2M47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 08:56:59 -0400
Received: by mail-it0-f49.google.com with SMTP id m68so45077286ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 05:56:59 -0700 (PDT)
In-Reply-To: <d854989da39127f5008ad7332eae63a01631dab6.1498564430.git.arvind.yadav.cs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 27, 2017 at 1:55 PM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> of_device_ids are not supposed to change at runtime. All functions
> working with of_device_ids provided by <linux/of.h> work with const
> of_device_ids. So mark the non-const structs as const.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Patch applied.

Yours,
Linus Walleij
