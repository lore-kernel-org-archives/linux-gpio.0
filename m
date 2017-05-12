From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: mediatek: reuse pinctrl driver for mt7623
Date: Fri, 12 May 2017 11:09:42 +0200
Message-ID: <CACRpkdZ78Qc7ABHa7f58T0SEZ1OCcv=YOPX8305Sh3tQKXFCVA@mail.gmail.com>
References: <1493625274-3909-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:35687 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932310AbdELJJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2017 05:09:44 -0400
Received: by mail-io0-f175.google.com with SMTP id f102so36405689ioi.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2017 02:09:43 -0700 (PDT)
In-Reply-To: <1493625274-3909-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: sean.wang@mediatek.com
Cc: John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 1, 2017 at 9:54 AM,  <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> mt7623 pinctrl hardware can be compatible with mt2701 driver,
> so the patch lets the pinctrl on mt7623 SoC reuse the driver
> and deletes those redundant ones.
>
> Cc: John Crispin <john@phrozen.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Execllent, patch applied with John's and Matthias' ACK/Review tags
for v4.13.

Yours,
Linus Walleij
