From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] ACPI / gpio: add missing fwnode_handle_put() in acpi_gpiochip_scan_gpios()
Date: Mon, 31 Oct 2016 09:20:32 +0100
Message-ID: <CACRpkdYgtyW=BQpowEhmBPDS=7YVPyNJ8EAMFjwErjs-J1fOnQ@mail.gmail.com>
References: <1477757517-26498-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:34451 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762083AbcJaIUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2016 04:20:34 -0400
Received: by mail-qk0-f173.google.com with SMTP id q130so33503181qke.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2016 01:20:33 -0700 (PDT)
In-Reply-To: <1477757517-26498-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 29, 2016 at 6:11 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> fwnode_handle_put() should be used when terminating
> device_for_each_child_node() iteration with break or
> return to prevent stale device node references from
> being left behind.
>
> This is detected by Coccinelle semantic patch.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

OK patch applied.

Yours,
Linus Walleij
