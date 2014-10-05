From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2 1/2] GPIO: Add driver for 74xx-ICs with MMIO access
Date: Sun, 5 Oct 2014 19:07:27 +0900
Message-ID: <CAAVeFu+htDNcGrgK-DE74A4CpRJrBzGoV4egM4nDFP3yF6kmDg@mail.gmail.com>
References: <1412321517-28348-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:59701 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbaJEKHs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Oct 2014 06:07:48 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so1296110igb.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Oct 2014 03:07:47 -0700 (PDT)
In-Reply-To: <1412321517-28348-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 3, 2014 at 4:31 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
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

Nothing to say, this looks just good!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
