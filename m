From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: rockchip: Delete error messages for a failed
 memory allocation in two functions
Date: Tue, 2 Jan 2018 09:46:22 +0100
Message-ID: <CACRpkdan-McvJ+N++GwZyP0B8ove67CebG1XN72CdYhiexxW0g@mail.gmail.com>
References: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net> <7a067193-e0c3-c2b9-b85a-e05c8ff8860e@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:46988 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751821AbeABIqX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:46:23 -0500
Received: by mail-it0-f65.google.com with SMTP id c16so13924811itc.5
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:46:23 -0800 (PST)
In-Reply-To: <7a067193-e0c3-c2b9-b85a-e05c8ff8860e@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Dec 23, 2017 at 10:38 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 23 Dec 2017 22:02:47 +0100
>
> Omit extra messages for a memory allocation failure in these functions.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
