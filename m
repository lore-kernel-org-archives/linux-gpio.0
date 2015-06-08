From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: add pinctrl_register_reason() to return proper
 error code
Date: Mon, 8 Jun 2015 15:36:10 +0200
Message-ID: <CACRpkdak-BOEwZWCn+XCb8as0EudM4BAyMjMUW4bsYmrcO6=6A@mail.gmail.com>
References: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdZywHgUHbMg-1gfBDPZ3uXHuBWMvkAUZgkDRbn6Hi2Ovg@mail.gmail.com>
	<CAK7LNASuVz1R7ftXTGZycMm-qdgx8MGxe6nCpA9QwDG0fJoDsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36737 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385AbbFHNgL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 09:36:11 -0400
Received: by oihb142 with SMTP id b142so93045113oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2015 06:36:10 -0700 (PDT)
In-Reply-To: <CAK7LNASuVz1R7ftXTGZycMm-qdgx8MGxe6nCpA9QwDG0fJoDsg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 2, 2015 at 5:32 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> If nobody is opposed to this, I can send a single big patch
> replacing all the references.
>
> In that case, we would not need _strict().

Yeah just do this.

> My concern is the sudden change of the function interface
> will break drivers that are under development out of the source tree.

Base the patch on my -devel branch so you cover all driver in
development. I will deal with any resulting mess.

Out of tree drivers we do not take into account, they should focus
their efforts on working upstream.

Yours,
Linus Walleij
