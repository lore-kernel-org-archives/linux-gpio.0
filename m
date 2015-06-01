From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 1 Jun 2015 15:09:48 +0200
Message-ID: <CACRpkdYicRS7my9-TkePD9FHEihCu6GxONHHKJdNd58fcF5aBw@mail.gmail.com>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
	<20150518110214.GC28127@localhost>
	<CACRpkdb9K5oi0Ld-njEz2a85X1NhYgFa8DCTZquqALdohL7WKA@mail.gmail.com>
	<20150521142524.GA30660@localhost>
	<555E40FD.7010209@linaro.org>
	<20150524171251.GA25494@localhost>
	<55636FE5.7090709@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34209 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752031AbbFANJt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 09:09:49 -0400
Received: by oifu123 with SMTP id u123so100692984oif.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 06:09:49 -0700 (PDT)
In-Reply-To: <55636FE5.7090709@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 25, 2015 at 8:54 PM, Grygorii.Strashko@linaro.org
<grygorii.strashko@linaro.org> wrote:

> .. Looks like it's time to drop this stuff :,,(

Ooops missed this part of the discussion. Indeed it will call accessors
on non-requested GPIO lines. Damned. Taking these patches out again.

Yours,
Linus Walleij
