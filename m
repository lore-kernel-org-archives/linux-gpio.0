From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 0/5] pinctrl: imx: add generic pin config and imx7ulp support
Date: Tue, 23 May 2017 09:41:15 +0200
Message-ID: <CACRpkdY2--+JCaPA0zBGrF66DwgOPd6m4=QvCgkO50x35TCzzw@mail.gmail.com>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:33407 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935928AbdEWHlR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 03:41:17 -0400
Received: by mail-io0-f171.google.com with SMTP id p24so92156672ioi.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 00:41:16 -0700 (PDT)
In-Reply-To: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Bai Ping <ping.bai@nxp.com>, fugang.duan@nxp.com, Sascha Hauer <kernel@pengutronix.de>

On Fri, May 19, 2017 at 9:05 AM, Dong Aisheng <aisheng.dong@nxp.com> wrote:

> This patch series intends to add the generic pin config support for imx
> platforms.

I applied patches 1,2,3 as you've seen, so please rebase on my "devel"
branch in pin control and only resend the things we are still discussing.

I see there are some other patches flying for imx pin control and GPIO,
if the patches are dependent on each other consider putting it all into
one series. If they are not dependent, then don't.

Yours,
Linus Walleij
