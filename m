From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: r8a779[14]: Implement voltage
 switching for SDHI
Date: Mon, 12 Sep 2016 14:52:42 +0200
Message-ID: <CACRpkdZHxN8yehyD6YX4V3ukWkxWwKu4T89BKV0FYKiqG+=BiQ@mail.gmail.com>
References: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37807 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758105AbcILMwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 08:52:43 -0400
Received: by mail-it0-f48.google.com with SMTP id 186so9944923itf.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Sep 2016 05:52:43 -0700 (PDT)
In-Reply-To: <1473334608-24638-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

On Thu, Sep 8, 2016 at 1:36 PM, Simon Horman <horms+renesas@verge.net.au> wrote:

> this series adds voltage switching for SDHI to sh-pfc for the r8a7791 and
> r8a794 SoCs. It is based on work for the r8a7790 SoC by Wolfram Sang.
>
> The r8a7793 should be able to be trivially supported using the
> same mechanism as r8a7791. I intend to provide a follow-up patch
> once testing is completed.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect these to be merged by Geert who send the patches to me.

Yours,
Linus Walleij
