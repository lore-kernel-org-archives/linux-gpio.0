From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: ingenic: remove redundant dev_err call in ingenic_pinctrl_probe()
Date: Thu, 18 Jan 2018 08:52:03 +0100
Message-ID: <CACRpkdZ4AmJg98ccqS5S8CnVsBFgaWkwY_03pyCYpGwgo4=W6g@mail.gmail.com>
References: <1516188557-147454-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:34357 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753529AbeARHwE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jan 2018 02:52:04 -0500
Received: by mail-it0-f48.google.com with SMTP id m11so1091431iti.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2018 23:52:04 -0800 (PST)
In-Reply-To: <1516188557-147454-1-git-send-email-weiyongjun1@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 17, 2018 at 12:29 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
