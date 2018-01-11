From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: thunderx: fix error return code in thunderx_gpio_probe()
Date: Thu, 11 Jan 2018 10:50:15 +0100
Message-ID: <CACRpkdbACSBoj8HzTFw1z8WiMSeerSe6mkBxyk0KYOTrtTXEtQ@mail.gmail.com>
References: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:34779 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754677AbeAKJuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 04:50:16 -0500
Received: by mail-qk0-f193.google.com with SMTP id b76so3542098qkc.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2018 01:50:16 -0800 (PST)
In-Reply-To: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Daney <david.daney@cavium.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 3:37 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 5a2a30024d8c ("gpio: Add gpio driver support for ThunderX and OCTEON-TX")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with David's ACK.

Yours,
Linus Walleij
