From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Fix unused-const-variable warnings
Date: Tue, 11 Apr 2017 09:48:11 +0200
Message-ID: <CACRpkdb2qm_uL-xRdjnft68QwF7xxnO8NmzUwxQYME_Uc5QH1A@mail.gmail.com>
References: <20170407125817.15834-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34033 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753708AbdDKHsN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2017 03:48:13 -0400
Received: by mail-io0-f169.google.com with SMTP id a103so61207147ioj.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2017 00:48:13 -0700 (PDT)
In-Reply-To: <20170407125817.15834-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Fri, Apr 7, 2017 at 2:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Three video input signals suffered from a search/replace failure in
> some copied code.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
