From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V6 5/8] GPIO: Add Loongson-3A/3B GPIO driver support
Date: Mon, 19 Jan 2015 15:21:59 +0900
Message-ID: <CAAVeFuJ=1BS3-_vDjiQCJuTDuTvRwzCJRhaFOqegzninOnYFVQ@mail.gmail.com>
References: <1419742654-15094-1-git-send-email-chenhc@lemote.com> <1419742654-15094-3-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:50076 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbbASGWU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 01:22:20 -0500
Received: by mail-ig0-f181.google.com with SMTP id r2so11301818igi.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2015 22:22:19 -0800 (PST)
In-Reply-To: <1419742654-15094-3-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 28, 2014 at 1:57 PM, Huacai Chen <chenhc@lemote.com> wrote:
> Improve Loongson-2's GPIO driver to support Loongson-3A/3B, and update
> Loongson-3's default config file.

This looks ok at first sight, but I will make a more complete review
on the next revision of this series with the comments of patches 3
addressed and the assurance that these patches have been tested
individually.
