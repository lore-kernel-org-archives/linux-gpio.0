From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: mtk-common: Remove kfree for
 memory allocated by devm_kzalloc
Date: Wed, 18 Mar 2015 12:58:53 +0100
Message-ID: <CACRpkdbUQXaYgei7WrwVZ5HaOYWGCxbVCJap6u0fX3jP8yqMEQ@mail.gmail.com>
References: <1426168353.30920.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:36560 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755514AbbCRL6y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 07:58:54 -0400
Received: by obdfc2 with SMTP id fc2so29816403obd.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 04:58:53 -0700 (PDT)
In-Reply-To: <1426168353.30920.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 12, 2015 at 2:52 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Yingjoe's ACK.

Yours,
Linus Walleij
