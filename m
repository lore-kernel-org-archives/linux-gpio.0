From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 09/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Tue, 28 Oct 2014 17:12:44 +0100
Message-ID: <CACRpkdbBLTOxjszvqj=Br9wqLU_6X_cC_7DOpFcT_+=QrapZrA@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
	<1410723213-22440-10-git-send-email-ryazanov.s.a@gmail.com>
	<CACRpkda3Cq+d47DMm018nAC7ThcHAOv-tOqEbNsUY1mOSnKyoA@mail.gmail.com>
	<CAHNKnsSj-=0aFHD574yRW9BpH1ONhy7K0NA8xri2ez6ab_MPMA@mail.gmail.com>
	<CACRpkda7XffyCvsG7CAMwF0qDW9bJ_m+xxFhhMAqd_r=O4B8+g@mail.gmail.com>
	<CAHNKnsThQb8zstGhRJjFFJx6eKtFd-NZuK9wND-Puex2OCY=Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:65281 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750855AbaJ1QNL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 12:13:11 -0400
Received: by mail-ie0-f182.google.com with SMTP id rd18so988604iec.41
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 09:13:10 -0700 (PDT)
In-Reply-To: <CAHNKnsThQb8zstGhRJjFFJx6eKtFd-NZuK9wND-Puex2OCY=Hw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 21, 2014 at 10:59 AM, Sergey Ryazanov
<ryazanov.s.a@gmail.com> wrote:

> BTW, the use of the irq_domain framework is required or I could
> opencode some stuff?

Whatever makes sense. If you write something that looks very
convoluted compared to doing it with irqdomain, you're doing
something wrong.

But shouldn't this driver be using GPIOLIB_IRQCHIP by the way?
That includes irqdomain handling.

Yours,
Linus Walleij
