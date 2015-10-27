From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: driver for AMD Promontory
Date: Tue, 27 Oct 2015 17:19:37 +0100
Message-ID: <CACRpkdaj4xAtWNNtHd-8bbMOU773UhiR844eZm0P9W+poRP=Og@mail.gmail.com>
References: <1445854128-2137-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34528 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965011AbbJ0QTi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 12:19:38 -0400
Received: by obbza9 with SMTP id za9so57093875obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 09:19:37 -0700 (PDT)
In-Reply-To: <1445854128-2137-1-git-send-email-Yd_Tseng@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: YD Tseng <ltyu101@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Yd_Tseng@asmedia.com.tw, =?UTF-8?B?VHVuZ1l1IEx1KOWRguadseaYsSk=?= <TungYu_Lu@asmedia.com.tw>

On Mon, Oct 26, 2015 at 11:08 AM, YD Tseng <ltyu101@gmail.com> wrote:

> Really appreciate for reviewing the patch.
> May we know what we can do for the next step?

The driver will be in mainline Linux when v4.4 is released in some
two months.

The next step is that I expect you to maintain the driver in the
future. Maybe you want to add new functionality to it also?

Yours,
Linus Walleij
