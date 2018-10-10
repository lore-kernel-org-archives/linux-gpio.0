From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] gpio: fix kernel-doc after devres.c file rename
Date: Wed, 10 Oct 2018 13:49:11 +0200
Message-ID: <CACRpkdb4uh02_du4WPc9OPnzU7O6z8h3Mup1ibjKHTVGy0iXkg@mail.gmail.com>
References: <ec1afc50-993c-c0d5-00e0-ab111579fca4@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ec1afc50-993c-c0d5-00e0-ab111579fca4@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 8, 2018 at 12:57 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix gpio kernel-doc generation after rename of the devres.c file.
> Fixes these errors & warning:
>
> Error: Cannot open file ../drivers/gpio/devres.c
> Error: Cannot open file ../drivers/gpio/devres.c
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -export ../drivers/gpio/devres.c' failed with return code 2
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
