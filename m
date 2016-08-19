From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 0/2] MIPS: TXx9: Move GPIO setup from .mem_setup() to
 .arch_init()
Date: Fri, 19 Aug 2016 20:48:00 +0900 (JST)
Message-ID: <20160819.204800.1116999270543643688.anemo@mba.ocn.ne.jp>
References: <1471525068-1525-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mfdf020.ocn.ad.jp ([153.128.50.78]:44035 "EHLO
        mfdf020.ocn.ad.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751442AbcHSLsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2016 07:48:15 -0400
Received: from mogw0117.ocn.ad.jp (mogw0117.ocn.ad.jp [118.23.109.91])
        by mfdf020.ocn.ad.jp (Postfix) with ESMTP id 0F94FB00D2A
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2016 20:48:12 +0900 (JST)
In-Reply-To: <1471525068-1525-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: geert@linux-m68k.org
Cc: ralf@linux-mips.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org

On Thu, 18 Aug 2016 14:57:46 +0200, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Geert Uytterhoeven (2):
>   MIPS: TXx9: tx39xx: Move GPIO setup from .mem_setup() to .arch_init()
>   MIPS: TXx9: tx49xx: Move GPIO setup from .mem_setup() to .arch_init()

Thank you for testing and creating patches.  Both patch looks good.

---
Atsushi Nemoto
