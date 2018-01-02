From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: utils: Delete an error message for a failed
 memory allocation in pinctrl_utils_add_map_configs()
Date: Tue, 2 Jan 2018 09:53:06 +0100
Message-ID: <CACRpkdaoo7vfEybH_2DZup6XyCqaTg4fapOk+=i=NPgN0jfP9Q@mail.gmail.com>
References: <4a1181a6-e37c-3f2b-782c-6dd4279ce39f@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:37004 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751492AbeABIxH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:53:07 -0500
Received: by mail-it0-f67.google.com with SMTP id d137so38743513itc.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:53:07 -0800 (PST)
In-Reply-To: <4a1181a6-e37c-3f2b-782c-6dd4279ce39f@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Dec 25, 2017 at 8:15 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 25 Dec 2017 20:04:05 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
