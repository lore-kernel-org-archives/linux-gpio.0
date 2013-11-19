From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Remove duplicate include of errno.h
Date: Tue, 19 Nov 2013 21:15:15 +0100
Message-ID: <CACRpkdb=NDnYDJe8y1CrkRsVpZCUiMQkf+u58MSp20uzjOa=BQ@mail.gmail.com>
References: <1384864362-21018-1-git-send-email-manishv.b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:53827 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058Ab3KSUPP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 15:15:15 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so1325508oag.17
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 12:15:15 -0800 (PST)
In-Reply-To: <1384864362-21018-1-git-send-email-manishv.b@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Nov 19, 2013 at 1:32 PM, Vishwanathrao Badarkhe, Manish
<manishv.b@ti.com> wrote:

> From: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
>
> Currently, code include errno.h twice. Remove one inclusion
> of errno.h
>
> Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b@ti.com>

Patch applied, thanks!

Yours,
Linus Walleij
