From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: sirf: wrap all gpio banks into one gpio_chip
Date: Tue, 22 Apr 2014 20:27:55 +0200
Message-ID: <CACRpkdZ5e=3SzQxvhzEJ=jyOPzqjZ1LfU0CtYscREsNXyFf+bw@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-2-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:49064 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751577AbaDVS14 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 14:27:56 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so6081229oag.35
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 11:27:55 -0700 (PDT)
In-Reply-To: <1397544229-20545-2-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Barry Song <Baohua.Song@csr.com>
>
> all gpio banks are in one chip, that makes software clean in mapping
> irq and gpio.
>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

These all look good, but for some reason does not apply on top of
the pinctrl "devel" branch based on v3.15-rc2. Can you please rebase
this set onto my branch or atleast v3.15-rc2 and resend?

Yours,
Linus Walleij
