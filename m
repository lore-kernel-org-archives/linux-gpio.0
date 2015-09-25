From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: core: handle pinctrl_get failure
Date: Fri, 25 Sep 2015 10:23:57 -0700
Message-ID: <CACRpkdZU44Bjo5t=yywcGDj5f9rv=V-X1xm1kgnVm2H3bgq-_w@mail.gmail.com>
References: <1441892286-18989-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33043 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756528AbbIYRX5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 13:23:57 -0400
Received: by obbbh8 with SMTP id bh8so87072908obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 10:23:57 -0700 (PDT)
In-Reply-To: <1441892286-18989-1-git-send-email-van.freenix@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peng Fan <van.freenix@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 10, 2015 at 6:38 AM, Peng Fan <van.freenix@gmail.com> wrote:

> Need to do error handling path when pinctrl_get fails. Also when
> pinctrl_get success, insert 'pctldev->node' to pinctrldev_list.
>
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

I think this patch is totally wrong and you have probably not tested
it using pinctrl hogs.

pinctr_get() from self will *not work* unless the device is added to
the list *first*.

Dropping this.

Yours,
Linus Walleij
