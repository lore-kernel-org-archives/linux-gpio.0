From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson: Drop pinctrl_unregister for devm_ registered device
Date: Tue, 26 Jul 2016 14:56:44 -0700
Message-ID: <m2a8h4ukpv.fsf@baylibre.com>
References: <1469544718-32001-1-git-send-email-weiyj.lk@gmail.com>
	<20160726170053.GA40841@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:34356 "EHLO
	mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757444AbcGZV4r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2016 17:56:47 -0400
Received: by mail-pf0-f182.google.com with SMTP id p64so3592049pfb.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2016 14:56:46 -0700 (PDT)
In-Reply-To: <20160726170053.GA40841@dtor-ws> (Dmitry Torokhov's message of
	"Tue, 26 Jul 2016 10:00:53 -0700")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

> On Tue, Jul 26, 2016 at 02:51:58PM +0000, Wei Yongjun wrote:
>> It's not necessary to unregister pin controller device registered
>> with devm_pinctrl_register() and using pinctrl_unregister() leads
>> to a double free.
>> 
>> This is detected by Coccinelle semantic patch.
>> 
>> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
>
> Fixes: e649f7ec8c5f ("pinctrl: meson: Use devm_pinctrl_register() for
> pinctrl registration")
>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
