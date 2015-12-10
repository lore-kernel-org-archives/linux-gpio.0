From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] pinctrl: altas7: add sd9 function mux support
Date: Thu, 10 Dec 2015 16:21:49 +0100
Message-ID: <CACRpkdYWeoNnC63-RUizQ9iaNDVZo=R9gFTn=FrEhu2yE6TqfQ@mail.gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
	<1448863557-25352-2-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33523 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbbLJPVu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:21:50 -0500
Received: by obbsd4 with SMTP id sd4so11462675obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:21:49 -0800 (PST)
In-Reply-To: <1448863557-25352-2-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Yonghui Zhang <yonghui.zhang@csr.com>, Barry Song <Baohua.Song@csr.com>

On Mon, Nov 30, 2015 at 7:05 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Yonghui Zhang <yonghui.zhang@csr.com>
>
> The sd9 pin mux with sd3 and it is selected by SYS2PCI_SDIO9SEL.
> This makes the codes ugly since the register is not in pinctrl
> module.
>
> Signed-off-by: Yonghui Zhang <yonghui.zhang@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied.

Yours,
Linus Walleij
