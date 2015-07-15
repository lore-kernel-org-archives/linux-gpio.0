From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mvebu: kill bogus dependency on GPIO_GENERIC
Date: Wed, 15 Jul 2015 11:47:06 +0200
Message-ID: <CACRpkdbAg4CvhWdsdRii7rykBRhxM-gz4Vw9_8OE5dL5NGDU0g@mail.gmail.com>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
	<1434713464-32069-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434713464-32069-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 19, 2015 at 1:31 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The driver gpio-mvebu.c does not depend on gpio-generic.c at all.
> Drop unneeded "select GPIO_GENERIC".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
