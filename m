From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/6] pinctrl: broxton: Use correct PADCFGLOCK offset
Date: Wed, 11 Jan 2017 13:47:41 +0100
Message-ID: <CACRpkdYcKhvC1ouusjbAQh2279HLGExi1r8w=L3yBJz3EH0U+g@mail.gmail.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com> <20170110143201.53539-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:33745 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966155AbdAKMrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 07:47:42 -0500
Received: by mail-qk0-f178.google.com with SMTP id s140so184380090qke.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 04:47:42 -0800 (PST)
In-Reply-To: <20170110143201.53539-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 10, 2017 at 3:31 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> PADCFGLOCK (and PADCFGLOCK_TX) offset in Broxton actually starts at 0x060
> and not 0x090 as used in the driver. Fix it to use the correct offset.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

This patch applied for fixes.

Yours,
Linus Walleij
