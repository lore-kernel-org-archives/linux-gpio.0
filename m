From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: palmas: Delete an error message for a failed
 memory allocation in palmas_pinctrl_probe()
Date: Tue, 2 Jan 2018 09:45:10 +0100
Message-ID: <CACRpkdZ1pns0OLatudq3vMP-Xe+HB34_1ZM+qc4y+-QjK_0E3A@mail.gmail.com>
References: <acda9837-523a-2f49-f7ba-b5e60eb8371e@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:46888 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751498AbeABIpL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:45:11 -0500
Received: by mail-it0-f66.google.com with SMTP id c16so13922285itc.5
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:45:10 -0800 (PST)
In-Reply-To: <acda9837-523a-2f49-f7ba-b5e60eb8371e@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Dec 23, 2017 at 9:30 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 23 Dec 2017 21:16:42 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
