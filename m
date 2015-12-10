From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: atlas7: add pingroup with reduced cs line
 for atlas7 nand
Date: Thu, 10 Dec 2015 16:20:08 +0100
Message-ID: <CACRpkda5d1S59mwCwMAWCVJzppn9o71-kevL=j31jDG_VpKoYg@mail.gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34148 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbbLJPUI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:20:08 -0500
Received: by oigl9 with SMTP id l9so8322391oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:20:08 -0800 (PST)
In-Reply-To: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

On Mon, Nov 30, 2015 at 7:05 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Wei Chen <Wei.Chen@csr.com>
>
> The nand in atlas7 has two chip select line. But in most time, the
> nand only has one chip, so only one chip select line is enough.
> The nand driver select this new pin group can free one chip select
> line for other modules to avoid pin conflict.
>
> Signed-off-by: Wei Chen <Wei.Chen@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied.

Yours,
Linus Walleij
