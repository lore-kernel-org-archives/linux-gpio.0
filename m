From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V3 2/5] MIPS: Loongson: Add Loongson-3A/3B GPIO support
Date: Thu, 13 Nov 2014 15:26:09 +0900
Message-ID: <CAAVeFuJ1+y8wooVAHMST9zC4_Z8SE6x=VASsFkUwCVFcA8xuLg@mail.gmail.com>
References: <1415794700-7579-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:34774 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbaKMG0a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Nov 2014 01:26:30 -0500
Received: by mail-ie0-f175.google.com with SMTP id y20so15278875ier.34
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2014 22:26:30 -0800 (PST)
In-Reply-To: <1415794700-7579-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hongbing Hu <huhb@lemote.com>

On Wed, Nov 12, 2014 at 9:18 PM, Huacai Chen <chenhc@lemote.com> wrote:
> Improve Loongson-2's GPIO driver to support Loongson-3A/3B, and move it
> to drivers/gpio directory.

Could you split this in two patches:
1/2: move GPIO driver to drivers/gpio
2/2: support new devices in GPIO driver

and add the "-C" option to git format-patch so that file renaming gets
detected. This will make the changes easier to evaluate.

Thanks,
Alex.
