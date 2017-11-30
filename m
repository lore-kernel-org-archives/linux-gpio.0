From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 74x164: Fix crash during .remove()
Date: Thu, 30 Nov 2017 15:32:00 +0100
Message-ID: <CACRpkdZAVhxF5HJhx0nBqeiinCJPzGQ3q8sGyripO11bVWJXyQ@mail.gmail.com>
References: <1511273890-552-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511273890-552-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 21, 2017 at 3:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commit 7ebc194d0fd4bb0f ("gpio: 74x164: Introduce 'enable-gpios'
> property") added a new member gpiod_oe to the end of the struct
> gen_74x164_chip, after the zero-length buffer array.
>
> However, this buffer is a flexible array, allocated together with the
> structure during .probe().  As the buffer is no longer the last member,
> writing to it corrupts the newly added member after it.
> During device removal, the corrupted member will be used as a pointer,
> leading to a crash.
>
> This went unnoticed, as the flexible array was declared as "buffer[0]"
> instead of "buffer[]", and thus did not trigger a "flexible array member
> not at end of struct" error from gcc.
>
> Move the gpiod_oe field up to fix this, and drop the zero from the array
> size to prevent future similar bugs.
>
> Fixes: 7ebc194d0fd4bb0f ("gpio: 74x164: Introduce 'enable-gpios' property")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied for fixes with Fabio's ACK.

Yours,
Linus Walleij
