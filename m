From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] pinctrl: mediatek: Implement wake handler and suspend resume
Date: Wed, 26 Aug 2015 14:41:37 +0200
Message-ID: <CACRpkdad3iQ89CtUyybAiz7pgNV8cuFKm=z93UAAhJXJJBt15Q@mail.gmail.com>
References: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35445 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756235AbbHZMli (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 08:41:38 -0400
Received: by oiew67 with SMTP id w67so120680710oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 05:41:37 -0700 (PDT)
In-Reply-To: <1439541486-22203-1-git-send-email-maoguang.meng@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: maoguang meng <maoguang.meng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 14, 2015 at 10:38 AM,  <maoguang.meng@mediatek.com> wrote:

> From: Maoguang Meng <maoguang.meng@mediatek.com>
>
> This patch implement irq_set_wake to get who is wakeup source and
> setup on suspend resume.
>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>
> ---
> changes since v3:
> -add a comment in mtk_eint_chip_read_mask.
> -delete ALIGN when allocate eint_offsets.ports.
> -fix unrelated change.

Patch applied with Daniel's, Yingjoe's and Hongzhu's tags.

Yours,
Linus Walleij
