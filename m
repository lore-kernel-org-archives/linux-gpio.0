From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V8 3/8] MIPS: Cleanup Loongson-2F's gpio driver
Date: Mon, 23 Mar 2015 15:29:02 +0900
Message-ID: <CAAVeFuLytDZwo-=Q3DSxS7jLWbr4Jgf8BsBr9VGptBBu4SzZZg@mail.gmail.com>
References: <1426213595-28454-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:36749 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291AbbCWG3X (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2015 02:29:23 -0400
Received: by iedm5 with SMTP id m5so28673985ied.3
        for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2015 23:29:22 -0700 (PDT)
In-Reply-To: <1426213595-28454-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 13, 2015 at 11:26 AM, Huacai Chen <chenhc@lemote.com> wrote:
> This cleanup is prepare to move the driver to drivers/gpio. Custom
> definitions of gpio_get_value()/gpio_set_value() are dropped.

I suppose this is starting to look ok, at least patches 3, 4 and 5
which are of interest for GPIO. I wonder which tree they should be
merged through, MIPS or GPIO? Not seeing the rest of the series, I
cannot make a suggestion.
