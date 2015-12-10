From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: atlas7: adjust vip pin groups for atlas7
Date: Thu, 10 Dec 2015 16:23:27 +0100
Message-ID: <CACRpkdZM5r7CrrOPpufFdg2niY61jzfr+zGjvG75yBjXh22AQw@mail.gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
	<1448863557-25352-4-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33881 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753912AbbLJPX2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:23:28 -0500
Received: by oigl9 with SMTP id l9so8378218oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:23:27 -0800 (PST)
In-Reply-To: <1448863557-25352-4-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

On Mon, Nov 30, 2015 at 7:05 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Wei Chen <Wei.Chen@csr.com>
>
> The vip low 8bit mode and vip high 8 bit mode pin groups had missed
> 3 pins:vip_vsync, vip_hsync and vip_pxclk. Without these 3 pins, the
> vip could not work properly.
> Now we add these 3 pins into these two pin groups.
>
> Signed-off-by: Wei Chen <Wei.Chen@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied.

Yours,
Linus Walleij
