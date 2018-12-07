From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: report if devm_kasptrinf() fails
Date: Fri, 7 Dec 2018 10:24:49 +0100
Message-ID: <CACRpkda6ketyah+L7VbGNHjgh85DffaAkQmeEpjTO08Zb_Wbag@mail.gmail.com>
References: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 24, 2018 at 5:34 PM Nicholas Mc Guire <hofrat@osadl.org> wrote:

> devm_kasprintf() may return NULL on failure of internal allocation
> thus the assignments are not safe if not checked. On error
> rza1_pinctrl_register() respectively rza1_parse_gpiochip() return
> negative values so -ENOMEM in the (unlikely) failure case of
> devm_kasprintf() should be fine here.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")

This patch needs to be handled by Geert Uytterhoeven,
who maintain the Renesas pin controllers.

If he didn't get it you might have to resend the patch to him.

Yours,
Linus Walleij
