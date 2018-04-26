From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: pcie-idio-24: Fix port memory offset for
 get_multiple/set_multiple callbacks
Date: Fri, 27 Apr 2018 00:56:40 +0200
Message-ID: <CACRpkdb-K1M4MEx8oj9jkkQt27JxkEn=BLB-NAy-HH2XCUyETA@mail.gmail.com>
References: <cover.1524000042.git.vilhelm.gray@gmail.com> <00c65eb82280318e6d50f0c54fab4efd708beafa.1524000042.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00c65eb82280318e6d50f0c54fab4efd708beafa.1524000042.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 18, 2018 at 2:53 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ioread8/iowrite8 functions expect a memory offset argument. This
> patch fixes the ports array to provide the memory addresses of the
> respective device I/O registers.
>
> Fixes: ca37081595a2 ("gpio: pcie-idio-24: Implement get_multiple/set_multiple callbacks")
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
