From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: rockchip: Improve a size determination in rockchip_pinctrl_probe()
Date: Tue, 2 Jan 2018 09:47:20 +0100
Message-ID: <CACRpkdYEe_OTTeiUqzt2gJB+-_j7=3Z15y_e+fzB3ZM9BspKXA@mail.gmail.com>
References: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net> <e0bceb4a-bd46-5032-2ac9-d51aa46440a5@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36502 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751034AbeABIrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:47:21 -0500
Received: by mail-io0-f195.google.com with SMTP id i143so28165733ioa.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:47:20 -0800 (PST)
In-Reply-To: <e0bceb4a-bd46-5032-2ac9-d51aa46440a5@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Dec 23, 2017 at 10:40 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 23 Dec 2017 22:07:30 +0100
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
