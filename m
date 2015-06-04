From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix the pointer in PTR_ERR()
Date: Thu, 4 Jun 2015 10:15:07 +0200
Message-ID: <CACRpkdZmB9Bt+UM=1YshRnONi+QiFgYy5ZX7WQaT_z0fDr73xA@mail.gmail.com>
References: <1433163424-6123-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35559 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753241AbbFDIPI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2015 04:15:08 -0400
Received: by oihd6 with SMTP id d6so26068949oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2015 01:15:08 -0700 (PDT)
In-Reply-To: <1433163424-6123-1-git-send-email-fabio.estevam@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <fabio.estevam@freescale.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 1, 2015 at 2:57 PM, Fabio Estevam
<fabio.estevam@freescale.com> wrote:

> PTR_ERR should access the value just tested by IS_ERR
>
> The semantic patch that makes this change is available
> in scripts/coccinelle/tests/odd_ptr_err.cocci.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Oviously correct, patch applied.

Yours,
Linus Walleij
