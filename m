From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: atlas7: adjust pin groups of atlas7 nanddisk
Date: Thu, 10 Dec 2015 16:22:42 +0100
Message-ID: <CACRpkdasovQB4a4NOV1PZG+DdCpO3uYwCngN791yBeggPGM4Rw@mail.gmail.com>
References: <1448863557-25352-1-git-send-email-21cnbao@gmail.com>
	<1448863557-25352-3-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36405 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbbLJPWm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:22:42 -0500
Received: by obcse5 with SMTP id se5so61604435obc.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:22:42 -0800 (PST)
In-Reply-To: <1448863557-25352-3-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Wei Chen <Wei.Chen@csr.com>, Barry Song <Baohua.Song@csr.com>

On Mon, Nov 30, 2015 at 7:05 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Wei Chen <Wei.Chen@csr.com>
>
> Remove write-protect and chip-selector pins from nand pin group.
> And then create two separate pin groups for these two pin.
>
> So the nand driver can choose correct pin groups as board desgin:
> For example:
> 1. nand without wp&cs:
>         nand@17050000 {
>                 pinctrl-0 = <&nd_df_basic_pmx>;
>         };
> 2. nand with wp
>         nand@17050000 {
>                 pinctrl-0 = <&nd_df_basic_pmx &nd_df_wp_pmx>;
>         };
> 3. nand with cs:
>         nand@17050000 {
>                 pinctrl-0 = <&nd_df_basic_pmx &nd_df_cs_pmx>;
>         };
> 4. nand with wp&cs:
>         nand@17050000 {
>                 pinctrl-0 = <&nd_df_basic_pmx &nd_df_wp_pmx &nd_df_cs_pmx>;
>         };
>
> Signed-off-by: Wei Chen <Wei.Chen@csr.com>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied.

Yours,
Linus Walleij
