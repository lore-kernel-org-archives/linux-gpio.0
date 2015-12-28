From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: fix warning about iterator
Date: Mon, 28 Dec 2015 01:35:17 +0100
Message-ID: <CACRpkdaV0HL1v0z6NTLsuBKEu+bSxKCu=nHoNX=d39oWmchL+A@mail.gmail.com>
References: <CACRpkdZA7m=YzjVmQwzoKNzMu+QiOeA9s3Wu_axZYMw=5j-LnQ@mail.gmail.com>
	<1451223410-8985-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34033 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751280AbbL1AfS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 19:35:18 -0500
Received: by mail-ob0-f169.google.com with SMTP id iw8so223373921obc.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2015 16:35:18 -0800 (PST)
In-Reply-To: <1451223410-8985-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 27, 2015 at 2:36 PM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:

> We were getting build warning about "iterator" being used uninitialized.
> Use iterator properly to fix the build warning and in the process remove
> the variable "pos" which is not required now.
>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
>
> v1: at the end of the loop iterator will point to head and we are trying
> to check its field.

OK took the v1 out and applied this version instead.

Yours,
Linus Walleij
