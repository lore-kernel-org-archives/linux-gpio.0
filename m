From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: vt8500: Delete an error message for a failed
 memory allocation in five functions
Date: Tue, 2 Jan 2018 10:11:13 +0100
Message-ID: <CACRpkdZgxJynjdhgiDxgTZMb7Z_b+ipQZSnCyJ5_aSWtGKnUdw@mail.gmail.com>
References: <62a3836f-cd3c-2a56-232a-db401b1f88ca@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:43374 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751355AbeABJLO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 04:11:14 -0500
Received: by mail-io0-f196.google.com with SMTP id w188so3904261iod.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 01:11:14 -0800 (PST)
In-Reply-To: <62a3836f-cd3c-2a56-232a-db401b1f88ca@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>, Stephen Warren <swarren@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Dec 28, 2017 at 4:20 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 28 Dec 2017 16:12:17 +0100
>
> Omit an extra message for a memory allocation failure in these functions.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
