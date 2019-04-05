From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: axp209: Fix NULL pointer dereference after allocation
Date: Fri, 5 Apr 2019 10:36:25 +0700
Message-ID: <CACRpkdbnD8-VWjx2_JvtAhgupEB3YX7KJ7frMwBbTujEyc9Q6w@mail.gmail.com>
References: <20190312151911.2207-1-pakki001@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312151911.2207-1-pakki001@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Aditya Pakki <pakki001@umn.edu>
Cc: Kangjie Lu <kjlu@umn.edu>, Chen-Yu Tsai <wens@csie.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 12, 2019 at 10:19 PM Aditya Pakki <pakki001@umn.edu> wrote:

> axp20x_build_funcs_groups allocates groups via devm_kcalloc and tries to
> dereference without checking for NULL. This patch avoids such a
> scenario.
>
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>

Patch applied.

Yours,
Linus Walleij
