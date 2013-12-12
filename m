From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: driver for Xtensa GPIO32
Date: Thu, 12 Dec 2013 14:35:35 +0100
Message-ID: <CACRpkdZr5gvnro50c=MLNMmG1gmX0jXbmvdUqT4Mj8XNXYRhdA@mail.gmail.com>
References: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:50541 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571Ab3LLNfg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2013 08:35:36 -0500
Received: by mail-ob0-f176.google.com with SMTP id vb8so394942obc.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2013 05:35:36 -0800 (PST)
In-Reply-To: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Thu, Dec 12, 2013 at 10:18 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> GPIO32 is a standard optional extension to the Xtensa architecture core that
> provides preconfigured output and input ports for intra SoC signaling. The
> GPIO32 option is implemented as 32bit Tensilica Instruction Extension (TIE)
> output state called EXPSTATE, and 32bit input wire called IMPWIRE. This
> driver treats input and output states as two distinct devices.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3:
>    * Use BUG() in xtensa_impwire_set_value() to indicate that it should never
>      be called (Linus Walleij)

OK no remaining issues with this version, patch applied!

Thanks!
Linus Walleij
