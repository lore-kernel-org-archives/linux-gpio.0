From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pcie-idio-24: Fix off-by-one error in get_multiple loop
Date: Mon, 30 Apr 2018 10:48:52 +0200
Message-ID: <CACRpkdZo6wDP7fcA_x1=4mY2TtespprJ=pkTpLL2QUF7Mcv==w@mail.gmail.com>
References: <20180420135020.23423-1-vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180420135020.23423-1-vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 20, 2018 at 3:50 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The PCIe-IDIO-24 features 8 bits of TTL GPIO which may be configured for
> output or input. This patch fixes an off-by-one error in the loop
> conditional for the get_multiple callback so that the TTL GPIO are
> handled.
>
> Fixes: ca37081595a2 ("gpio: pcie-idio-24: Implement get_multiple/set_multiple callbacks")
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
