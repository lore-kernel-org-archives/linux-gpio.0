From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: Intel: add RX invertion config
Date: Mon, 14 Mar 2016 13:26:17 +0100
Message-ID: <CACRpkdbT9w+XXOUSuzGY+NUkxkKvoUK7KXMRi8R5TJK8Ytk+KQ@mail.gmail.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
	<20160311093856.GN1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D1032C@SHSMSX101.ccr.corp.intel.com>
	<20160314085002.GY1796@lahna.fi.intel.com>
	<0DD381DBF8F68D419C32ACFCEB28EB2521D10643@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35025 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964849AbcCNM0S (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2016 08:26:18 -0400
Received: by mail-oi0-f53.google.com with SMTP id c203so131381404oia.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2016 05:26:18 -0700 (PDT)
In-Reply-To: <0DD381DBF8F68D419C32ACFCEB28EB2521D10643@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Zheng, Qi" <qi.zheng@intel.com>
Cc: "Westerberg, Mika" <mika.westerberg@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 14, 2016 at 9:56 AM, Zheng, Qi <qi.zheng@intel.com> wrote:

> The "pi330532" device on Broxton requires this function to manually
> trigger an GPIO input interrupt.
(...)
> We have gone through this requirement from CHT to BXT, there was no
> other better way to simulate the GPIO interrupt for the use of those devices.

I what you want is to trigger IRQs on GPIO lines using software
we need to add that to the GPIOlib subsystem, so this register
gets accessed from the GPIO side of things, not through pin control
I think?

We have so many diverse function pointers in the gpiochip, so
ability to trigger/test IRQs from software is certainly not a burden.

I don't understand the real-world usecase though, please explain
what kind of problem this is trying to overcome? Why does this
pi330532 driver need to do that, why can it not just inform the
driver that needs this interrupt that it should wake up, e.g by
using a notification or just an open-coded function call or whatever?

Yours,
Linus Walleij
