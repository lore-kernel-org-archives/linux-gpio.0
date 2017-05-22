From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: remove unneeded (void *) casts in of_match_table
Date: Mon, 22 May 2017 17:13:40 +0200
Message-ID: <CACRpkdbFn-_2PpZr-CLKfswQny+CgLKrN_HLVUQN7U3D8_mMRQ@mail.gmail.com>
References: <1494605925-6487-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36405 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934458AbdEVPNm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 11:13:42 -0400
Received: by mail-it0-f42.google.com with SMTP id o5so153741853ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2017 08:13:42 -0700 (PDT)
In-Reply-To: <1494605925-6487-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, May 12, 2017 at 6:18 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> of_device_id::data is an opaque pointer.  No explicit cast is needed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with S=C3=B6ren's ACK.

Yours,
Linus Walleij
