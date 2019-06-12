From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove unneeded initializer for
 list_for_each_entry() iterator
Date: Wed, 12 Jun 2019 09:10:12 +0200
Message-ID: <CACRpkdZ1B2b3DLdFrtYLfZgJH2QWBYmnX-mBHtO3C=EPc=UC_w@mail.gmail.com>
References: <20190609145537.7953-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609145537.7953-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 4:55 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The iterator is initialized in list_for_each_entry().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
