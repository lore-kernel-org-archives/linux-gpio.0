From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: ingenic: Fix inverted direction for < JZ4770
Date: Mon, 9 Jul 2018 13:58:44 +0200
Message-ID: <CACRpkdZMCzry4gKPi7wtayCRBrhAkS5hkBjBTwZwbkuLiESzfw@mail.gmail.com>
References: <20180627114904.10890-1-paul@crapouillou.net> <20180627114904.10890-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627114904.10890-4-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 27, 2018 at 1:49 PM Paul Cercueil <paul@crapouillou.net> wrote:

> The .gpio_set_direction() callback was setting inverted direction
> for SoCs older than the JZ4770, this restores the correct behaviour.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

As you pointed out that this was an important fix I picked it
out and applied for fixes (v4.18) before looking at the rest of
the patches.

Yours,
Linus Walleij
