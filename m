From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: export add/remove lookup table functions
Date: Mon, 22 May 2017 10:58:52 +0200
Message-ID: <CACRpkdYukfjM84dGgM6C18gTxy+xE3imHeD3SZxqw8rP_SkRfA@mail.gmail.com>
References: <1492723400-16657-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:32972 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752556AbdEVI6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 04:58:54 -0400
Received: by mail-io0-f179.google.com with SMTP id p24so77132573ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 01:58:53 -0700 (PDT)
In-Reply-To: <1492723400-16657-1-git-send-email-agust@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Apr 20, 2017 at 11:23 PM, Anatolij Gustschin <agust@denx.de> wrote:

> For hot-pluggable devices adding GPIOs dynamically we need to
> assemble and add the gpio lookup tables at probe time in modules,
> so that requesting these GPIOs in attached drivers can work.
> Export lookup table functions for modules.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Patch applied with Andy's Review tag, sorry for missing it,
it was indeed sent to me I just randomly forgot the patch.

Yours,
Linus Walleij
