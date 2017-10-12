From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-dwapb: add optional reset
Date: Thu, 12 Oct 2017 10:26:47 +0200
Message-ID: <CACRpkdZ1P6zu_+=Omne0=kbDYkhSn-GixNVUWAxCC3L7zDXaew@mail.gmail.com>
References: <20171011163444.2989-1-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:54614 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752006AbdJLI0t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2017 04:26:49 -0400
Received: by mail-it0-f54.google.com with SMTP id 72so5944851itk.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2017 01:26:48 -0700 (PDT)
In-Reply-To: <20171011163444.2989-1-atull@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Tull <atull@kernel.org>
Cc: Hoan Tran <hotran@apm.com>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Oct 11, 2017 at 6:34 PM, Alan Tull <atull@kernel.org> wrote:

> Some platforms require reset to be released to allow register
> access.
>
> Signed-off-by: Alan Tull <atull@kernel.org>
> ---
> v2: Request shared controller
>     return all errors from reset controller request
>     drop conditions on asserting/deasserting reset

This v2 version applied with Philipp's review tag, I also added
a blurb to the DT binding as Philipp asked so no need to fix that
separately.

Yours,
Linus Walleij
