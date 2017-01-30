From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: broxton: No need to take pointer of a pointer
Date: Mon, 30 Jan 2017 14:45:58 +0100
Message-ID: <CACRpkdaqz26bW-vCacJgN3t45ikFbXeOAemZ3--VmuJ+19a29w@mail.gmail.com>
References: <20170126151038.37977-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:34052 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbdA3NyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 08:54:24 -0500
Received: by mail-io0-f175.google.com with SMTP id l66so107346223ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 05:54:23 -0800 (PST)
In-Reply-To: <20170126151038.37977-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 26, 2017 at 4:10 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no need to take pointer of a pointer to an array of SoC data in
> platform driver.
>
> Do it in the same way as it's done for ACPI.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
