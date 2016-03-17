From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl:Intel: implement gpio_irq_enable
Date: Thu, 17 Mar 2016 15:07:33 +0100
Message-ID: <CACRpkdZjCBNdbXyxv-dGkWah+4zqmFD0X4AeV9GyQK0o-Gv_ew@mail.gmail.com>
References: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
	<1458152126-2333-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36833 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030628AbcCQOHd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 10:07:33 -0400
Received: by mail-ob0-f170.google.com with SMTP id m7so84466773obh.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2016 07:07:33 -0700 (PDT)
In-Reply-To: <1458152126-2333-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Qi Zheng <qi.zheng@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, Mar 16, 2016 at 7:15 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:

> From: Qi Zheng <qi.zheng@intel.com>
>
> There is unexpected gpio interrupt after irq_enable. If not
> implemeted gpio_irq_enable callback, irq_enable calls irq_unmask
> instead. But if there was interrupt set before the irq_enable,
> unmask it may trigger the unexpected interrupt. By implementing
> the gpio_irq_enable callback, do interrupt status ack, the issue
> has gone.
>
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
