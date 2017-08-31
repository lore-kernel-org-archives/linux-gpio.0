From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: fix members of rmii group for Pro4
Date: Thu, 31 Aug 2017 15:51:05 +0200
Message-ID: <CACRpkdZ6Db=FivejdqG=WHbwot80Jq9xEeF58F1h9n7EuL94Hg@mail.gmail.com>
References: <1503886886-30065-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503886886-30065-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 28, 2017 at 4:21 AM, Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:

> The ether_rmii_groups should have "ether_rmii" and "ether_rmiib" as
> members. This patch replaces to them.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Patch applied with Fixes: tag and ACKs.

Yours,
Linus Walleij
