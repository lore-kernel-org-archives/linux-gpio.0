From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: simplify check for pin request conflicts
Date: Fri, 30 Dec 2016 10:12:05 +0100
Message-ID: <CACRpkdadwC4RAKGpifwWQtw=_cJFatuotf2Oth6f=dhVMPet3g@mail.gmail.com>
References: <20161225005928.4417-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:34299 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752210AbcL3JMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 04:12:06 -0500
Received: by mail-qt0-f169.google.com with SMTP id d45so168743872qta.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 01:12:06 -0800 (PST)
In-Reply-To: <20161225005928.4417-1-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Sonic Zhang <sonic.zhang@analog.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 25, 2016 at 1:59 AM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> This is a non-functional change, which deletes code duplication in two
> of four if-if branches by reordering the checks. Functional identity
> of the code change can be shown by running through the whole truth table
> of boolean arguments.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied.

Yours,
Linus Walleij
