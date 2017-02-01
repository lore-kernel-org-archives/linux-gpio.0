From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] gpio: 104-idio-16: Remove unnecessary driver_data set
Date: Wed, 1 Feb 2017 14:23:59 +0100
Message-ID: <CACRpkdZBctbHV2+8LJVO0eku-nFGa6R+92h-Eg_7S6FxTAOThw@mail.gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com> <2c89ad9a9c55346e1187c05bca5eac62ce0df0ac.1485786703.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2c89ad9a9c55346e1187c05bca5eac62ce0df0ac.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2017 at 3:39 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Setting driver_data was necessary to access private data in the
> idio_16_remove function. Now that the idio_16_remove function is gone,
> driver_data is no longer used. This patch removes the relevant code.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
