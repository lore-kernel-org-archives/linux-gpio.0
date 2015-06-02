From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Tue, 02 Jun 2015 15:33:46 +0300
Message-ID: <556DA2AA.6060605@linaro.org>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>	<20150518110214.GC28127@localhost>	<CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com>	<20150521142524.GA30660@localhost>	<555E40FD.7010209@linaro.org>	<20150524171251.GA25494@localhost>	<55636FE5.7090709@linaro.org> <CACRpkdYicRS7my9-TkePD9FHEihCu6GxONHHKJdNd58fcF5aBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:35046 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759013AbbFBMdt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 08:33:49 -0400
Received: by labko7 with SMTP id ko7so120556616lab.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 05:33:47 -0700 (PDT)
In-Reply-To: <CACRpkdYicRS7my9-TkePD9FHEihCu6GxONHHKJdNd58fcF5aBw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

On 06/01/2015 04:09 PM, Linus Walleij wrote:
> On Mon, May 25, 2015 at 8:54 PM, Grygorii.Strashko@linaro.org
> <grygorii.strashko@linaro.org> wrote:
>
>> .. Looks like it's time to drop this stuff :,,(
>
> Ooops missed this part of the discussion. Indeed it will call accessors
> on non-requested GPIO lines. Damned. Taking these patches out again.

Yep. I've missed to recall v2 patches, sorry for that.



-- 
regards,
-grygorii
