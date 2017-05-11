From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/9] pinctrl: Use seq_putc() in three functions
Date: Thu, 11 May 2017 13:34:33 +0200
Message-ID: <CACRpkdaj0oGg=fMxHwdxgU3vNy50Xy8_XQC=kfpedwbKWyozXA@mail.gmail.com>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <6b51c0df-b48e-c49c-b7ae-ee0c8edfb581@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37984 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754327AbdEKLef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 07:34:35 -0400
Received: by mail-it0-f51.google.com with SMTP id e65so17827752ita.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 04:34:35 -0700 (PDT)
In-Reply-To: <6b51c0df-b48e-c49c-b7ae-ee0c8edfb581@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:21 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 May 2017 22:24:29 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks reasonable. Patch applied.

Yours,
Linus Walleij
