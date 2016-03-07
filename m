From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: moxart: Allow compile test build
Date: Mon, 7 Mar 2016 11:39:05 +0700
Message-ID: <CACRpkdaYxfJkiUt3sJhOBmEZB5GWWz+kpgvPy3JsGsLDuoFSKQ@mail.gmail.com>
References: <1456473597.24027.0.camel@ingics.com>
	<1456473650.24027.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33916 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbcCGEjG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 23:39:06 -0500
Received: by mail-ob0-f180.google.com with SMTP id ts10so96007520obc.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 20:39:06 -0800 (PST)
In-Reply-To: <1456473650.24027.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 3:00 PM, Axel Lin <axel.lin@ingics.com> wrote:

> There is no build dependency for this driver, so enable COMPILE_TEST to get
> better build coverage.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
