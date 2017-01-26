From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: aspeed: Make bank names strings
Date: Thu, 26 Jan 2017 14:45:18 +0100
Message-ID: <CACRpkdaPzQ9VRM9_MDCZ5VugTiXBD0F57=LWScsyb=tshsE8QQ@mail.gmail.com>
References: <20170124061646.9317-1-andrew@aj.id.au> <20170124061646.9317-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:36530 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752054AbdAZNpU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 08:45:20 -0500
Received: by mail-io0-f179.google.com with SMTP id j13so36573569iod.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 05:45:19 -0800 (PST)
In-Reply-To: <20170124061646.9317-2-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Tue, Jan 24, 2017 at 7:16 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> From: Joel Stanley <joel@jms.id.au>
>
> The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
> documentation uses two letter names such as AA and AB, so make the names
> a three-character array in the bank struct to accommodate this.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I already applied the v1 of this, I guess it's the same.

Yours,
Linus Walleij
