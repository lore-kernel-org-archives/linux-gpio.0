From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] pinctrl: sirf: move to use irq_get_handler_data
Date: Wed, 23 Apr 2014 22:17:16 +0200
Message-ID: <CACRpkdbDeF5gBVv=hQSdX1i9fw=7Or+=qN=g4OXHvHkZKr7vcQ@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-5-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:37308 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932248AbaDWURQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 16:17:16 -0400
Received: by mail-ob0-f175.google.com with SMTP id wp4so1619051obc.6
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 13:17:16 -0700 (PDT)
In-Reply-To: <1397544229-20545-5-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Barry Song <Baohua.Song@csr.com>
>
> we set bank as handler_data, now we can get bank in ISR directly
> instead of looking-up.
>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

If you want to use some other handler data than the gpiochip,
you should just use irq_set_chained_handler() and
irq_set_handler_data() directly.

Yours,
Linus Walleij
