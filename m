From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Fix hardware strap register write logic
Date: Tue, 22 Aug 2017 14:45:31 +0200
Message-ID: <CACRpkdb=Hby0fa1hZASBAbUv+U29RWBM-bAJYFsRj9=V281xug@mail.gmail.com>
References: <1502436472-136063-1-git-send-email-sdliyong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502436472-136063-1-git-send-email-sdliyong@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Li <sdliyong@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>, Rick Altherr <raltherr@google.com>, Rob Herring <robh@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2017 at 9:27 AM, Yong Li <sdliyong@gmail.com> wrote:

> The hardware strap register(SCU70) only accepts write =E2=80=981=E2=80=99=
,
> to clear it to =E2=80=980=E2=80=99, must set bits(write  =E2=80=981=E2=80=
=99) to SCU7C
>
> Signed-off-by: Yong Li <sdliyong@gmail.com>

I'm waiting for an updated patch addressing Andrew's comment
(unless there is one in my mailbox, already, I am swamped as
usual).

Yours,
Linus Walleij
