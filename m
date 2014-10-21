From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] GPIO: Add driver for 74xx-ICs with MMIO access
Date: Tue, 21 Oct 2014 10:48:00 +0200
Message-ID: <CACRpkdaPtQLkkT-p6tWLEmyiHtXzRBXqBOd7jc0YCK9T42fB9A@mail.gmail.com>
References: <1412321517-28348-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:52825 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbaJUIsB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 04:48:01 -0400
Received: by mail-ie0-f170.google.com with SMTP id rd18so718026iec.29
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2014 01:48:00 -0700 (PDT)
In-Reply-To: <1412321517-28348-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 3, 2014 at 9:31 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> This patch adds driver to support GPIO functionality for 74xx-compatible
> ICs with MMIO access. Compatible models include:
>  1 bit:   741G125 (Input), 741G74 (Output)
>  2 bits:  742G125 (Input), 7474 (Output)
>  4 bits:  74125 (Input), 74175 (Output)
>  6 bits:  74365 (Input), 74174 (Output)
>  8 bits:  74244 (Input), 74273 (Output)
>  16 bits: 741624 (Input), 7416374 (Output)
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Patch applied.

Yours,
Linus Walleij
