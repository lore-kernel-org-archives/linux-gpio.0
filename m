From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: don't override irq_*_resources() callbacks
Date: Mon, 3 Aug 2015 10:53:49 +0200
Message-ID: <CACRpkdaORy4W8qC-Et-2GPMQheojbBq_R9NWyatc2H7LoJPbSQ@mail.gmail.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33701 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904AbbHCIxu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 04:53:50 -0400
Received: by obdeg2 with SMTP id eg2so94187556obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 01:53:49 -0700 (PDT)
In-Reply-To: <1438346937-9020-1-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 31, 2015 at 2:48 PM, Rabin Vincent <rabin@rab.in> wrote:

> If the driver has specified its own irq_{request/release}_resources()
> functions, don't override them.  The gpio-etraxfs driver will use this.
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Perfectly reasonable given the usecase in patch 2/2. Patch applied.

Yours,
Linus Walleij
