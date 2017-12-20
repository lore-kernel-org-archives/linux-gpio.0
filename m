From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: axp209: dereference pointer after it's been set
Date: Wed, 20 Dec 2017 09:07:32 +0100
Message-ID: <CACRpkdYDe6NePVw1WCR_CqBYnkje0LiFk5mnH-yJ9s2shD96cA@mail.gmail.com>
References: <20171213085503.31899-1-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:44094 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751850AbdLTIHe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Dec 2017 03:07:34 -0500
Received: by mail-it0-f65.google.com with SMTP id b5so5763657itc.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2017 00:07:33 -0800 (PST)
In-Reply-To: <20171213085503.31899-1-quentin.schulz@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Mylene Josserand <mylene.josserand@free-electrons.com>

On Wed, Dec 13, 2017 at 9:55 AM, Quentin Schulz
<quentin.schulz@free-electrons.com> wrote:

> The number of GPIOs is gotten from a field within the structure
> referenced in the of_device.data but it was actually read before it was
> retrieved, thus it was dereferencing a null pointer.
>
> Set the number of GPIOs after retrieving of_device.data.
>
> Fixes: e1190083b89b ("pinctrl: axp209: add support for AXP813 GPIOs")
>
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Reported-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>

Patch applied with the tags for test and ACK.

Yours,
Linus Walleij
