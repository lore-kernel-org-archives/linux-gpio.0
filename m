From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools/gpio: Don't use u_int32_t
Date: Wed, 20 Dec 2017 10:36:56 +0100
Message-ID: <CACRpkdYiwGG9ejBsD9zgv1LQR57xTmEuPoV-518Ebornhp9s+Q@mail.gmail.com>
References: <20171214202608.14662-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33980 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753574AbdLTJg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 04:36:57 -0500
Received: by mail-io0-f196.google.com with SMTP id f18so11587176ioh.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 01:36:56 -0800 (PST)
In-Reply-To: <20171214202608.14662-1-j.neuschaefer@gmx.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 14, 2017 at 9:26 PM, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> u_int32_t is a non-standard version of uint32_t, that was apparently
> introduced by BSD. Use uint32_t from stdint.h instead.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied.

Yours,
Linus Walleij
