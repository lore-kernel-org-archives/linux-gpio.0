From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V4 2/6] MIPS: Move Loongson GPIO driver to drivers/gpio
Date: Wed, 19 Nov 2014 17:11:32 +0900
Message-ID: <CAAVeFuKYgXhV_372FBQnArEFT4xEVB73P+yurJ9mF0CkKCx7eQ@mail.gmail.com>
References: <1415891560-8915-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:54782 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932161AbaKSILw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Nov 2014 03:11:52 -0500
Received: by mail-ig0-f178.google.com with SMTP id hl2so524030igb.17
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2014 00:11:52 -0800 (PST)
In-Reply-To: <1415891560-8915-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 14, 2014 at 12:12 AM, Huacai Chen <chenhc@lemote.com> wrote:
> Move Loongson-2's GPIO driver to drivers/gpio and add Kconfig options.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Guess this should go through the GPIO tree once the platform
maintainers have acked this?
