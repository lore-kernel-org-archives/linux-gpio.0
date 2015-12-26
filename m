From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix warning about iterator
Date: Sat, 26 Dec 2015 22:31:15 +0100
Message-ID: <CACRpkdZA7m=YzjVmQwzoKNzMu+QiOeA9s3Wu_axZYMw=5j-LnQ@mail.gmail.com>
References: <1451116719-19158-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35729 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbbLZVbQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Dec 2015 16:31:16 -0500
Received: by mail-oi0-f45.google.com with SMTP id l9so130879512oia.2
        for <linux-gpio@vger.kernel.org>; Sat, 26 Dec 2015 13:31:16 -0800 (PST)
In-Reply-To: <1451116719-19158-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Ross Zwisler <ross.zwisler@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 26, 2015 at 8:58 AM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:

> We were getting build warning about "iterator" being used uninitialized.
> Use iterator properly to fix the build warning and in the process remove
> the variable "pos" which is not required now.
>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>

Aha there is a real patch solving the problem. Sorry Ross,
had to drop your patch and replace it with this.

Patch applied!

Yours,
Linus Walleij
