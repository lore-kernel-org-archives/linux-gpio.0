From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Tue, 31 Jan 2017 15:50:03 +0100
Message-ID: <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
References: <20170127042442.28994-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:38642 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbdAaOuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 09:50:05 -0500
Received: by mail-it0-f53.google.com with SMTP id c7so126594594itd.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2017 06:50:04 -0800 (PST)
In-Reply-To: <20170127042442.28994-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Fri, Jan 27, 2017 at 5:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> This is less straight-forward than one would hope, as some banks only
> have 4 pins rather than 8, others are output only, yet more (W and
> X, already supported) are input-only, and in the case of the g4 SoC bank
> AC doesn't exist.
>
> Add some structs to describe the varying properties of different banks
> and integrate mechanisms to deny requests for unsupported
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> Since v2:

Patch applied with some patch -p1 < fuzz
please check the result.

Yours,
Linus Walleij
