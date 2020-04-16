Return-Path: <SRS0=B0Ck=6A=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E466CC2BB55
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Apr 2020 14:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A9A21927
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Apr 2020 14:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHSW14O7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898886AbgDPN76 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 16 Apr 2020 09:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2409173AbgDPN7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 09:59:48 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD80C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:59:47 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 198so5664109lfo.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1q5iyLlgNj9M9GuhPuzbEbk8Ucjm1YG68RtJQG1D5po=;
        b=xHSW14O7tFpGF5JL6qiZ+p2bG33urCfLnaN7tKyoMFa114XzVomjkby8Ov9s3hh/c+
         ojjgEcUEGsO+33ErIkKBhqFSonEI4Y1/h3A78DkcVVYO3rS9Ofc8TjGzyY1yn58Imfpd
         /D1ziD6R7x+QAYCxRjd/eirrQchp0C+vqpOXgw94JKwNDCPlaz1+K0+168nc+Y1o3IBm
         6s8BqsdUdfK1+VLF+/pse3PLGkzMZTqNPU80KvTLa+Nj6MQkJ/pmC0t2lDKuX62sbpCi
         0dpByTzJzgjYrxF8vnbqg3QF9rum+NiDiUce9KoZWkGXoMU/UI1+Ya+Uu1EBT+dHJyLn
         z0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1q5iyLlgNj9M9GuhPuzbEbk8Ucjm1YG68RtJQG1D5po=;
        b=N8pfDcUE7lAnPO0TZzX2wgEhPS76GhsP7/c1St1eKQXlf3vhMePdkWZpYvcrqM20Ve
         EZhWcmo+Bqoz+WpQD+FtUGXp90RY6giTTTOPiVq6+3xTejiUjngNRwcSV2TXiZyqHs8i
         AXaWvDBCfXs4VbhOOMNB1FgwMlnMj8RkiKvNJHdmEGRfjBcvz/u3c/gaVsGIfI+hRgD0
         uluVKhKjPdWo+ZLeSH74Z692xIy+A1yMCAocVY+kT3sS1imS6YFXc4QaFbob6RdCrdCS
         t+9ssTkEk6qaH/O+pECG4J0I/0bmcWL2PFzd0It/93nxEqotx1BRSkdDQPjFw9ZgkYK8
         Tzkw==
X-Gm-Message-State: AGi0PuZ3nzQQ4IDnxeYMn/ixxAI7uZETxq6efxDtoOlJw2EQOzPpFE9g
        mniFIDUADoCievhbmT7G6T5FKDkkQUhQv5bzSRo7AA==
X-Google-Smtp-Source: APiQypIw7OqNd10YcS66AdS2GgB+hwghyrGEcWOkqEgJ0/XyHLwaw9wk7C+7hwx3lSrZlO9sUlyngnorQoAU/E5Sd1E=
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr5803057lfp.4.1587045586242;
 Thu, 16 Apr 2020 06:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
 <20200415171516.cugbzhvjua6cygnq@mobilestation> <20200416105614.GZ185537@smile.fi.intel.com>
 <20200416110613.4yyrlcle4oiy46a7@mobilestation> <CACRpkdacW7_Q7YW1WOazLaP_HKBbNKev3caJyKSNMBbXp7j1Zw@mail.gmail.com>
 <20200416133737.lvve4svqak6tbgwn@mobilestation>
In-Reply-To: <20200416133737.lvve4svqak6tbgwn@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 15:59:34 +0200
Message-ID: <CACRpkdbgtskGyQvUy9Eb--f8YahO9gw9jgDx0k1AkK=LkkuQJg@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 3:37 PM Serge Semin <fancer.lancer@gmail.com> wrote:

> caused the 80 chars line rule violation in some cases.

As subsystem maintainer that's a coding style thing I don't
really care much about, I personally violate it all the time.
But you can have it any way you want of course :)

Yours,
Linus Walleij
