From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Added zynq specific check for special pins on bank zero
Date: Fri, 23 Sep 2016 11:22:26 +0200
Message-ID: <CACRpkdb1R9TiVet3-9z5KhOugQmqvq-uS9j5aDApoa44284L4A@mail.gmail.com>
References: <1474360324-8168-1-git-send-email-navam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36103 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934340AbcIWJW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 05:22:28 -0400
Received: by mail-oi0-f44.google.com with SMTP id t83so127776736oie.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 02:22:27 -0700 (PDT)
In-Reply-To: <1474360324-8168-1-git-send-email-navam@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nava kishore Manne <navam@xilinx.com>

On Tue, Sep 20, 2016 at 10:32 AM, Nava kishore Manne
<nava.manne@xilinx.com> wrote:

> From: Nava kishore Manne <nava.manne@xilinx.com>
>
> This patch adds zynq specific check for bank 0 pins 7 and 8
> are special and cannot be used as inputs
>
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>

I'm waiting for a revised version of this patch with comments adressed
and ACKs added.

Yours,
Linus Walleij
