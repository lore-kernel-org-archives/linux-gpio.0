From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: generic: replace error variable with errptr
 functionality in bgpio_map
Date: Mon, 5 Oct 2015 09:17:21 +0200
Message-ID: <CACRpkdb4Zc6ykbXFEFe=yaH=HL4eXNNxxG6B_qNLZo4fT5uxPA@mail.gmail.com>
References: <560C59A4.1070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34939 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbbJEHRW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 03:17:22 -0400
Received: by obbzf10 with SMTP id zf10so122000889obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 00:17:21 -0700 (PDT)
In-Reply-To: <560C59A4.1070003@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Sep 30, 2015 at 11:52 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Use the ERRPTR standard way to return an error code in a pointer
> thus simplifiying the code.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Patch applied after shortening subject.

Yours,
Linus Walleij
