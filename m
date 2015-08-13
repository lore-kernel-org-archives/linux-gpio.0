From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: atlas7: clear ugly branch statements for pull
 and drivestrength
Date: Thu, 13 Aug 2015 14:37:54 +0200
Message-ID: <CACRpkdYtFSps1R-YgMFoekkW8osDVf+ujrnGLP47YBCcq2ZBzg@mail.gmail.com>
References: <1438744934-15395-1-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34141 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583AbbHMMhz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2015 08:37:55 -0400
Received: by oip136 with SMTP id 136so25532725oip.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2015 05:37:54 -0700 (PDT)
In-Reply-To: <1438744934-15395-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

On Wed, Aug 5, 2015 at 5:22 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Wei Chen <Wei.Chen@csr.com>
>
> To set/get atlas7 pull & drive strength, we use lots of if/else
> to check pad type. But except mask value or immediate value, all
> actions in these conditional branches are the same.
> So we use predefined pull info table and drive strength table
> to reduce these redundancy code.
>
> Signed-off-by: Wei Chen <Wei.Chen@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied.

Yours,
Linus Walleij
