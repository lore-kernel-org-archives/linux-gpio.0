From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] pinctrl: nomadik: make abx500 explicitly non-modular
Date: Sat, 27 Aug 2016 13:13:08 +0200
Message-ID: <CACRpkdb6m1w3szy5v=CjAbH=XSvkEmLPghq4geuSE9zs13Y9AQ@mail.gmail.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com> <20160823211944.18554-3-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36085 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750746AbcH0LNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Aug 2016 07:13:09 -0400
Received: by mail-oi0-f44.google.com with SMTP id f189so142347576oig.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Aug 2016 04:13:09 -0700 (PDT)
In-Reply-To: <20160823211944.18554-3-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alessandro Rubini <rubini@unipv.it>, Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 23, 2016 at 11:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
>  config PINCTRL_ABX500
>        bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Note that MODULE_ALIAS is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
