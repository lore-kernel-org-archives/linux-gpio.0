From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Clarify quirk and provide helper function
Date: Fri, 9 Jun 2017 15:46:16 +0200
Message-ID: <CACRpkdaZr3iMdeQ+51F6bXa1EVc2jgGyJZhReVF8whn=R=fOog@mail.gmail.com>
References: <20170608173207.30056-1-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:33653 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbdFINqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 09:46:17 -0400
Received: by mail-it0-f50.google.com with SMTP id x129so1617328ite.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 06:46:17 -0700 (PDT)
In-Reply-To: <20170608173207.30056-1-soren.brinkmann@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jun 8, 2017 at 7:32 PM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> The one quirk used in the zynq GPIO driver was called FOO which is not
> very descriptive. Rename the quirk to IS_ZYNQ as it indicates whether
> the HW is a zynq or zynqmp device to allow handling of device-specific
> differences of the HW.
> Also provide a helper function to test whether the HW is zynq or zynqmp.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Patch applied.

Yours,
Linus Walleij
