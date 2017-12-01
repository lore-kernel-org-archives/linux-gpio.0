From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: it87: fix mojibake in module metadata
Date: Fri, 1 Dec 2017 20:41:47 +0100
Message-ID: <CACRpkdaMrvbEwgb-vxgMdB4G5u8onTLqrGt75OL266zW9tt9qg@mail.gmail.com>
References: <20171128032149.9951-1-kilobyte@angband.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:43052 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751682AbdLATls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Dec 2017 14:41:48 -0500
Received: by mail-io0-f196.google.com with SMTP id s37so12408596ioe.10
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2017 11:41:48 -0800 (PST)
In-Reply-To: <20171128032149.9951-1-kilobyte@angband.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Adam Borowski <kilobyte@angband.pl>
Cc: =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>, linux-gpio@vger.kernel.org

On Tue, Nov 28, 2017 at 4:21 AM, Adam Borowski <kilobyte@angband.pl> wrote:

> It had twice-encoded Unicode.
>
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

Ooops. Patch applied.

Yours,
Linus Walleij
