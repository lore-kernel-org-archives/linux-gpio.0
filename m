From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: Added zynq specific check for special pins on
 bank zero
Date: Fri, 23 Sep 2016 15:27:10 +0200
Message-ID: <CACRpkdZOMo+8bmrXg3Tn7qDFqs-MbdU2ztYDZQGhaVuuG1cvVA@mail.gmail.com>
References: <1474630018-9986-1-git-send-email-navam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33164 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751710AbcIWN1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 09:27:12 -0400
Received: by mail-oi0-f51.google.com with SMTP id r126so133935435oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 06:27:11 -0700 (PDT)
In-Reply-To: <1474630018-9986-1-git-send-email-navam@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nava kishore Manne <navam@xilinx.com>

On Fri, Sep 23, 2016 at 1:26 PM, Nava kishore Manne
<nava.manne@xilinx.com> wrote:

> From: Nava kishore Manne <nava.manne@xilinx.com>
>
> This patch adds zynq specific check for bank 0 pins 7 and 8
> are special and cannot be used as inputs
>
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> Reported-by: Jonas Karlsson <Jonas.d.karlsson@gmail.com>
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes for v3:
>                 -Fixed some minor comments.

Patch applied.

Yours,
Linus Walleij
