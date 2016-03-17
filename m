From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl:Intel: make the high level interrupt working
Date: Thu, 17 Mar 2016 14:34:55 +0100
Message-ID: <CACRpkdaiLd2HkW_ozQYJzXsVCEdp=VHBSEDkzmDF1tSmLtf29A@mail.gmail.com>
References: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34558 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030678AbcCQNe4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 09:34:56 -0400
Received: by mail-ob0-f175.google.com with SMTP id ts10so83915295obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2016 06:34:56 -0700 (PDT)
In-Reply-To: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Qi Zheng <qi.zheng@intel.com>

On Wed, Mar 16, 2016 at 7:15 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:

> High level trigger mode of GPIO interrupt is not set correctly
> in intel_gpio_irq_type(), and will make this kind of interrupt
> not respond.
>
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Patch applied with Mika's ACK, from v1.

Yours,
Linus Walleij
