From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Tue, 24 May 2016 12:58:57 +0200
Message-ID: <CACRpkdZe6iLPC7EHnq0UZGsULP3-WDGtXkTdEcwHdihtAZQaRg@mail.gmail.com>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
	<1462868614-20602-7-git-send-email-chunfeng.yun@mediatek.com>
	<CACRpkdaeD5mk7LXEWnE0=Xute8-JA-fa4tVt4fYhujEXeq2+9w@mail.gmail.com>
	<1462991546.11623.3.camel@mussux00>
	<1463017282.11651.82.camel@mhfsdcap03>
	<1463018942.1608.5.camel@mussux00>
	<1463021701.25171.5.camel@mussux00>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36100 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497AbcEXK66 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2016 06:58:58 -0400
Received: by mail-oi0-f46.google.com with SMTP id j1so19889362oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2016 03:58:57 -0700 (PDT)
In-Reply-To: <1463021701.25171.5.camel@mussux00>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: chunfeng yun <chunfeng.yun@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Biao Huang <biao.huang@mediatek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.or

On Thu, May 12, 2016 at 4:55 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> We find there are some other pins still have the same problem, so please
> hold on it. Sorry for so much noise.

It's OK. Get me a big patch fixing it all when you're combed through
things and we can apply it for fixes/stable.

Yours,
Linus Walleij
