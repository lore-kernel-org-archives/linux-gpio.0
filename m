From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/8] gpio: zynq: Add support for suspend resume
Date: Mon, 14 Aug 2017 15:44:18 +0200
Message-ID: <CACRpkda-J_LOrRVtAGDcdzsyV50ScokFoNmkXxFyZnnCzS+W8A@mail.gmail.com>
References: <cover.1502103715.git.michal.simek@xilinx.com> <7a7b593881f94318d3d9e318b183f05adeadf449.1502103715.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33813 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751082AbdHNNoT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2017 09:44:19 -0400
Received: by mail-oi0-f45.google.com with SMTP id x3so84207831oia.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2017 06:44:19 -0700 (PDT)
In-Reply-To: <7a7b593881f94318d3d9e318b183f05adeadf449.1502103715.git.michal.simek@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Aug 7, 2017 at 1:01 PM, Michal Simek <michal.simek@xilinx.com> wrote:

> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add support for suspend resume. Now that we can lose context across
> a suspend/ resume cycle. Add support for the context restore.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied.

Yours,
Linus Walleij
