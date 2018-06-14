From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max732x: add error handling for i2c_new_dummy
Date: Thu, 14 Jun 2018 16:27:25 +0200
Message-ID: <CACRpkdbjMLiJtxUpuSuvOBKD-rbybF8baJUBjvP6Hv5baeWY7w@mail.gmail.com>
References: <1528774132-38287-1-git-send-email-jiazhouyang09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528774132-38287-1-git-send-email-jiazhouyang09@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 12, 2018 at 5:28 AM, Zhouyang Jia <jiazhouyang09@gmail.com> wrote:

> When i2c_new_dummy fails, the lack of error-handling code may
> cause unexpected results.
>
> This patch adds error-handling code after calling i2c_new_dummy.
>
> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>

Patch applied for non-critical fixes.

Yours,
Linus Walleij
