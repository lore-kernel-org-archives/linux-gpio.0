From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: lantiq: add a to_irq callback
Date: Tue, 5 Jan 2016 11:10:34 +0100
Message-ID: <CACRpkda9mNt8XHhESpgmOFiRrRqMN14uHPmcXcrrJqe1=qxtWg@mail.gmail.com>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
	<1451942879-43265-3-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34986 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478AbcAEKKf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 05:10:35 -0500
Received: by mail-oi0-f47.google.com with SMTP id l9so243580107oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 02:10:35 -0800 (PST)
In-Reply-To: <1451942879-43265-3-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 4, 2016 at 10:27 PM, John Crispin <blogic@openwrt.org> wrote:

> The callback is missing so lets add it.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>

Thanks!

> +       return -1;
> +}

I changed this to return 0 because of this:
http://lwn.net/Articles/470820/

Patch applied with the above change.

Yours,
Linus Walleij
