From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler
Date: Mon, 30 Jan 2017 15:53:48 +0100
Message-ID: <CACRpkdbNFO2QDd2Pc9ULkUDK6ikFT1V+L-xGfw6z2hAbR7w6rg@mail.gmail.com>
References: <20170130113528.17838-1-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:36152 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751467AbdA3PBu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 10:01:50 -0500
Received: by mail-it0-f49.google.com with SMTP id c7so194842121itd.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 07:01:49 -0800 (PST)
In-Reply-To: <20170130113528.17838-1-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 30, 2017 at 12:35 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> According to VLI64 Intel Atom E3800 Specification Update (#329901)
> concurrent read accesses may result in returning 0xffffffff and write
> accesses may be dropped silently.
> To workaround all accesses must be protected by locks.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied for fixes and tagged for stable with Mika's ACK.

Yours,
Linus Walleij
