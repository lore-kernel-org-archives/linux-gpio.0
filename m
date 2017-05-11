From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/9] pinctrl: Replace two seq_printf() calls by seq_puts()
 in pinconf_show_map()
Date: Thu, 11 May 2017 15:24:17 +0200
Message-ID: <CACRpkda3YE5KzNSjdU-YY5PA3H4-BZLy_KpRmdd4ohsTc_AR_w@mail.gmail.com>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <68dee714-acb7-5c69-7764-3e302a335c38@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36273 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755228AbdEKNYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 09:24:19 -0400
Received: by mail-io0-f172.google.com with SMTP id o12so21106282iod.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 06:24:18 -0700 (PDT)
In-Reply-To: <68dee714-acb7-5c69-7764-3e302a335c38@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:24 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 09:52:50 +0200
>
> Strings which did not contain data format specifications should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
