From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: sx150x: unregister the pinctrl on release
Date: Thu, 18 Jan 2018 08:53:36 +0100
Message-ID: <CACRpkdZiEzauxw0t+f+iOsZBky-A9DwD-_zTVQ05kOSmxqL55g@mail.gmail.com>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
 <20180117133423.4482-1-peda@axentia.se> <20180117133423.4482-2-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117133423.4482-2-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 17, 2018 at 2:34 PM, Peter Rosin <peda@axentia.se> wrote:

> There is no matching call to pinctrl_unregister, so switch to the
> managed devm_pinctrl_register to clean up properly when done.
>
> Fixes: 9e80f9064e73 ("pinctrl: Add SX150X GPIO Extender Pinctrl Driver")
> Signed-off-by: Peter Rosin <peda@axentia.se>

Patch applied.

Yours,
Linus Walleij
