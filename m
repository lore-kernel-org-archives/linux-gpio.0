From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zynq: fix typo in group name for qspi1
Date: Mon, 15 Feb 2016 19:19:41 +0100
Message-ID: <CACRpkdY4qx1xNfmE9WZ-YpCxM4XL-7rq6uuka5D3ZP3mQHscRQ@mail.gmail.com>
References: <1454573648-21751-1-git-send-email-helmut.buchsbaum@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35116 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828AbcBOSTl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 13:19:41 -0500
Received: by mail-ob0-f177.google.com with SMTP id xk3so222641151obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 10:19:41 -0800 (PST)
In-Reply-To: <1454573648-21751-1-git-send-email-helmut.buchsbaum@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Cc: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 4, 2016 at 9:14 AM, Helmut Buchsbaum
<helmut.buchsbaum@gmail.com> wrote:

> Due to a typo Zynq pin controller does not set pin function of qspi1
> when using function qspi1. So pin group for qspi1 has to be renamed t=
o
> "qspi1_0_grp" as outlined in the corresponding bindings documentation=
=2E
>
> This also removes kernel message:
>   zynq-pinctrl 700.pinctrl: invalid group "qspi1_0_grp" for function =
"qspi1"
>
> Signed-off-by: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>

Patch applied with S=C3=B6ren's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
