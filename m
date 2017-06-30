From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: fix incorrect failure check on platform_get_resources
Date: Fri, 30 Jun 2017 15:50:33 +0200
Message-ID: <CACRpkdbbk74DhCeQ2h=3-innkRCAqk_x-iqhVUc0YgM7G=YuNg@mail.gmail.com>
References: <20170630103355.9769-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36850 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752076AbdF3Nue (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2017 09:50:34 -0400
Received: by mail-it0-f51.google.com with SMTP id m68so61336534ith.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2017 06:50:34 -0700 (PDT)
In-Reply-To: <20170630103355.9769-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 12:33 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The return res from platform_get_resources should be checked for
> a failure rather than ret.  Fixes warning:
>
> 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Geert already sent the right fix for this.

Yours,
Linus Walleij
