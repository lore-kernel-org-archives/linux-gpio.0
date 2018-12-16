From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: Wrap -Woverride-init with cc-option
Date: Sun, 16 Dec 2018 01:23:46 +0100
Message-ID: <CACRpkdYH9VDjzpH90X=gTKAnw1guGG3uUjDmUXcSkBxg=6LgyA@mail.gmail.com>
References: <20181211000506.7559-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211000506.7559-1-natechancellor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 11, 2018 at 1:05 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Clang does not support this option:
>
> warning: unknown warning option '-Woverride-init'; did you mean
> '-Woverride-module'? [-Wunknown-warning-option]
> 1 warning generated.
>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied with the ACKs!

Yours,
Linus Walleij
