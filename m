From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: Add terminate entry for
 dmi_system_id tables
Date: Fri, 28 Apr 2017 09:36:43 +0200
Message-ID: <CACRpkdYqKCfvCxjO3bOsHohRmLCy=UDLv5M6BvrZTY5dw+oKxQ@mail.gmail.com>
References: <20170425062205.22627-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:35939 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424496AbdD1Hgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 03:36:44 -0400
Received: by mail-it0-f50.google.com with SMTP id g66so31627280ite.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 00:36:44 -0700 (PDT)
In-Reply-To: <20170425062205.22627-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 25, 2017 at 8:22 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Make sure dmi_system_id tables are NULL terminated.
>
> Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer
> Chromebook keyboard work again")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
