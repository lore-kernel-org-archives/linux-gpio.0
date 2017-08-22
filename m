From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write logic
Date: Tue, 22 Aug 2017 14:52:30 +0200
Message-ID: <CACRpkdaXreebGTf_cxrttwmdcRqYfaHx8WrQ64KA+o3AijBYfQ@mail.gmail.com>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Rick Altherr <raltherr@google.com>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 15, 2017 at 6:21 PM, Yong Li <sdliyong@gmail.com> wrote:

> On AST2500, the hardware strap register(SCU70) only accepts write =E2=80=
=981=E2=80=99,
> to clear it to =E2=80=980=E2=80=99, must set bits(write  =E2=80=981=E2=80=
=99) to SCU7C
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>

Patch applied with Andrew's review/test tags.

Yours,
Linus Walleij
