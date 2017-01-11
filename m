From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/6] pinctrl: intel: Convert to use devm_gpiochip_add_data()
Date: Wed, 11 Jan 2017 13:53:03 +0100
Message-ID: <CACRpkdbwGUiYdE6vc5KqdkcpkE5pQpbnc3wBWJqZPjp6Tu7HuQ@mail.gmail.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com> <20170110143201.53539-3-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:35366 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966154AbdAKMxE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 07:53:04 -0500
Received: by mail-qk0-f179.google.com with SMTP id u25so591132448qki.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 04:53:04 -0800 (PST)
In-Reply-To: <20170110143201.53539-3-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 10, 2017 at 3:31 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> This simplifies error handling and allows us to drop intel_pinctrl_remove()
> completely.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied for next.

Yours,
Linus Walleij
