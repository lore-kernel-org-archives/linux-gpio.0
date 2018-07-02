From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: stp-xway: Implement get callback
Date: Mon, 2 Jul 2018 15:22:20 +0200
Message-ID: <CACRpkdbhjPpFN_k36xDYgNKVrEg8ze8R0iHhXTPPuy5u7yWGsA@mail.gmail.com>
References: <1530215860-25549-1-git-send-email-dev@kresin.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530215860-25549-1-git-send-email-dev@kresin.me>
Sender: linux-kernel-owner@vger.kernel.org
To: dev@kresin.me
Cc: John Crispin <john@phrozen.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 28, 2018 at 10:02 PM Mathias Kresin <dev@kresin.me> wrote:

> Add an implementation to get the current GPIO state.
>
> The callback is used by the leds-gpio driver for example, in case the
> current LED/GPIO state should be kept during driver load.
>
> Signed-off-by: Mathias Kresin <dev@kresin.me>

Patch applied.

Yours,
Linus Walleij
