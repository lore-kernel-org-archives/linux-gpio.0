From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: pc104: Mask PC/104 drivers via PC104 Kconfig option
Date: Tue, 14 Mar 2017 16:25:54 +0100
Message-ID: <CACRpkdYEd3fKvU1G4N8Qbs_DFXyanKnOzxcy26aZe1kA74ZtJg@mail.gmail.com>
References: <cover.1484073324.git.vilhelm.gray@gmail.com> <d45bf9e0428c7885e37f157f9fe222f82594b87c.1484073325.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:37296 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753184AbdCNP0B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 11:26:01 -0400
Received: by mail-it0-f54.google.com with SMTP id g138so1635131itb.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 08:26:00 -0700 (PDT)
In-Reply-To: <d45bf9e0428c7885e37f157f9fe222f82594b87c.1484073325.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jan 10, 2017 at 7:51 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> PC/104 drivers should be hidden on machines which do not support PC/104
> devices. This patch adds the PC104 Kconfig option as a dependency for
> the relevant PC/104 device driver Kconfig options.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
