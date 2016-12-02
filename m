From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: sx150x: access the correct bits in the 4-bit
 regs of sx150[147]
Date: Fri, 2 Dec 2016 14:00:24 +0100
Message-ID: <CACRpkdaPzrvez2a-8N_GgrX6LgebNvz-Eb8yc6tUcrX7+CrMQA@mail.gmail.com>
References: <1480675876-19540-1-git-send-email-peda@axentia.se> <1480675876-19540-2-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480675876-19540-2-git-send-email-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 2, 2016 at 11:51 AM, Peter Rosin <peda@axentia.se> wrote:

> The code assumes 8-bit or 16-bit width registers, but three of the
> chips (sx1501/sx1504/sx1507) are 4-bit. So, try to handle 4-bit chips as
> well, they leave the high part of each register unused.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Patch applied.

Yours,
Linus Walleij
