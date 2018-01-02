From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: single: Delete an error message for a failed
 memory allocation in pcs_probe()
Date: Tue, 2 Jan 2018 09:49:38 +0100
Message-ID: <CACRpkdYEnJv2SsR_+Jt=Rp364VgRukjDJ=gBC55X5zOSvu92xw@mail.gmail.com>
References: <6bc679d1-c1ee-52fe-9ece-b28095f653ec@users.sourceforge.net> <bc8e7af9-6dcb-6f08-388a-31fc1b88cd00@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34785 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751034AbeABItj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:49:39 -0500
Received: by mail-it0-f68.google.com with SMTP id m11so10638718iti.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:49:38 -0800 (PST)
In-Reply-To: <bc8e7af9-6dcb-6f08-388a-31fc1b88cd00@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Tony Lindgren <tony@atomide.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Dec 25, 2017 at 2:06 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 25 Dec 2017 11:27:55 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
