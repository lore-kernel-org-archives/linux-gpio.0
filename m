From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V4 2/6] MIPS: Move Loongson GPIO driver to drivers/gpio
Date: Sat, 22 Nov 2014 00:28:19 +0900
Message-ID: <CAAVeFu+bHZdDgqWGg-dKhGkvV81_5JA=O-whqSgpN=6T8fpqRA@mail.gmail.com>
References: <1415891560-8915-1-git-send-email-chenhc@lemote.com>
 <CAAVeFuKYgXhV_372FBQnArEFT4xEVB73P+yurJ9mF0CkKCx7eQ@mail.gmail.com>
 <CAAVeFuJoo3X9aNYdrn5TJ-PjTzvFuEm5QTPmKYMy9NyWFy1_WA@mail.gmail.com>
 <20141119101157.GB7213@linux-mips.org> <tencent_15D766A360D879F4553C1872@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:42770 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755341AbaKUP2k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Nov 2014 10:28:40 -0500
Received: by mail-ie0-f170.google.com with SMTP id rd18so5123949iec.15
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2014 07:28:40 -0800 (PST)
In-Reply-To: <tencent_15D766A360D879F4553C1872@qq.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, wuzhangjin <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 19, 2014 at 11:25 PM, =E9=99=88=E5=8D=8E=E6=89=8D <chenhc@l=
emote.com> wrote:
> Hi, Ralf and Alexandre,
>
> So, I need three patches: clean up, move to drivers/gpio, and improve=
 it to support Loonson-3A/3B?

Exactly. Before accepting a new driver in drivers/gpio we would like
to make sure it is up-to-date with respect to the current GPIO drivers
practices.

Thanks,
Alex.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
