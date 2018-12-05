From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nuvoton: check for devm_kasprintf() failure
Date: Wed, 5 Dec 2018 22:55:39 +0100
Message-ID: <CACRpkdZPs0C-14itiR9xM+WPegNHBo9MgyHL5fPBxdZ8V3fUaw@mail.gmail.com>
References: <1542989578-21200-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542989578-21200-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 23, 2018 at 5:18 PM Nicholas Mc Guire <hofrat@osadl.org> wrote:

> devm_kasprintf() may return NULL on failure of internal allocation thus
> the assignment to  .label  is not safe if not checked. On error
> npcm7xx_gpio_of() returns negative values so -ENOMEM in the
> (unlikely) failure case of devm_kasprintf() should be fine here.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")

Patch applied.

Yours,
Linus Walleij
