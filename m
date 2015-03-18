From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: mtk-common: Use devm_kcalloc at
 appropriate places
Date: Wed, 18 Mar 2015 13:08:35 +0100
Message-ID: <CACRpkdYEev5OGkgkTu9kwhhonerkQ=CtxRVkXpdksps8ed0dKg@mail.gmail.com>
References: <1426168353.30920.2.camel@phoenix>
	<1426168412.30920.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34356 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755523AbbCRMIg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 08:08:36 -0400
Received: by obbgg8 with SMTP id gg8so29996526obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 05:08:35 -0700 (PDT)
In-Reply-To: <1426168412.30920.3.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 12, 2015 at 2:53 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Prefer devm_kcalloc over devm_kzalloc with multiply.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
