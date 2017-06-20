From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: fix WARN_ON() of pingroups dump on LD20
Date: Tue, 20 Jun 2017 11:35:29 +0200
Message-ID: <CACRpkdavW1WGHzW9et9SgEOVe+oV71FZCONEFSL3oaYA3_-Lyg@mail.gmail.com>
References: <1497415770-17741-1-git-send-email-yamada.masahiro@socionext.com> <1497415770-17741-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497415770-17741-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2017 at 6:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The pingroups dump of debugfs hits WARN_ON() in pinctrl_groups_show().
> Filling non-existing ports with '-1' turned out a bad idea.
>
> Fixes: 336306ee1f2d ("pinctrl: uniphier: add UniPhier PH1-LD20 pinctrl driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
