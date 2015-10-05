From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: generic: improve error handling in bgpio_map
Date: Mon, 5 Oct 2015 09:14:03 +0200
Message-ID: <CACRpkdYEi7ND=Rg6i+8nnT8CmNH2Mc5O67jtGd=4KdZj+cjXZg@mail.gmail.com>
References: <560C591C.2030709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33299 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbbJEHOF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 03:14:05 -0400
Received: by oixx17 with SMTP id x17so86026787oix.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 00:14:04 -0700 (PDT)
In-Reply-To: <560C591C.2030709@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Sep 30, 2015 at 11:50 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> If bgpio_map returns NULL then err should always be set.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Looks correct. Patch applied.

Yours,
Linus Walleij
